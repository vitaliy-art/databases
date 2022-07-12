<?php

use Models\Position;
use Services\EntityService;

require_once "bootstrap.php";
$entityService = new EntityService($entityManager);

echo 'Clean up database... ';
$departments = $entityService->get_all_departments();
$persons = $entityService->get_all_persons();
$employees = $entityService->get_all_employee();
$entityService->remove_range(array_merge($departments, $persons, $employees));
echo "done\n";

echo "\nAdd departments... ";
$dep_1 = $entityService->add_new_department('Department One');
$dep_2 = $entityService->add_new_department('Department Two');
echo "done\n";

echo "\nAdded departments:\n";
$departments = $entityService->get_all_departments();
foreach ($departments as $dep)
    echo "$dep\n";

echo "\nAdd persons... ";
$per_1 = $entityService->add_new_person("Ivan", "Moscow", (new DateTime())->setTimestamp(mktime(0, 0, 0, 10, 02, 1990)));
$per_2 = $entityService->add_new_person("John", "London", (new DateTime())->setTimestamp(mktime(0, 0, 0, 01, 14, 1998)));
echo "done\n";

echo "\nAdded persons:\n";
$persons = $entityService->get_all_persons();
foreach ($persons as $per)
    echo "$per\n";

echo "\nAdd employees... ";
$entityService->add_new_employee($per_1, $dep_1, Position::Staffer);
$entityService->add_new_employee($per_2, $dep_1, Position::Staffer);
$entityService->add_new_employee_and_person($dep_2, "Nick", "Berlin", (new DateTime())->setTimestamp(mktime(0, 0, 0, 02, 23, 1995)), Position::Manager);
$entityService->add_new_employee_and_person($dep_2, "Stan", "Oslo", (new DateTime())->setTimestamp(mktime(0, 0, 0, 04, 21, 1998)), POsition::Boss);
echo "done\n";

echo "\nAdded employees:\n";
$employees = $entityService->get_all_employee();
foreach ($employees as $emp)
    echo "$emp\n";

echo "\nDelete Department One... ";
$entityService->remove($dep_1);
echo "done\n";

echo "\nUpdate Department Two... ";
$dep_2->set_name("Department");
$entityService->update_entity($dep_2);
echo "done\n";

echo "\nUpdate Ivan... ";
$per_1->set_address("Tula");
$entityService->update_entity($per_1);
echo "done\n";

echo "\nRemain departments:\n";
$departments = $entityService->get_all_departments();
foreach ($departments as $dep)
    echo "$dep\n";

echo "\nRemain persons:\n";
$persons = $entityService->get_all_persons();
foreach ($persons as $per)
    echo "$per\n";

echo "\nRemain employees:\n";
$employees = $entityService->get_all_employee();
foreach ($employees as $emp)
    echo "$emp\n";

echo "\nDelete Department Two... ";
$entityService->remove($dep_2);
echo "done\n";

echo "\nRemain departments count: ";
$departments = $entityService->get_all_departments();
echo count($departments) . "\n";

echo "\nRemain persons:\n";
$persons = $entityService->get_all_persons();
foreach ($persons as $per)
    echo "$per\n";

echo "\nRemain employees count: ";
$employees = $entityService->get_all_employee();
echo count($employees) . "\n";

echo "\nDelete persons... ";
$entityService->remove_range($persons);
echo "done\n";

echo "\nRemain persons count: ";
$persons = $entityService->get_all_persons();
echo count($persons) . "\n";
