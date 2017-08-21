<link rel="stylesheet" href="css/bootstrap.min.css"/>
<?php

$link = new PDO("mysql:dbname=id2441188_kramevents;host=localhost",
    "id2441188_root",
    "123456"
); // создаем подключение
$ret = $link->query("SELECT * FROM events");
$values = $ret->fetchAll();

foreach ($values as $item):?>
    <div class="col-xs-6 col-sm-4 col-md-3">
        <div class="thumbnail">
            <div class="caption">
                <div class="event-title">
                    <h2><?= $item["title"]; ?></h2>
                </div>
                <div class="event-description">
                    <h2><?= $item["description"]; ?></h2>
                </div>
                <div class="event-date">
                    <?= $item["date_start"]; ?>
                </div>
                <div class="event-date">
                    <?= $item["date_end"]; ?>
                </div>
            </div>
        </div>
    </div>
<?php endforeach ?>
