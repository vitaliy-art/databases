<?php

namespace App;

use App\Enums\Position;
use App\Models\Department;
use App\Models\Employee;
use App\Models\Person;
use DateTimeImmutable;

require_once 'bootstrap.php';

function log(string $msg): void { echo $msg; }
function logLine(string $msg = ''): void { echo "$msg\n"; }

$storage = new Storage(orm: $orm);

log('Clean up database... ');
$departments = $storage->getAll(Department::class);
$people = $storage->getAll(Person::class);
$employees = $storage->getAll(Employee::class);
$storage->deleteMany(entities: array_merge($departments, $people, $employees));
logLine('done');
logLine();

log('Add departments... ');
$dep1 = $storage->addDepartment(name: 'Department One');
$dep2 = $storage->addDepartment(name: 'Department Two');
logLine('done');
logLine();

logLine('Added departments:');
$departments = $storage->getAll(Department::class);
foreach ($departments as $department) {
    logLine("$department");
}
logLine();

log('Add people... ');
$per1 = $storage->addPerson(name: 'Ivan', address: 'Moscow', birthDate: DateTimeImmutable::createFromFormat('d-m-Y', '02-10-1990'));
$per2 = $storage->addPerson(name: 'John', address: 'London', birthDate: DateTimeImmutable::createFromFormat('d-m-Y', '14-01-1998'));
logLine('done');
logLine();

logLine('Added people:');
$people = $storage->getAll(Person::class);
foreach ($people as $person) {
    logLine("$person");
}
logLine();

log('Add employees... ');
$storage->addEmployee(person: $per1, department: $dep1, position: Position::Staffer);
$storage->addEmployee(person: $per2, department: $dep1, position: Position:: Staffer);
$storage->addEmployeeWithPerson(
    name: 'Nick', address: 'Berlin', department: $dep2, position: Position::Manager,
    birthDate: DateTimeImmutable::createFromFormat('d-m-Y', '23-02-1995'),
);
$storage->addEmployeeWithPerson(
    name: 'Stan', address: 'Oslo', department: $dep2, position: Position::Boss,
    birthDate: DateTimeImmutable::createFromFormat('d-m-Y', '21-04-1988'),
);
logLine('done');
logLine();

logLine('Added employees:');
$employees = $storage->getAll(Employee::class);
foreach ($employees as $employee) {
    logLine("$employee");
}
logLine();

log('Delete Department One... ');
$storage->delete($dep1);
logLine('done');
logLine();

log('Update Department Two... ');
$dep2->name = 'Department';
$storage->update($dep2);
logLine('done');
logLine();

log('Update Ivan... ');
$per1->address = 'Tula';
$storage->update($per1);
logLine('done');
logLine();

logLine('Remain departments:');
$departments = $storage->getAll(Department::class);
foreach ($departments as $department) {
    logLine("$department");
}
logLine();

logLine('Remain people:');
$people = $storage->getAll(Person::class);
foreach ($people as $person) {
    logLine("$person");
}
logLine();

logLine('Remain employees:');
$employees = $storage->getAll(Employee::class);
foreach ($employees as $employee) {
    logLine("$employee");
}
logLine();

log('Delete Department Two... ');
$storage->delete($dep2);
logLine('done');
logLine();

$departments = $storage->getAll(Department::class);
$depCount = count($departments);
logLine("Remain departments count: $depCount");
logLine();

$people = $storage->getAll(Person::class);
$perCount = count($people);
logLine("Remain people count: $perCount");
logLine();

$employees = $storage->getAll(Employee::class);
$empCount = count($employees);
logLine("Remain employees count: $empCount");
logLine();

log('Delete people... ');
$storage->deleteMany($people);
logLine('done');
logLine();

$people = $storage->getAll(Person::class);
$perCount = count($people);
logLine("Remain people count: $perCount");
