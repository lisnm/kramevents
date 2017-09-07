<?php
/**
 *  Пример подстановки символов:
 * `/page/:seg` - любые символы в одном сегменте: `/page/qwerty` or `/page/123`;
 * `/page/:dig` - только цифры: `/page/123`;
 * `/page/:any` - любые символы: `/page/qwerty` или `/page/qwerty/123`;
 *
 */

return array(
// 'url' => 'контроллер/действие/параметр1/параметр2/параметр3'
    '/' => 'MainController/index', // главная страница
    '/company' => 'CompanyController/index', // список компаний
    '/event' => 'EventController/index', // список событий
    '/event/:dig' => 'EventController/view/$1', // просмотр отдельного события, например, /event/123
    '/event/:any/:dig' => 'EventController/edit/$1/$2', // действия над событием, например, /event/edit/123 или /event/dеlete/123
    '/:any' => 'MainController/anyAction' // все остальные запросы обрабатываются здесь
);
