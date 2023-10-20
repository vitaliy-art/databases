<?php

namespace App\Models;

use App\Mappers\UUIDMapper;
use Cycle\Annotated\Annotation\Column;
use Cycle\Annotated\Annotation\Entity;
use Cycle\Annotated\Annotation\Relation\BelongsTo;

#[Entity(table: 'employees', mapper: UUIDMapper::class)]
class Employee
{
    #[Column(type: 'string(36)', primary: 'true')]
    public string $id;

    public function __construct(
        #[Column(type: 'enum(Staffer,Manager,Boss)')]
        public string $position,
        #[BelongsTo(target: Department::class, load: 'eager')]
        public ?Department $department,
        #[BelongsTo(target: Person::class, load: 'eager')]
        public ?Person $person,
    ){}

    public function __toString(): string
    {
        return "{ Employee: { Id: $this->id, Person: $this->person, Department: $this->department, Position: $this->position } }";
    }
}
