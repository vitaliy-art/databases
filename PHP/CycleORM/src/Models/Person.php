<?php

namespace App\Models;

use App\Mappers\UUIDMapper;
use Cycle\Annotated\Annotation\Entity;
use Cycle\Annotated\Annotation\Column;
use DateTimeImmutable;

#[Entity(table: 'people', mapper: UUIDMapper::class)]
class Person
{
    #[Column(type: 'string(36)', primary: 'true')]
    public string $id;

    public function __construct(
        #[Column(type: 'string')]
        public string $name,
        #[Column(type: 'string')]
        public string $address,
        #[Column(type: 'date')]
        public DateTimeImmutable $birth_date,
    ){}

    public function __toString(): string
    {
        $birth_date = $this->birth_date->format('Y-m-d');
        return "{ Person: { Id: $this->id, Name: $this->name, Address: $this->address, BirthDate: $birth_date } }";
    }
}
