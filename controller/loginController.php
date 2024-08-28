<?php
require_once '../dao/conexao.php';
class ControllerLogin
{
    
    public function validarLogin()
    {
        $conexao = new Conexao();

        // Pega as variaveis do formulario
        $login_usuario = $_POST['login'];
        $senha_usuario = sha1($_POST['senha']);
        // prepara a sql
        $query = "SELECT * FROM usuarios WHERE login_usuario = :login_usuario";
        // faz a conexão
        $stmt = $conexao->getConexao()->prepare($query);
        $stmt->bindParam(":login_usuario", $login_usuario);
        $stmt->execute();

        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($usuario && $senha_usuario === $usuario['senha_usuario']){
            $_SESSION['validar'] = true;
            header('Location: /projetopessoal/home'); // Redireciona para a tela principal
            exit();
        } else{
            //Login invalido
            return false;
        }
    }
}