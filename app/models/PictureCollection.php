<?php

namespace App\Models;
require_once("Collection.php");

/**
 * Class PictureCollection
 * @package App\Models
 */
class PictureCollection extends Collection
{
    /**
     * @return string
     */
    public function targetClass()
    {
        return PictureModel::class;
    }
}
