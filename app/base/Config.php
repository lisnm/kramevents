<?php

namespace App\Base;

/**
 * Class Config
 * Класс с данными конфигурации.
 *
 * @package App\Base
 */

class Config
{
    private $values = [];

    /**
     * Config constructor.
     * @param array $values
     */
    public function __construct(array $values = [])
    {
        $this->values = $values;
    }

    /**
     * @param $key
     * @return mixed|null
     */
    public function get($key)
    {
        if (isset($this->values[$key])) {
            return $this->values[$key];
        }
        return null;
    }

    /**
     * @param $key
     * @param $value
     */
    public function set($key, $value)
    {
        $this->values[$key] = $value;
    }
}
