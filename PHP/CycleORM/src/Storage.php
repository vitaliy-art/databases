<?php

namespace App;

use App\Enums\Position;
use App\Models\Department;
use App\Models\Employee;
use App\Models\Person;
use Cycle\ORM\EntityManager;
use Cycle\ORM\EntityManagerInterface;
use Cycle\ORM\ORM;

class Storage
{
    private EntityManagerInterface $entityManager;

    public function __construct(
        private ORM $orm,
    ){
        $this->entityManager = new EntityManager($orm);
    }

    public function addDepartment(string $name): Department
    {
        $department = new Department(name: $name);
        $this->entityManager->persist($department)->run();
        return $department;
    }

    public function addPerson(string $name, string $address, \DateTimeImmutable $birthDate): Person
    {
        $person = new Person(name: $name, address: $address, birth_date: $birthDate);
        $this->entityManager->persist($person)->run();
        return $person;
    }

    public function addEmployee(Person $person, Department $department, Position $position): Employee
    {
        $employee = new Employee(position: $position->name, department: $department, person: $person);
        $this->entityManager->persist($employee)->run();
        return $employee;
    }

    public function addEmployeeWithPerson(string $name, string $address, \DateTimeImmutable $birthDate, Department $department, Position $position): Employee
    {
        $person = $this->addPerson(name: $name, address: $address, birthDate: $birthDate);
        return $this->addEmployee(person: $person, department: $department, position: $position);
    }

    public function update(object $entity): void
    {
        $this->entityManager->persist($entity)->run();
    }

    /**
     * @psalm-return iterable<mixed, object>
     */
    public function getAll(string $className): iterable
    {
        $repository = $this->orm->getRepository($className);
        return $repository->findAll();
    }

    public function delete(object $entity): void
    {
        $this->entityManager->delete($entity)->run();
    }

    /**
     * @return void
     */
    public function deleteMany(iterable $entities)
    {
        if (count($entities) == 0) {
            return;
        }

        foreach ($entities as $entity) {
            $this->delete(entity: $entity);
        }
    }
}
