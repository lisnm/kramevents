<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">

    <!-- For IE 9 and below. ICO should be 32x32 pixels in size -->
    <!--[if IE]>
    <link rel="shortcut icon" href="images/favicon.ico">
    <![endif]-->

    <!--TODO: добавить иконку для яблока-->
    <!-- Touch Icons - iOS and Android 2.1+ 180x180 pixels in size. -->
    <link rel="apple-touch-icon-precomposed" href="apple-touch-icon-precomposed.png">

    <!-- Firefox, Chrome, Safari, IE 11+ and Opera. 196x196 pixels in size. -->
    <link rel="icon" href="images/favicon.ico">

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <?php if (isset($title)): ?>
        <title>MyDay: <?= htmlspecialchars($title) ?></title>
    <?php else: ?>
        <title>MyDay</title>
    <?php endif ?>

    <!--JS-->
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/moment-with-locales.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootstrap-datetimepicker.js"></script>
    <script src="js/jquery.colorbox.min.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/bootstrap-datetimepicker.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link href="css/styles.css" rel="stylesheet">
    <link href="css/colorbox.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]--><!-- ... -->

</head>
<body>
<div id="container-fluid">
    <?php include("blocks/navbar.php"); ?>
    <?php include 'blocks/' . $content_view; ?>
    <?php include("blocks/footer.php"); ?>
</div>
<!--GlobalJavaScripts-->
<script src="js/scripts.js"></script>
</body>
</html>
