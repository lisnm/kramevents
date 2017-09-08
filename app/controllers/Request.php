<?php
/**
 *  Класс Request - хранит контроллер, действие  и параметры.
 */

namespace App\Controllers;

/**
 * Class Request
 * @package App\Controllers
 */

class Request
{
    private $controller;
    private $action;
    private $params = [];
    private $method;

    /**
     * Request constructor.
     * @param null $controller
     * @param null $action
     * @param array $params
     * @param string $method
     */
    public function __construct($controller = null, $action = null, $params = [], $method = 'GET')
    {
        $this->controller = $controller;
        $this->action = $action;
        $this->params = $params;
        $this->method = $method;
    }

    /**
     *  Клонирование объекта
     */
    public function __clone()
    {
        $this->controller = null;
        $this->action = null;
        $this->params = [];
        $this->method = 'GET';
    }

    /**
     * @return string
     */
    public function getController()
    {
        return $this->controller;
    }

    /**
     * @param string $controller
     */
    public function setController($controller)
    {
        $this->controller = $controller;
    }

    /**
     * @return string
     */
    public function getAction()
    {
        return $this->action;
    }

    /**
     * @param string $action
     */
    public function setAction($action)
    {
        $this->action = $action;
    }

    /**
     * @return array
     */
    public function getParams()
    {
        return $this->params;
    }

    /**
     * @param array $params
     */
    public function setParams($params)
    {
        $this->params = $params;
    }

    /**
     * @return string
     */
    public function getMethod()
    {
        return $this->method;
    }

    /**
     * @param string $method
     */
    public function setMethod($method)
    {
        $this->method = $method;
    }
}
