<?php
// Use for config database connection

use Doctrine\Common\Annotations\AnnotationReader;
use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Mapping\Driver\AnnotationDriver;

require_once "vendor/autoload.php";

$isDevMode = true;
$proxyDir = null;
$cache = null;
$useSimpleAnnotationReader = false;
$config = Setup::createAnnotationMetadataConfiguration(array(__DIR__."/src/Models"), $isDevMode, $proxyDir, $cache);
$paths = array(__DIR__."/src/Models");
$driver = new AnnotationDriver(new AnnotationReader(), $paths);
$config->setMetadataDriverImpl($driver);

$conn = array(
    'driver' => 'pdo_sqlite',
    'path' => __DIR__ . DIRECTORY_SEPARATOR . "bd.db",
);

$entityManager = EntityManager::create($conn, $config);

$sql = "PRAGMA foreign_keys = ON;";
$connection = $entityManager->getConnection();
$connection->exec($sql);
