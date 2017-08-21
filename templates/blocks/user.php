<div class="container user">
    <div class="clearfix"></div>
    <div class="row">
        <div>
            <ul class="nav nav-tabs col-lg-12" role="tablist">
                <li class="active"><a href="#user" role="tab" data-toggle="tab">Данные пользователя</a></li>
                <li class=""><a href="#user_company" role="tab" data-toggle="tab">Организация</a></li>
                <li class=""><a href="#user_events" role="tab" data-toggle="tab">Добавить событие</a></li>
                <li class=""><a href="#all_events" role="tab" data-toggle="tab">Все события</a></li>
            </ul>
        </div>
        <div class="clearfix"></div>
        <div class="user_Content tab-content">
            <!-- Данные пользователя -->
            <div id="user" class="tab-pane active">
                <form class="form-horizontal" action='' method="POST">
                    <fieldset>
                        <div class="col-lg-12 form-group margin50">
                            <div class="container">
                                <h3>Данные пользователя</h3>
                            </div>
                            <div id="user_data">
                                <div class="container ">
                                    <div class="clearfix">
                                    </div>
                                    <div class="col-lg-12 form-group">
                                        <ul class="container details">
                                            <li><h2><?= $values["user"]->login; ?></h2></p></li>
                                            <li><p><span class="glyphicon glyphicon-envelope one" name="mail"
                                                         style="width:50px;"></span>
                                                <h2><?= $values["user"]->email; ?></h2></p></li>
                                    </div>
                                </div>
                            </div>
                    </fieldset>
                </form>
            </div>
            <!-- /Данные пользователя -->
            <div id="user_company" class="tab-pane">
                <form class="form-horizontal" action="index.php?ctrl=Company&act=create" role="form" method="POST">
                    <fieldset>
                        <div class="col-lg-12 form-group margin50">
                            <!--div class="container" name = "login">
                               <h2>Имя пользователя</h2>
                                 </div-->
                            <div class="container">
                                <h3>Добавить компанию</h3>
                            </div>
                            <div id="add_organization">
                                <div class="container ">
                                    <div class="clearfix">
                                    </div>
                                    <div class=" col-lg-12 form-group">
                                        <label class="col-lg-2" for="Fullname">Компания</label>
                                        <div class="col-lg-4">
                                            <select id="company_id" name="company_id" class="form-control company_id">
                                                <option value="0">Выбрать компанию</option>
                                                <?php foreach ($values["companies"] as $itemx): ?>
                                                    <option value="<?= $itemx->id; ?>"><?= $itemx->fullname; ?></option>
                                                <?php endforeach ?>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="container">
                                        <p></p>
                                        <h3>...или - создать компанию</h3>
                                    </div>
                                    <div class="col-lg-12 form-group margin50">
                                        <label class="col-lg-2" for="fullname">Полное название</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="fullname" name="fullname" placeholder="Название"
                                                   class="form-control fullname" value="" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group margin50">
                                        <label class="col-sm-2" for="Description">Описание</label>
                                        <div class="col-sm-4">
                                            <textarea class="form-control description" id="description"
                                                      name="description" rows="3" required></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group">
                                        <!--label class="col-lg-2" for="place_id">Адрес</label-->
                                        <div class="col-lg-4">
                                            <input type="hidden" id="place_id" name="place_id" placeholder="Адрес"
                                                   class="form-control place_id" value="2">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-2" for="email">Почта</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="email" name="email" placeholder="email"
                                                   class="form-control email" value="">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-2" for="www">Сайт</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="www" name="www" placeholder="www"
                                                   class="form-control www" value="">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group margin50">
                                        <label class="col-lg-2" for="logo">Логотип</label>
                                        <input class="btn btn-default" type="file" class="form-control" name="logo">
                                    </div>
                                    <div>
                                        <div class="Product_Button col-lg-offset-6">
                                            <button type="reset" class="btn btn-primary"><strong>Очистить</strong>
                                            </button>
                                            <button type="submit" class="btn btn-primary"><strong>Сохранить</strong>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div id="user_events" class="tab-pane">
                <form class="form-horizontal" action="index.php?ctrl=Event&act=create" role="form" method="POST">
                    <fieldset>
                        <div class="col-lg-12 form-group margin50">
                            <!--div class="container" name = "login">
                             <h2>Имя пользователя</h2>
                                 </div-->
                            <div class="container">
                                <h3>Добавить событие</h3>
                            </div>
                            <div id="add_event">
                                <div class="container ">
                                    <div class="clearfix"></div>

                                    <div class=" col-lg-12 form-group">
                                        <label class="col-lg-2" for="category_id">Категория</label>
                                        <div class="col-lg-4">
                                            <select id="category_id" name="category_id" class="form-control category_id"
                                                    required>
                                                <option value="0">Выбрать категорию</option>
                                                <option value="1">Кино</option>
                                                <option value="2">Концерты</option>
                                                <option value="3">Скидки и рекламные акции</option>
                                                <option value="4">Выставки</option>
                                                <option value="5">Для детей</option>
                                                <option value="6">Театр</option>
                                                <option value="7">Спорт</option>
                                                <option value="8">Семинары</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group margin50">
                                        <label class="col-lg-2" for="title">Название события</label>
                                        <div class="col-lg-4">
                                            <input type="text" id="title" name="title" class="form-control title"
                                                   placeholder="Введите название" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group margin50">
                                        <label class="col-sm-2" for="description">Описание</label>
                                        <div class="col-sm-4">
                                            <textarea class="form-control description" id="description"
                                                      name="description" rows="3" placeholder="Описание"
                                                      required></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group">
                                        <!--label class="col-lg-2" for="place_id">Место проведения мероприятия</label-->
                                        <div class="col-lg-4">
                                            <input type="hidden" id="place_id" name="place_id" placeholder="Адрес"
                                                   class="form-control place_id" value="2">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group">
                                        <label class="col-lg-2" for="company_id"></label>
                                        <div class="col-lg-4">
                                            <input type="hidden" id="company_id" name="company_id"
                                                   placeholder="company_id" class="form-control company_id" value="4">
                                        </div>
                                    </div>
                                    <div class="col-lg-12 form-group margin50">
                                        <label class="col-lg-2" for="date_start">Выберите дату</label>
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <div class="input-group date" id="datetimepicker8">
                                                    <input type="text" class="form-control" id="date_start"
                                                           name="date_start"/>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xs-3">
                                            <div class="form-group">
                                                <div class="input-group date" id="datetimepicker9">
                                                    <input type="text" class="form-control" id="date_end"
                                                           name="date_end"/>
                                                    <span class="input-group-addon">
                                                        <span class="glyphicon glyphicon-calendar">
                                                        </span>
                                                    </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <script>
                                        //Инициализация datetimepicker8 и datetimepicker9
                                        $("#datetimepicker8").datetimepicker({
                                            format: 'YYYY-MM-DD',
                                            pickTime: false,
                                            language: 'ru',
                                            defaultDate: new Date()
                                        });
                                        $("#datetimepicker9").datetimepicker({
                                            format: 'YYYY-MM-DD',
                                            pickTime: false,
                                            language: 'ru'
                                        });
                                        //При изменении даты в 8 datetimepicker, она устанавливается как минимальная для 9 datetimepicker
                                        $("#datetimepicker8").on("dp.change", function (e) {
                                            $("#datetimepicker9").data("DateTimePicker").setMinDate(e.date);
                                        });
                                        //При изменении даты в 9 datetimepicker, она устанавливается как максимальная для 8 datetimepicker
                                        $("#datetimepicker9").on("dp.change", function (e) {
                                            $("#datetimepicker8").data("DateTimePicker").setMaxDate(e.date);
                                        });
                                    </script>
                                    <div class="col-lg-12 form-group margin50">
                                        <label class="col-lg-2" for="logo">Фото</label>
                                        <input class="btn btn-default" type="file" class="form-control" name="logo">
                                    </div>
                                    <div>
                                        <div class="Product_Button col-lg-offset-6">
                                            <button type="reset" class="btn btn-primary"><strong>Очистить</strong>
                                            </button>
                                            <button type="submit" class="btn btn-primary"><strong>Сохранить</strong>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
            <div id="all_events" class="tab-pane">
                <div class="col-lg-12 form-group margin50">
                    <div class="container">
                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <div class="thumbnail">
                                <div class="caption">
                                    <div class="event-title">
                                        <h2>название</h2>
                                    </div>
                                    <div class="event-description">
                                        <p>описание</p>
                                    </div>
                                    <div class="event-date">
                                        <h3>дата</h3>
                                    </div>
                                    <p><a href="" class="label label-default">Посмотреть</a></p>
                                    <p><a href="" class="label label-default">Редактировать</a></p>
                                    <p><a href="" class="label label-default">Удалить</a></p>
                                </div>
                                <div class="event-picture">
                                    <div class="event-picture-wrap"
                                         style="background-image: url(images/logo.jpg);"><img
                                                src="images/logo.jpg" alt="" title="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
