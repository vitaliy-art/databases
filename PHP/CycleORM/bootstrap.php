<?php

declare(strict_types=1);
require_once 'vendor/autoload.php';

use Cycle\Database;
use Cycle\Database\Config;
use Cycle\Schema;
use Cycle\Annotated;
use Cycle\ORM;

$dbal = new Database\DatabaseManager(
    new Config\DatabaseConfig([
        'default' => 'default',
        'databases' => [
            'default' => ['connection' => 'sqlite'],
        ],
        'connections' => [
            'sqlite' => new Config\SQLiteDriverConfig(
                connection: new Config\SQLite\FileConnectionConfig(database: 'db.bd'),
            ),
        ],
    ]),
);

$dbal->database('default')->execute('PRAGMA foreign_keys = ON;');

$finder = (new \Symfony\Component\Finder\Finder())->files()->in([__DIR__ . '/src/Models']);
$classLocator = new \Spiral\Tokenizer\ClassLocator($finder);

$schema = (new Schema\Compiler())->compile(new Schema\Registry($dbal), [
    new Schema\Generator\ResetTables(),             // Reconfigure table schemas (deletes columns if necessary)
    new Annotated\Embeddings($classLocator),        // Recognize embeddable entities
    new Annotated\Entities($classLocator),          // Identify attributed entities
    new Annotated\TableInheritance(),               // Setup Single Table or Joined Table Inheritance
    new Annotated\MergeColumns(),                   // Integrate table #[Column] attributes
    new Schema\Generator\GenerateRelations(),       // Define entity relationships
    new Schema\Generator\GenerateModifiers(),       // Apply schema modifications
    new Schema\Generator\ValidateEntities(),        // Ensure entity schemas adhere to conventions
    new Schema\Generator\RenderTables(),            // Create table schemas
    new Schema\Generator\RenderRelations(),         // Establish keys and indexes for relationships
    new Schema\Generator\RenderModifiers(),         // Implement schema modifications
    new Annotated\MergeIndexes(),                   // Merge table index attributes
    new Schema\Generator\SyncTables(),              // Align table changes with the database
    new Schema\Generator\GenerateTypecast(),        // Typecast non-string columns
]);

$orm = new ORM\ORM(new ORM\Factory($dbal), new ORM\Schema($schema));
