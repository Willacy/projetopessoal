<?php

require "../bootstrap.php";
require '../core/Controller.php';
use core\Controller;

$controller = new Controller;
$controller = $controller->load();

//dd($controller);