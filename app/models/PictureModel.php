<?php

namespace App\Models;
require_once("/../base/Registry.php");
require_once("Model.php");

/**
 * Class PictureModel
 * @package App\Models
 */
class PictureModel extends Model
{
    /**
     * @var - id родителя
     */
    private $parent_id;

    /**
     * @var - имя картинки
     */
    private $picture;

    /**
     * PictureModel constructor.
     * @param $id
     * @param $parent_id
     * @param $picture
     */
    public function __construct($id, $parent_id, $picture)
    {
        $this->parent_id = $parent_id;
        $this->picture = $picture;
        parent::__construct($id);
    }

    /**
     * @return mixed
     */
    public function getParentId()
    {
        return $this->parent_id;
    }

    /**
     * @param mixed $parent_id
     */
    public function setParentId($parent_id)
    {
        $this->parent_id = $parent_id;
    }

    /**
     * @return mixed
     */
    public function getPicture()
    {
        return $this->picture;
    }

    /**
     * @param mixed $picture
     */
    public function setPicture($picture)
    {
        $this->picture = $picture;
    }

}
