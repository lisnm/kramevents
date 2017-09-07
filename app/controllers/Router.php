<?php
/**
 * Класс Router - отвечает за маршрутизацию запроса.
 */

namespace app\controllers\Router;

require_once("Request.php");
require_once("/../base/Registry.php");

use app\base\Registry;
use app\controllers\Request\Request;

/**
 * Class Router
 * @package app\controllers\Router
 */
class Router
{
    /**
     * URI delimiter
     */
    const URI_DELIMITER = '/';
    protected $placeholders = [
        ':seg' => '([^\/]+)',
        ':dig' => '([0-9]+)',
        ':any' => '(.+)'
    ];
    private $requestedUri;
    private $method;
    private $routes = [];
    private $request;

    public function __construct($uri, $method = 'GET')
    {

        $this->requestedUri = $uri;
        $this->method = $method;
        $this->request = null;
        $this->routes = [];

    }

    /**
     * Создаем Router из глобальных переменных.
     * @return Router
     */
    public static function getRouter()
    {
        $uri = $_SERVER['REQUEST_URI'];
        if (false !== $pos = strpos($uri, '?')) {
            $uri = substr($uri, 0, $pos);
        }
        // TODO: удаляем завершаюший слещ
        // $uri = rtrim($uri, '/');
        // Декодирование URL-кодированной строки
        $uri = rawurldecode($uri);

        return new static($uri, $_SERVER['REQUEST_METHOD']);
    }

    /**
     * Process requested URI
     * @return Request
     */
    public function route()
    {
        $find = array_keys($this->placeholders);
        $replace = array_values($this->placeholders);

        // создаем пустой запрос
        $request = new Request();
        foreach ($this->routes as $route => $handler) {
            // Replace wildcards by regex
            if (strpos($route, ':') !== false) {
                $route = str_replace($find, $replace, $route);
            }
            // Route rule matched
            if (preg_match('#^' . $route . '$#', $this->requestedUri, $matches)) {

                $handler = explode(self::URI_DELIMITER, $handler, 3);
                //TODO: Вынести в функцию!!!!!
                $controller = $handler[0];
                $action = $handler[1];
                $params = array_slice($matches, 1);
                $request->setController($controller);
                $request->setAction($action);
                $request->setParams($params);
                $request->setMethod($this->method);
            }
        }
        // сохраняем запрос в реестре
        $registry = Registry::instance();
        $registry->setRequest($request);
        return $request;
    }

    /**
     * Добавляет маршрут(-ы)
     *
     * @example: addRoute('/about', 'MainController/about');
     */
    public function addRoute($route, $destination = null)
    {
        if ($destination != null && !is_array($route)) {
            $route = array($route => $destination);
        }
        $this->routes = array_merge($this->routes, $route);
    }
}
