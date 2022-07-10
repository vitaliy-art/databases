<?php

namespace Models;

use Doctrine\ORM\Mapping as ORM;
use Stringable;

/**
 * @ORM\Entity
 * @ORM\Table(name="departments")
 */
class Department implements Stringable
{
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue
     */
    private $id;

    /**
     * @ORM\Column(type="string")
     */
    private $name;

    public function __construct(string $name)
    {
        $this->name = $name;
    }

    public function __toString(): string
    {
        return "Department { Id: $this->id, Name: $this->name }";
    }
}
