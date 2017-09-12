<?php

namespace App\Models;
require_once("Collection.php");

/**
 * Class EventCollection
 * @package App\Models
 */
class EventCollection extends Collection
{
    /**
     * @return string
     */
    public function targetClass()
    {
        return EventModel::class;
    }
}
