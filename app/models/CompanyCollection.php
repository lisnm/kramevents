<?php

namespace App\Models;
require_once("Collection.php");

class CompanyCollection extends Collection
{
    /**
     * @return string
     */
    public function targetClass()
    {
        return CompanyModel::class;
    }
}
