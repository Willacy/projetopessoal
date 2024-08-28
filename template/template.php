<?php
class Template
{
    public function cabecalho($title)
    {
        ?>
        <!DOCTYPE html>
        <html lang="pt-br">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <link rel="stylesheet" href="./css/estilo.css">
            <title>SISTEMA IFBA - <?php echo $title ?></title>
        </head>

        <?php
    }
    public function barraNavegacao()
    {
        ?>

        <body>
            <nav>
                <ul>
                    <li>INICIO</li>
                    <li>CADASTRO</li>
                    <li>MOVIMENTAÇÃO</li>
                    <li>SOBRE</li>
                </ul>
            </nav>
            <?php
    }
    public function corpo($conteudo)
    {
        ?>

            <?php require_once $conteudo ?>


        </body>
        <?php
    }

}