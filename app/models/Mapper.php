<?php

namespace App\Models;
require_once("/../base/Registry.php");

use app\base\Registry;
/**
 * Class Mapper
 * @package App\Models
 */
abstract class Mapper
{
    protected $pdo;

    public function __construct()
    {
        $reg = Registry::instance();
        $this->pdo = $reg->getPdo();
    }

    public function find($id)
    {
        $this->selectstmt()->execute([$id]);
        $row = $this->selectstmt()->fetch();
        $this->selectstmt()->closeCursor();

        if (!is_array($row)) {
            return null;
        }

        if (!isset($row['id'])) {
            return null;
        }

        $object = $this->createObject($row);

        return $object;
    }

    abstract protected function selectStmt();

    public function createObject($raw)
    {
        $obj = $this->doCreateObject($raw);

        return $obj;
    }

    abstract protected function doCreateObject(array $raw);

    public function findAll()
    {
        $this->selectAllStmt()->execute([]);

        return $this->getCollection(
            $this->selectAllStmt()->fetchAll()
        );
    }

    abstract protected function selectAllStmt();

    abstract protected function getCollection(array $raw);

    public function insert(Model $obj)
    {
        $this->doInsert($obj);
    }

    abstract protected function doInsert(Model $object);

    abstract public function update(Model $object);

    abstract protected function targetClass();
}
