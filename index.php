<?php
require_once './template/template.php';
require_once './view/usuario.php';

$template = new Template;
$usuariov = new UsuarioView;

$template->cabecalho('INDEX');
$template->barraNavegacao();
$template->corpo($usuariov);
