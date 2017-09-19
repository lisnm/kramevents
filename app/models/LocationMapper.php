<?php

namespace App\Models;

require_once("Mapper.php");
require_once("LocationModel.php");
require_once("LocationCollection.php");

/**
 * Class LocationMapper
 * @package App\Models
 */
class LocationMapper extends Mapper
{
    private $selectStmt;
    private $selectAllStmt;
    private $updateStmt;
    private $insertStmt;

    /**
     * LocationMapper constructor.
     */
    public function __construct()
    {
        // вызов родительского конструктора
        parent::__construct();

        $this->selectStmt = $this->pdo->prepare(
            "SELECT * FROM location WHERE id=?"
        );

        $this->selectAllStmt = $this->pdo->prepare(
            "SELECT * FROM location"
        );

        $this->updateStmt = $this->pdo->prepare(
            "UPDATE location SET city=?,country=?, latitude=?, longitude=?,street=?, house=?,zip=?, id=? WHERE id=?"
        );

        $this->insertStmt = $this->pdo->prepare(
            "INSERT INTO location ( city, country, latitude, longitude, street, house, zip ) VALUES( ?,?,?,?,?,?,? )"
        );

        $this->deleteStmt = $this->pdo->prepare(
            "DELETE FROM location WHERE id=?"
        );
    }

    /**
     * @param array $raw
     * @return EventCollection
     */
    public function getCollection(array $raw)
    {
        return new LocationCollection($raw, $this);
    }

    /**
     * @param Model $object
     * @throws \Exception
     */
    public function update(Model $object)
    {
        $class = $this->targetClass();

        if (!($object instanceof $class)) {
            throw new \Exception("This is a {$class} model");
        }

        $values = [
            $object->getCity(),
            $object->getCountry(),
            $object->getLatitude(),
            $object->getLongitude(),
            $object->getStreet(),
            $object->getHouse(),
            $object->getZip(),
            $object->getId(),
            $object->getId()
        ];

        $this->updateStmt->execute($values);
    }

    /**
     * @return string
     */
    protected function targetClass()
    {
        return LocationModel::class;
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
     * @return \PDOStatement
     */
    public function deleteStmt()
    {
        return $this->deleteStmt;
    }

    /**
     * @param array $raw
     * @return LocationModel
     */
    protected function doCreateObject(array $raw)
    {
        $object = new LocationModel(
            (int)$raw['id'],
            $raw['city'],
            $raw['country'],
            $raw['latitude'],
            $raw['longitude'],
            $raw['street'],
            $raw['house'],
            $raw['zip']
        );

        return $object;
    }

    /**
     * @param Model $object
     */
    protected function doInsert(Model $object)
    {
        $values = [
            $object->getCity(),
            $object->getCountry(),
            $object->getLatitude(),
            $object->getLongitude(),
            $object->getStreet(),
            $object->getHouse(),
            $object->getZip()
        ];

        // вставка
        $this->insertStmt->execute($values);
        // сохранение Id после вставки
        $id = $this->pdo->lastInsertId();
        $object->setId((int)$id);
    }
}
