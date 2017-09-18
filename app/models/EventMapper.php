<?php

namespace App\Models;

require_once("Mapper.php");
require_once("EventModel.php");
require_once("EventCollection.php");
require_once("PictureMapper.php");

/**
 * Class EventMapper
 * @package App\Models
 */
class EventMapper extends Mapper
{
    private $selectStmt;
    private $selectAllStmt;
    private $updateStmt;
    private $insertStmt;

    /**
     * EventMapper constructor.
     */
    public function __construct()
    {
        // вызов родительского конструктора
        parent::__construct();

        $this->selectStmt = $this->pdo->prepare(
            "SELECT * FROM events WHERE id=?"
        );

        $this->selectAllStmt = $this->pdo->prepare(
            "SELECT * FROM events"
        );

        $this->updateStmt = $this->pdo->prepare(
            "UPDATE events SET name=?, id=? WHERE id=?"
        );

        $this->insertStmt = $this->pdo->prepare(
            "INSERT INTO events ( name ) VALUES( ? )"
        );
    }

    /**
     * @param array $raw
     * @return EventCollection
     */
    public function getCollection(array $raw)
    {
        return new EventCollection($raw, $this);
    }

    /**
     * @param Model $object
     */
    public function update(Model $object)
    {
        $class = $this->targetClass();

        if (!($object instanceof $class)) {
            throw new \Exception("This is a {$class} model");
        }

        $values = [
            $object->getTitle(),
            $object->getId(),
            $object->getId()
        ];

        $this->updateStmt->execute($values);
    }

    /**
     * @return \PDOStatement
     */
    public function selectStmt()
    {
        return $this->selectStmt;
    }

    /**
     * @return \PDOStatement
     */
    public function selectAllStmt()
    {
        return $this->selectAllStmt;
    }

    /**
     * @return string
     */
    protected function targetClass()
    {
        return EventModel::class;
    }

    /**
     * @param array $raw
     * @return EventModel
     */
    protected function doCreateObject(array $raw)
    {
        $obj = new EventModel(
            (int)$raw['id'],
            $raw['title']
        );

        $obj->setDescription($raw["description"]);
        $obj->setCategory($raw["category_id"]); //todo
        $obj->setDateStart($raw["date_start"]);
        $obj->setDateEnd($raw["date_end"]);
        $obj->setPlace($raw["place_id"]);   //todo
        $obj->setCompany($raw["company_id"]);   //todo

        //TODO: добавить объекты Place и Company

        //$obj->setSubCategory($sub_category);
        //$company = new CompanyModel();
        //$obj->setCompany($company)
        $pict_map = new PictureMapper();
        $pictures = $pict_map->findPicturesByEvent($raw['id']);
        $obj->setPictures($pictures);
        // $place = new PlaceModel();
        // $obj->setPlace($place);

        return $obj;
    }


    /**
     * @param Model $object
     */
    protected function doInsert(Model $object)
    {
        $values = [$object->getTitle()];
        $this->insertStmt->execute($values);
        $id = $this->pdo->lastInsertId();
        $object->setId((int)$id);
    }
}
