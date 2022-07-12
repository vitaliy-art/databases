<?php

namespace Models;

use DateTime;
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
     * @ORM\GeneratedValue(strategy="CUSTOM")
     * @ORM\CustomIdGenerator(class="Helpers\UuidGenerator")
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

    public function __construct(string $name, string $address, DateTime $birth_date)
    {
        $this->name = $name;
        $this->address = $address;
        $this->birth_date = $birth_date;
    }

    public function __toString(): string
    {
        $birth = $this->birth_date->format('d-m-Y');
        return "Person { Id: $this->id, Name: $this->name, Address: $this->address, BirthDate: $birth }";
    }

    public function set_name(string $name)
    {
        $this->name = $name;
    }

    public function set_address(string $address)
    {
        $this->address = $address;
    }

    public function set_birth_date(DateTime $birth_date)
    {
        $this->birth_date = $birth_date;
    }
}
