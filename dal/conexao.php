<?php
class Conexao
{
    // PASSANDO OS ATRIBUTOS DA CLASSE
    protected $conexao = null;
    private $host = 'localhost';
    private $dbName = 'bd_biblioteca';
    private $port = '3306';
    private $user = 'willacy';
    private $password = 'Hellena15@';

    // METODO CONSTRUTOR
    public function __construct()
    {
        try {
            // PREPARANDO A CONEXÃP
            $this->conexao = new PDO("mysql:host={$this->host};dbname={$this->dbName};port={$this->port}", "{$this->user}", "{$this->password}");

            $this->conexao->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);


        } catch (PDOException $e) {
            echo "Erro de conexão: {$e->getMessage()}";
        }
    }

    public function getConexao()
    {
        return $this->conexao;
    }

    public function closeConexao(){
        $this->conexao = null;
    }

}