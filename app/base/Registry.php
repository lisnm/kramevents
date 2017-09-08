<?php

namespace App\Base;

require_once("ConfigLoader.php");
require_once(__DIR__."/../controllers/Request.php");
require_once("Config.php");

use App\Controllers\Request;

/**
 * Class Registry
 * @package App\Base
 *
 * Реестр приложения.
 */
class Registry
{
    private static $instance = null;
    private $request = null;
    private $config = null;
    private $pdo = null;
    private $config_loader = null;

    private function __construct()
    {
    }

    public static function instance()
    {
        if (is_null(self::$instance)) {
            self::$instance = new self();
        }

        return self::$instance;
    }

    public static function reset()
    {
        self::$instance = null;
    }

    // must be initialized by some smarter component

    public function getRequest()
    {
        if (is_null($this->request)) {
            throw new \Exception("No Request set");
        }

        return $this->request;
    }

    public function setRequest(Request $request)
    {
        $this->request = $request;
    }

    public function getConfigLoader()
    {
        if (is_null($this->config_loader)) {
            $this->config_loader = new ConfigLoader();
        }

        return $this->config_loader;
    }

    public function getPdo()
    {
        if (is_null($this->pdo)) {
            $dsn = $this->getDSN();

            if (is_null($dsn)) {
                throw new \Exception("No DSN");
            }

            $username = $this->getUsername();
            if (is_null($username)) {
                throw new \Exception("No username");
            }

            $password = $this->getPassword();
            if (is_null($password)) {
                throw new \Exception("No password");
            }
            $this->pdo = new \PDO($dsn, $username, $password);
            $this->pdo->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);
        }

        return $this->pdo;
    }

    public function getDSN()
    {
        $conf = $this->getConfig();
        return $conf->get("dsn");
    }

    public function getConfig()
    {
        if (is_null($this->config)) {
            $this->config = new Config();
        }

        return $this->config;
    }

    public function setConfig(Config $config)
    {
        $this->config = $config;
    }

    public function getUsername()
    {
        $conf = $this->getConfig();
        return $conf->get("db_username");
    }

    public function getPassword()
    {
        $conf = $this->getConfig();
        return $conf->get("db_password");
    }

    /**
     * Для singelton'a не разрешено клонирование
     *
     * @return void
     */
    private function __clone()
    {
    }
}
