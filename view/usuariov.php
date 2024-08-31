<?php
require_once './template/template.php';
$template = new Template;
$template->cabecalho('Deus');
class UsuarioView
{
    public function telaLogin()
    {
        ?>
        <input type="text" name="login" id="login" placeholder="LOGIN">
        <input type="password" name="senha" id="senha" placeholder="SENHA">
        <input type="submit" value="LOGAR">
        <?php
    }

    public function telaCadastro()
    {
        ?>
        <input type="text" name="nome" id="nome" placeholder="NOME">
        <input type="text" name="login" id="login" placeholder="LOGIN">
        <input type="password" name="senha" id="senha" placeholder="SENHA">
        <input type="submit" value="LOGAR">
        <?php
    }
    public function tela()
    {

    }
}