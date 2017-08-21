<?php
/**
 *
 */

namespace app\controllers\Front;


use app\controllers\Dispatcher\Dispatcher;

class Front
{
    private function __construct()
    {
    }

    static function run()
    {
        $instance = new Front();
        $instance->init();
        $instance->handleRequest();
    }

    function init()
    {

    }

    function handleRequest()
    {
        $request = Router::getRequest();
        $dispatcher = new Dispatcher();
        $controller = $dispatcher->getController($request);
        $controller->execute($request);
    }

}
