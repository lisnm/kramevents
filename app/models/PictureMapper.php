<?php

namespace App\Models;

require_once("Mapper.php");
require_once("PictureModel.php");
require_once("PictureCollection.php");


/**
 * Class PictureMapper
 * @package App\Models
 */
class PictureMapper extends Mapper
{
    private $selectStmt;
    private $selectByEventStmt;
    private $selectAllStmt;
    private $updateStmt;
    private $insertStmt;

    /**
     * PictureMapper constructor.
     */
    public function __construct()
    {
        // вызов родительского конструктора
        parent::__construct();

        $this->selectStmt = $this->pdo->prepare(
            "SELECT * FROM pictures WHERE id=?"
        );

        $this->selectByEventStmt = $this->pdo->prepare(
            "SELECT * FROM pictures WHERE event_id=?"
        );

        $this->selectAllStmt = $this->pdo->prepare(
            "SELECT * FROM pictures"
        );

        $this->updateStmt = $this->pdo->prepare(
            "UPDATE pictures SET event_id=?, picture_url=? WHERE id=?"
        );

        $this->insertStmt = $this->pdo->prepare(
            "INSERT INTO `pictures`(`event_id`, `picture_url`) VALUES (?,?)"
        );
    }

    /**
     * @return \PDOStatement
     */
    public function selectAllStmt()
    {
        return $this->selectAllStmt;
    }

    public function findPicturesByEvent($event_id)
    {
        $this->selectByEventStmt()->execute([$event_id]);
        $row = $this->selectByEventStmt()->fetchAll();
        $this->selectByEventStmt()->closeCursor();

        if (!is_array($row)) {
            return null;
        }

        if (empty($row)) {
            return null;
        }

        return $this->getCollection($row);
    }

    /**
     * @return \PDOStatement
     */
    public function selectByEventStmt()
    {
        return $this->selectByEventStmt;
    }

    /**
     * @return \PDOStatement
     */
    public function selectStmt()
    {
        return $this->selectStmt;
    }

    /**
     * @param array $raw
     * @return PictureCollection
     */
    public function getCollection(array $raw)
    {
        return new PictureCollection($raw, $this);
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
            $object->getParentId(),
            $object->getPicture(),
            $object->getId()
        ];

        $this->updateStmt->execute($values);
    }

    /**
     * @return string
     */
    protected function targetClass()
    {
        return PictureModel::class;
    }

    /**
     * @param array $raw
     * @return PictureModel
     */
    protected function doCreateObject(array $raw)
    {
        $obj = new PictureModel(
            (int)$raw['id'],
            (int)$raw['event_id'],
            $raw['picture_url']
        );
        return $obj;
    }

    /**
     * @param Model $object
     */
    protected function doInsert(Model $object)
    {
        $values = [$object->getParentId(),$object->getPicture()];
        $this->insertStmt->execute($values);
        $id = $this->pdo->lastInsertId();
        $object->setId((int)$id);
    }
}
