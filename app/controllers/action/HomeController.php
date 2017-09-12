<?php
/**
 *
 */

// TODO: реализовать автозагрузку согласно PSR-4 с поддержкой namespace
//namespace app\controllers\action\HomeController;

require_once("ActionController.php");

require_once("../app/base/Registry.php");
require_once("../app/models/EventMapper.php");
require_once("../app/models/EventCollection.php");

use App\Controllers\Action\ActionController;

class HomeController extends ActionController
{
    /**
     * HomeController constructor.
     */
    public function __construct()
    {
    }

    public function index()
    {
        $mapper = new App\Models\EventMapper();
        $values = $mapper->findAll();

        $content_view = "main.php";
        require_once("../templates/template.php");
    }
}
