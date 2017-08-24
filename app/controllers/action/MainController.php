<?php
/**
 *
 */

// TODO: реализовать автозагрузку согласно PSR-4 с поддержкой namespace
//namespace app\controllers\action\MainController;

require_once("ActionController.php");

use app\controllers\action\ActionController\ActionController;

class MainController extends ActionController
{
    /**
     * MainController constructor.
     */
    public function __construct()
    {
    }

    public function index()
    {
        require_once("../templates/template.php");
    }
}
