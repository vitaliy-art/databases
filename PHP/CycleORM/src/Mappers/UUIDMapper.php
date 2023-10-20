<?php

namespace App\Mappers;

use Cycle\ORM\Mapper\Mapper;
use Ramsey\Uuid\Uuid;

class UUIDMapper extends Mapper
{
    /**
     * @return string[]
     *
     * @psalm-return array{id: string}
     */
    public function nextPrimaryKey(): ?array
    {
        try {
            return ['id' => Uuid::uuid4()->toString()];
        } catch (\Exception $e) {
            throw new \Cycle\ORM\Exception\MapperException($e->getMessage(), $e->getCode(), $e);
        }
    }
}
