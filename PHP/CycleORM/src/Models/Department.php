<?php

namespace App\Models;

use Cycle\Annotated\Annotation\Entity;
use Cycle\Annotated\Annotation\Column;

#[Entity(table: 'departments')]
class Department
{
    #[Column(type: 'primary')]
    public int $id;

    public function __construct(
        #[Column(type: 'string')]
        public string $name,
    ){}

    public function __toString(): string
    {
        return "{ Department { Id: $this->id, Name: $this->name } }";
    }
}
