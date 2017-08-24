<?php
/**
 * Dispatcher - диспечеризация запроса.
 */

namespace app\controllers\Dispatcher;

require_once("Request.php");

// TODO: реализовать автозагрузку согласно PSR-4
require_once ("action/MainController.php");

use app\controllers\Request\Request;

/**
 * Class Dispatcher
 * @package app\controllers\Dispatcher
 */
class Dispatcher
{
    /**
     * Dispatcher constructor.
     */
    public function __construct()
    {
    }

    /**
     * @param Request $request
     * @return bool|mixed
     */
    public function dispatch(Request $request)
    {
        // получаем имена контроллера и действия
        $controllerName = $request->getController();
        $actionName = $request->getAction();
        // класс существует
        if (class_exists($controllerName)) {
            $controller = new $controllerName();
            // в нем есть метод, который и вызывается
            if (method_exists($controller, $actionName)) {
                return call_user_func_array(array($controller, $actionName), $request->getParams());
            }
        }

        // если нет класса или в нем метода
        //TODO: заменить на вызов контроллера, после добавления контроллеров
        http_response_code(404);
        echo "404 Not found";
        return false;
    }
}
