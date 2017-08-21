<div id="register">
    <div class="col-md-offset-4 col-md-4">
        <form class="form-vertical" role="form" method="post" action="index.php?ctrl=user&act=create"
              accept-charset="UTF-8">
            <div class="form-group col-md-12">
                <label class="sr-only" for="login">Логин</label>
                <input type="text" class="form-control" name="login" placeholder="Логин" required>
            </div>
            <div class="form-group col-md-12">
                <label class="sr-only" for="hash">Пароль</label>
                <input type="password" class="form-control" name="hash" placeholder="Пароль" required>
                <input type="password" class="form-control" name="confirm" placeholder="Подтвердить пароль" required>
            </div>
            <div class="form-group col-md-12">
                <label class="sr-only" for="email">Электронная почта</label>
                <input type="text" class="form-control" name="email" placeholder="Электронная почта" required>
            </div>
            <div class="form-group col-md-12">
                <button type="submit" class="btn btn-primary btn-block">Зарегистрироваться</button>
            </div>
        </form>
    </div>
</div>

