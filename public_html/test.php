<link rel="stylesheet" href="css/bootstrap.min.css"/>
<?php

require_once("../app/base/Registry.php");

use app\base\Registry;

// получаем реестр
$registry = Registry::instance();
// получаем helper
$helper = $registry->getConfigloader();
// запускаем инициализацию
$helper->init();
// подключаемся к базе
$pdo = $registry->getPdo();
// запрос
$ret = $pdo->query("SELECT * FROM events");
$values = $ret->fetchAll();

//mapper
require_once("../app/models/EventMapper.php");
require_once("../app/models/EventCollection.php");
$mapper = new App\Models\EventMapper();
$values = $mapper->findAll();
foreach ($values as $item):?>
    <div class="col-xs-6 col-sm-4 col-md-3">
        <div class="thumbnail">
            <div class="caption">
                <div class="event-title">
                    <h2><?= $item->getTitle(); ?></h2>
                </div>
                <div class="event-description">
                    <h2><?= $item->getDescription(); ?></h2>
                </div>
                <div class="event-date">
                    <?= $item->getDateStart(); ?>
                </div>
                <div class="event-date">
                    <?= $item->getDateEnd(); ?>
                </div>
            </div>
        </div>
    </div>
<?php endforeach ?>
