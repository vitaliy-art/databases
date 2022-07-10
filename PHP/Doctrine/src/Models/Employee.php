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
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity="Person", cascade={"remove"}, fetch="EAGER")
     * @var Person
     */
    private $person;

    /**
     * @ORM\ManyToOne(targetEntity="Department", cascade={"remove"}, fetch="EAGER")
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
        $this->position = $position;
    }

    public function __toString(): string
    {
        return "Employee { Id: " . $this->id . ", Person: " . $this->person . ", Department: " . $this->department . ", Position: " . $this->position->name . " }";
    }
}
