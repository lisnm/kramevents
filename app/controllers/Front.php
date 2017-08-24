<?php
/**
 * Класс фронт контроллера.
 * Реализует единую точку входа.
 */

namespace app\controllers\Front;

require_once("Dispatcher.php");
require_once("Router.php");


use app\controllers\Dispatcher\Dispatcher;
use app\controllers\Router\Router;


/**
 * Class Front
 * @package app\controllers\Front
 */
class Front
{
    /**
     * Front конструктор.
     */
    protected function __construct()
    {
    }

    /**
     * Запускает фронт контроллер на выполнение.
     */
    static public function run()
    {
        $instance = new Front();
        $instance->init();
        $instance->handleRequest();
    }

    /**
     * Инициализирует
     */
    public function init()
    {
    }

    /**
     * Обрабатывает запрос
     */
    function handleRequest()
    {
        // получаем объект Router'a
        $router = Router::getRouter();
        // получаем правила маршрутизации из файла конфигурации
        // TODO: нужен другой способ получения правил
        $router_rules = include_once __DIR__ . '/../../config/routes.config.php';
        // добавляем правила в Router
        $router->addRoute($router_rules);
        // производим маршрутизацию, получаем объект Request
        $request = $router->route();
        // создаем диспечер
        $dispatcher = new Dispatcher();
        // создаем контроллер и вызываем его действие
        $dispatcher->dispatch($request);
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
