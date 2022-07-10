<?php

namespace Traits;

trait EntityName
{
    public static function get_entity_name(): string
    {
        return basename(str_replace("\\", "/", static::class));
    }
}
