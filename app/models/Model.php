<?php

namespace App\Models;

/**
 * Class Model
 * @package App\Models
 */
abstract class Model
{
    private $id;

    /**
     * Model constructor.
     * @param $id
     */
    public function __construct($id)
    {
        $this->id = $id;
    }

    public function getId()
    {
        return $this->id;
    }

    public function setId($id)
    {
        $this->id = $id;
    }
}
