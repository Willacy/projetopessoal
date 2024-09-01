<?php

namespace App\Classes;

class Uri
{
    public static function uri(){
        $uri = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
        // echo $uri;
        return $uri;
    }
}