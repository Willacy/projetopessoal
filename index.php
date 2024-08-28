<?php
require_once './template/template.php';

$template = new Template;

$template->cabecalho('INDEX');
$template->barraNavegacao();
$template->corpo('./view/login.php');
