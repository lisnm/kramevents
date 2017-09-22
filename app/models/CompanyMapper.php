<?php

namespace App\Models;
require_once("Mapper.php");
require_once("CompanyMapper.php");
require_once("CompanyCollection.php");

class CompanyMapper extends Mapper
{

    private $selectStmt;
    private $selectAllStmt;
    private $updateStmt;
    private $insertStmt;
    private $deleteStmt;

    /**
     * CompanyMapper constructor.
     */
    public function __construct()
    {
        // вызов родительского конструктора
        parent::__construct();

        $this->selectStmt = $this->pdo->prepare(
            "SELECT * FROM companies WHERE id=?"
        );

        $this->selectAllStmt = $this->pdo->prepare(
            "SELECT * FROM companies"
        );

        $this->updateStmt = $this->pdo->prepare(
            "UPDATE companies SET fullname=?,description=?, place_id=?, email=?, www=?, picture_url=?, id=? WHERE id=?"
        );

        $this->insertStmt = $this->pdo->prepare(
            "INSERT INTO companies (fullname, description, place_id, email, www, picture_url) VALUES( ?,?,?,?,?,? )"
        );

        $this->deleteStmt = $this->pdo->prepare(
            "DELETE FROM companies WHERE id=?"
        );
    }

    /**
     * @param array $raw
     * @return CompanyCollection
     */
    public function getCollection(array $raw)
    {
        return new CompanyCollection($raw, $this);
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
            $object->getFullName(),
            $object->getDescription(),
            $object->getPlaceId(),
            $object->getEmail(),
            $object->getWww(),
            $object->getLogo()
        ];

        $this->updateStmt->execute($values);
    }

    /**
     * @return string
     */
    protected function targetClass()
    {
        return CompanyModel::class;
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
     * @return CompanyModel
     */
    protected function doCreateObject(array $raw)
    {
        $object = new CompanyModel(
            (int)$raw['id'],
            $raw['full_name'],
            $raw['description'],
            $raw['latitude'],
            $raw['place_id'],
            $raw['email'],
            $raw['url'],
            $raw['logo']
        );

        return $object;
    }

    /**
     * @param Model $object
     */
    protected function doInsert(Model $object)
    {
        $values = [
            $object->getFullName(),
            $object->getDescription(),
            $object->getPlaceId(),
            $object->getEmail(),
            $object->getUrl(),
            $object->getLogo()
        ];

        // вставка
        $this->insertStmt->execute($values);
        // сохранение Id после вставки
        $id = $this->pdo->lastInsertId();
        $object->setId((int)$id);
    }
}
