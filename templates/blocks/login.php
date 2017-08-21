<div id="login">
    <div class="col-md-12">
        <div class="social-buttons">
            <a href="#" class="btn btn-fb"><i class="fa fa-facebook"></i> Facebook</a>
            <a href="#" class="btn btn-tw"><i class="fa fa-twitter"></i> Twitter</a>
        </div>
        или
        <form class="form" role="form" method="post" action="login" accept-charset="UTF-8">
            <div class="form-group">
                <label class="sr-only" for="email">Электронная почта</label>
                <input type="text" class="form-control" name="email" placeholder="Электронная почта" required>
            </div>
            <div class="form-group">
                <label class="sr-only" for="password">Пароль</label>
                <input type="password" class="form-control" name="password" placeholder="Пароль" required>
                <div class="help-block text-right"><a href="forgotpass.php">Забыли пароль?</a>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-primary btn-block">Войти</button>
            </div>
            <div class="checkbox">
                <label>
                    <input type="checkbox">Запомнить меня
                </label>
            </div>
        </form>
    </div>
    <div class="bottom text-center">
        Нет аккаунта ? <a href="?ctrl=Register&act=index"><b>Регистрация</b></a>
    </div>
</div>
