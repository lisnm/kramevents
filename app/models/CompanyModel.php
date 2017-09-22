<?php

namespace App\Models;
require_once("Model.php");

class CompanyModel extends Model
{
    private $full_name;
    private $description;
    private $place_id;
    private $email;
    private $url;
    private $logo;

    /**
     * CompanyModel constructor.
     * @param $id
     * @param $full_name
     * @param $description
     * @param $place_id
     * @param $email
     * @param $url
     * @param $logo
     */
    public function __construct($id, $full_name, $description, $place_id, $email, $url, $logo)
    {
        $this->full_name = $full_name;
        $this->description = $description;
        $this->place_id = $place_id;
        $this->email = $email;
        $this->url = $url;
        $this->logo = $logo;
        parent::__construct($id);
    }

    /**
     * @return mixed
     */
    public function getFullName()
    {
        return $this->full_name;
    }

    /**
     * @param mixed $fullname
     */
    public function setFullName($full_name)
    {
        $this->full_name = $full_name;
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
     */
    public function getPlaceId()
    {
        return $this->place_id;
    }

    /**
     * @param mixed $place_id
     */
    public function setPlaceId($place_id)
    {
        $this->place_id = $place_id;
    }

    /**
     * @return mixed
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * @param mixed $email
     */
    public function setEmail($email)
    {
        $this->email = $email;
    }

    /**
     * @return mixed
     */
    public function getUrl()
    {
        return $this->url;
    }

    /**
     * @param mixed $url
     */
    public function setUrl($url)
    {
        $this->url = $url;
    }

    /**
     * @return mixed
     */
    public function getLogo()
    {
        return $this->logo;
    }

    /**
     * @param mixed $logo
     */
    public function setLogo($logo)
    {
        $this->logo = $logo;
    }
}
