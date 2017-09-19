<?php

namespace App\Models;
require_once("/../base/Registry.php");
require_once("Model.php");

use app\base\Registry;

/**
 * Class LocationModel
 * @package App\Models
 */
class LocationModel extends Model
{
    private $city;
    private $country;
    private $latitude;
    private $longitude;
    private $street;
    private $house;
    private $zip;

    /**
     * LocationModel constructor.
     * @param $id
     * @param $city
     * @param $country
     * @param $latitude
     * @param $longitude
     * @param null $street
     * @param null $house
     * @param null $zip
     */
    public function __construct($id, $city, $country, $latitude, $longitude, $street=null, $house=null, $zip=null)
    {
        $this->city = $city;
        $this->country = $country;
        $this->latitude = $latitude;
        $this->longitude = $longitude;
        $this->street = $street;
        $this->house = $house;
        $this->zip = $zip;
        parent::__construct($id);
    }

    /**
     * @return mixed
     */
    public function getCity()
    {
        return $this->city;
    }

    /**
     * @param mixed $city
     */
    public function setCity($city)
    {
        $this->city = $city;
    }

    /**
     * @return mixed
     */
    public function getCountry()
    {
        return $this->country;
    }

    /**
     * @param mixed $country
     */
    public function setCountry($country)
    {
        $this->country = $country;
    }

    /**
     * @return mixed
     */
    public function getLatitude()
    {
        return $this->latitude;
    }

    /**
     * @param mixed $latitude
     */
    public function setLatitude($latitude)
    {
        $this->latitude = $latitude;
    }

    /**
     * @return mixed
     */
    public function getLongitude()
    {
        return $this->longitude;
    }

    /**
     * @param mixed $longitude
     */
    public function setLongitude($longitude)
    {
        $this->longitude = $longitude;
    }

    /**
     * @return null
     */
    public function getStreet()
    {
        return $this->street;
    }

    /**
     * @param null $street
     */
    public function setStreet($street)
    {
        $this->street = $street;
    }

    /**
     * @return null
     */
    public function getHouse()
    {
        return $this->house;
    }

    /**
     * @param null $house
     */
    public function setHouse($house)
    {
        $this->house = $house;
    }

    /**
     * @return null
     */
    public function getZip()
    {
        return $this->zip;
    }

    /**
     * @param null $zip
     */
    public function setZip($zip)
    {
        $this->zip = $zip;
    }

}
