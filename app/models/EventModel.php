<?php

namespace App\Models;
require_once("/../base/Registry.php");
require_once("Model.php");
require_once("PictureModel.php");

use app\base\Registry;

define('MAX_TITLE', '30');
define('MAX_DESCRIPTION', '120');
/**
 * Class EventModel
 * @package App\Models
 */
class EventModel extends Model
{
    private $title;
    private $description;
    private $category;
    private $sub_category;
    private $date_start;
    private $date_end;
    private $place = null;
    private $company = null;
    private $pictures = null;

    /**
     * EventModel constructor.
     * @param $id
     * @param $title
     */
    public function __construct($id, $title)
    {
        $this->title = $title;
        parent::__construct($id);
    }

    /**
     * @return mixed
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * @param mixed $description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * @return mixed
     *
     * Возвращает часть описания.
     */
    public function getShortDescription()
    {
        return $this->getShortest($this->description,MAX_DESCRIPTION);
    }

    /**
     * @return mixed
     */
    public function getSubCategory()
    {
        return $this->sub_category;
    }

    /**
     * @param mixed $sub_category
     */
    public function setSubCategory($sub_category)
    {
        $this->sub_category = $sub_category;
    }

    /**
     * @return mixed
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * @param mixed $category
     */
    public function setCategory($category)
    {
        $this->category = $category;
    }

    /**
     * @return mixed
     */
    public function getDateStart()
    {
        return $this->date_start;
    }

    /**
     * @param mixed $date_start
     */
    public function setDateStart($date_start)
    {
        $this->date_start = $date_start;
    }

    /**
     * @return mixed
     */
    public function getDateEnd()
    {
        return $this->date_end;
    }

    /**
     * @param mixed $date_end
     */
    public function setDateEnd($date_end)
    {
        $this->date_end = $date_end;
    }

    /**
     * @return null
     */
    public function getCompany()
    {
        return $this->company;
    }

    /**
     * @param null $company
     */
    public function setCompany($company)
    {
        $this->company = $company;
    }

    /**
     * @return null
     */
    public function getPlaces()
    {
        if (is_null($this->place)) {
            $reg = Registry::instance();
            $this->place = $reg->getPlace();
        }

        return $this->place;
    }

    /**
     * @param $space
     */
    public function setPlaces($space)
    {
        $this->place = $space;
    }

    /**
     * @param Place $space
     */
    public function addPlace(Place $space)
    {
        $this->getPlace()->add($space);
        $space->setVenue($this);
    }

    /**
     * @return null
     */
    public function getPlace()
    {
        return $this->place;
    }

    /**
     * @param null $place
     */
    public function setPlace($place)
    {
        $this->place = $place;
    }

    /**
     * @return mixed
     */
    public function getPlaces2()
    {
        if (is_null($this->places)) {
            $reg = Registry::instance();
            $finder = $reg->getPlaceMapper();
            $this->places = $finder->findByEvent($this->getId());
        }

        return $this->places;
    }

    /**
     * @return mixed
     */
    public function getFinder()
    {
        $reg = Registry::instance();
        return $reg->getEventMapper();
    }

    /**
     * @return mixed
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * @param $title
     */
    public function setTitle($title)
    {
        $this->title = $title;
        $this->markDirty();
    }

    /**
     * @return mixed
     */
    public function getShortTitle()
    {
        return $this->getShortest($this->title, MAX_TITLE);
    }

    /**
     * @param $str :string
     * @param $max_len :int
     * @return string
     */
    private function getShortest($str, $max_len)
    {
        $ellipsis = '...';
        if (mb_strlen($str) > (int)$max_len)
            return mb_substr($str, null,(int)$max_len - mb_strlen($ellipsis)) . $ellipsis;
        return $str;
    }

    public function getMainPicture()
    {
        $pictures = $this->getPictures();
        if (empty($pictures)) {
            return null;
        }
        return $pictures->current()->getPicture();
    }

    /**
     * @return null
     */
    public function getPictures()
    {
        if (isset($this->pictures)) {
            return $this->pictures;
        }
        return null;
    }

    /**
     * @param null $pictures
     */
    public function setPictures($pictures)
    {
        $this->pictures = $pictures;
    }
}
