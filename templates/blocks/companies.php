<div id="all-companies">
    <div class="main-text-body">
        <h2>Все развлекательные организации города Краматорска</h2>
    </div>
    <div class="container">
        <?php foreach ($values["companies"] as $itemx): ?>
        <div class="well">
            <div class="media">
                <a href="?ctrl=company&act=one&id=<?= $itemx->id; ?>" class="pull-left">
                    <img class="picture-media" src="upload/<?= $itemx->picture_url; ?>">
                </a>
                <div class="company-name">
                    <h4><?= $itemx->fullname; ?></h4>
                </div>
                <div class="company-description">
                    <p><?= $itemx->description; ?></p>
                </div>
                <a href='#'><span><i class="fa fa-facebook-square"></i></span></a>
                <a href='#'><span><i class="fa fa-twitter-square"></i></span></a>
                <a href='#'><i class="fa fa-google-plus-square"></i></span></a>
            </div>
            <div class="company-footer">
                <span class="pull-left buttons">
                    <a class="btn btn-sm btn-primary" href="?ctrl=company&act=one&id=1" role="button">Больше</a>
                </span>
            </div>
        </div>
<?php endforeach ?>

