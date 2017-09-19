<?php

namespace App\Models;
require_once("Collection.php");

/**
 * Class LocationCollection
 * @package App\Models
 */
class LocationCollection extends Collection
{
    /**
     * @return string
     */
    public function targetClass()
    {
        return EventModel::class;
    }
}
