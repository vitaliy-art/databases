<?php

namespace Models;

use Doctrine\ORM\Mapping as ORM;
use Stringable;

/**
 * @ORM\Entity
 * @ORM\Table(name="people")
 */
class Person implements Stringable
{
    /**
     * @ORM\Id
     * @ORM\Column(type="guid")
     * @ORM\GeneratedValue
     */
    private $id;

    /**
     * @ORM\Column(type="string")
     */
    private $name;

    /**
     * @ORM\Column(type="string")
     */
    private $address;

    /**
     * @ORM\Column(type="date")
     */
    private $birth_date;

    public function __construct(string $name, string $address, string $birth_date)
    {
        $this->name = $name;
        $this->address = $address;
        $this->birth_date = $birth_date;
    }

    public function __toString(): string
    {
        return "Person { Id: $this->id, Name: $this->name, Address: $this->address, BirthDate $this->birth_date }";
    }
}
