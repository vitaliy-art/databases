<?php

namespace Services;

use DateTime;
use Doctrine\ORM\EntityManager;
use Models\Department;
use Models\Person;
use Models\Employee;
use Models\Position;

class EntityService
{
    public function __construct(private EntityManager $entityManager)
    {
        $this->entityManager = $entityManager;
    }

    private function get_entity(int | string $id, string $entity_name): mixed
    {
        $repo = $this->entityManager->getRepository($entity_name);
        $entity = $repo->find($id);
        return $entity;
    }

    public function get_department(int $id): Department
    {
        $entity_name = Department::class;

        /** @var Department */
        $dep = $this->get_entity($id, $entity_name);
        return $dep;
    }

    public function get_person(string $id): Person
    {
        $entity_name = Person::class;

        /** @var Person */
        $per = $this->get_entity($id, $entity_name);
        return $per;
    }

    public function get_employee(string $id): Employee
    {
        $entity_name = Employee::class;

        /** @var Employee */
        $emp = $this->get_entity($id, $entity_name);
        return $emp;
    }

    private function add_new(mixed $entity)
    {
        $this->entityManager->persist($entity);
        $this->entityManager->flush($entity);
    }

    public function add_new_department(string $name): Department
    {
        $dep = new Department($name);
        $this->add_new($dep);
        return $dep;
    }

    public function add_new_person(string $name, string $address, DateTime $birth_date): Person
    {
        $per = new Person($name, $address, $birth_date);
        $this->add_new($per);
        return $per;
    }

    public function add_new_employee(Person $per, Department $dep, Position $pos): Employee
    {
        $emp = new Employee($per, $dep, $pos);
        $this->add_new($emp);
        return $emp;
    }

    public function add_new_employee_and_person(Department $dep, string $name, string $address, DateTime $birth_date, Position $pos): Employee
    {
        $per = $this->add_new_person($name, $address, $birth_date);
        return $this->add_new_employee($per, $dep, $pos);
    }

    public function update_entity(mixed $entity)
    {
        $this->entityManager->flush($entity);
    }

    /**
     * @param string $entity_name
     * @return array<int, object>
     */
    private function get_all(string $entity_name): array
    {
        $rep = $this->entityManager->getRepository($entity_name);
        $entities = $rep->findAll();
        return $entities;
    }

    /**
     * @return array<int, Department>
     */
    public function get_all_departments(): array
    {
        return $this->get_all(Department::class);
    }

    /**
     * @return array<int, Person>
     */
    public function get_all_persons(): array
    {
        return $this->get_all(Person::class);
    }

    /**
     * @return array<int, Employee>
     */
    public function get_all_employee(): array
    {
        return $this->get_all(Employee::class);
    }

    public function remove(mixed $entity)
    {
        $this->entityManager->remove($entity);
        $this->entityManager->flush($entity);
    }

    public function remove_range(array $entities)
    {
        if ($entities && count($entities) == 0)
            return;

        foreach ($entities as $entity)
            $this->entityManager->remove($entity);

        $this->entityManager->flush($entities);
    }
}
