<?php
require_once './template/template.php';
require_once './view/usuariov.php';

$template = new Template;
$usuariov = new UsuarioView;

$template->cabecalho('INDEX');
$template->barraNavegacao();
$adoro = 1;
$tela = null;
switch ($adoro) {
    case 1:
        $tela = $usuariov->telaLogin();
        break;
    case 2:
        $tela = $usuariov->telaCadastro();
        break;
    default:
        $tela = $usuariov->tela();
}
$template->corpo($tela);
