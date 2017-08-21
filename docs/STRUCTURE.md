Структура проекта
====================
```
.
|-- config
|   `-- db.config.json
|-- database
|   `-- kramevents.sql
|-- docs
|   |-- Diagrams
|   |   |-- ClassDiagram.mdj
|   |   |-- ClassDiagram.png
|   |   `-- DatabaseStructure.svg
|   |-- COMPONENTS.md
|   `-- STRUCTURE.md
|-- public_html
|   |-- css
|   |   |-- bootstrap-datetimepicker.min.css
|   |   |-- bootstrap-theme.css
|   |   |-- bootstrap-theme.css.map
|   |   |-- bootstrap-theme.min.css
|   |   |-- bootstrap-theme.min.css.map
|   |   |-- bootstrap.css
|   |   |-- bootstrap.css.map
|   |   |-- bootstrap.min.css
|   |   |-- bootstrap.min.css.map
|   |   |-- colorbox.css
|   |   |-- font-awesome.css
|   |   |-- font-awesome.min.css
|   |   `-- styles.css
|   |-- fonts
|   |   |-- FontAwesome.otf
|   |   |-- fontawesome-webfont.eot
|   |   |-- fontawesome-webfont.svg
|   |   |-- fontawesome-webfont.ttf
|   |   |-- fontawesome-webfont.woff
|   |   |-- fontawesome-webfont.woff2
|   |   |-- glyphicons-halflings-regular.eot
|   |   |-- glyphicons-halflings-regular.svg
|   |   |-- glyphicons-halflings-regular.ttf
|   |   |-- glyphicons-halflings-regular.woff
|   |   `-- glyphicons-halflings-regular.woff2
|   |-- images
|   |   |-- brainbasket.png
|   |   |-- colorbox_controls.png
|   |   |-- colorbox_loading.gif
|   |   |-- favicon.ico
|   |   `-- logo.png
|   |-- js
|   |   |-- bootstrap-datetimepicker.js
|   |   |-- bootstrap.js
|   |   |-- bootstrap.min.js
|   |   |-- jquery-3.2.1.js
|   |   |-- jquery-3.2.1.min.js
|   |   |-- jquery-3.2.1.min.map
|   |   |-- jquery.colorbox.js
|   |   |-- jquery.colorbox.min.js
|   |   |-- map.js
|   |   |-- moment-with-locales.js
|   |   |-- npm.js
|   |   `-- scripts.js
|   |-- index.php
|   `-- index_old.php
|-- templates
|   |-- blocks
|   |   |-- carousel.php
|   |   |-- companies.php
|   |   |-- company.php
|   |   |-- event.php
|   |   |-- events.php
|   |   |-- footer.php
|   |   |-- login.php
|   |   |-- main.php
|   |   |-- navbar.php
|   |   |-- register.php
|   |   `-- user.php
|   `-- template.php
|-- CONTRIBUTING.md
|-- CONTRIBUTORS.md
|-- LICENSE
`-- README.md

11 directories, 66 files
```
:octocat: Ниже описаны назначение директорий и основных файлов.
-------------------------------------------------------------------
* application: Каталог приложения.
    * _controllers_: Каталог MVC - контроллеры.
    * _models_: Каталог MVC - модели.
    * _views_: Каталог MVC - виды.
* _config_: Каталог конфигурационных файлов приложения.
    * _db.config.json_: Конфигурационный файл базы данных
* _database_: Файлы базы данных.
    * _kramevents.sql_: Дамп базы данных (структура и данные).
* _docs_: Этот каталог содержит документацию, сгенерированную или написаную вручную.
* _includes_: В этом каталоге должны храниться все сторонние библиотеки, пользовательские библиотеки, конфиги и любой другой дополнительный код проекта.
    * _autoload.php_: Файл автозагрузки классов.
    * _config.php_: Файл настройки приложения.
    * _helpers.php_: Файл вспомогательных функций.
* _public_: Этот каталог содержит все общедоступные файлы для приложения.
    * _css_: Все файлы css.
    * _fonts_: Все файлы шрифтов.
    * _images_: Все файлы изображений.
    * _js_: Все файлы javascript.
    * _upload_: Файлы загружаемые пользователем.
* _templates_: Файлы составляющие макет.
    * _blocks_: Блоки подключаемые к шаблонам.
