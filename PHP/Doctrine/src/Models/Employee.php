<?php

namespace Models;

use Doctrine\ORM\Mapping as ORM;
use Models\Position;

/**
 * @ORM\Entity
 * @ORM\Table(name="employees")
 */
class Employee // implements Stringable
{
    /**
     * @ORM\Id
     * @ORM\Column(type="string")
     * @ORM\GeneratedValue(strategy="CUSTOM")
     * @ORM\CustomIdGenerator(class="Helpers\UuidGenerator")
     */
    private $id;

    /**
     * @ORM\ManyToOne(Person::class, fetch="EAGER")
     * @ORM\JoinColumn(name="person_id", referencedColumnName="id", onDelete="CASCADE", nullable=false)
     * @var Person
     */
    private $person;

    /**
     * @ORM\ManyToOne(Department::class, fetch="EAGER")
     * @ORM\JoinColumn(name="department_id", referencedColumnName="id", onDelete="CASCADE", nullable=false)
     * @var Department
     */
    private $department;

    /**
     * @ORM\Column(type="string")
     * @var Position
     */
    private $position;

    public function __construct(Person $person, Department $department, Position $position)
    {
        $this->person = $person;
        $this->department = $department;
        $this->position = $position->name;
    }

    public function __toString(): string
    {
        return "Employee { Id: $this->id, Person: $this->person, Department: $this->department, Position: $this->position }";
    }

    public function set_person(Person $person)
    {
        $this->person = $person;
    }

    public function set_department(Department $department)
    {
        $this->department = $department;
    }

    public function set_position(Position $position)
    {
        $this->position = $position->name;
    }
}
