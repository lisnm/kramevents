<?php

namespace App\Base;

require_once("Registry.php");
require_once("Config.php");
require_once(__DIR__."/../controllers/Request.php");

/**
 * Class ConfigLoader
 * @package App\Base
 *
 * Читает файл конфигурации и загружает значения в реестр.
 */
class ConfigLoader
{
    private $config_path = __DIR__ . "/../../config/config.json";
    private $reg;

    public function __construct()
    {
        $this->reg = Registry::instance();
    }

    public function init()
    {
        $this->setupOptions();
    }

    private function setupOptions()
    {
        if (!file_exists($this->config_path)) {
            throw new \Exception("Could not find config file");
        }

        // читаем конфигурационный файл
        $contents = file_get_contents($this->config_path);
        if ($contents === false) {
            throw new \Exception("Could not read config file");
            //trigger_error("Could not read {$this->config}",E_USER_ERROR);
        }

        // декодируем содержимое конфигурационного файла
        $options = json_decode($contents, true);
        if (is_null($options)) {
            throw new \Exception("Could not decode config file");
        }

        // проверяем наличие ключа "config"
        if (!array_key_exists("config", $options)) {
            $conf = new Config();
        } else {
            $conf = new Config($options['config']);
        }
        // сохраняем конфигурацию в реестре
        $this->reg->setConfig($conf);
    }
}
