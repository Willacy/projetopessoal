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
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
                integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
            <title>SISTEMA IFBA - <?php echo $title ?></title>
        </head>

        <?php
    }
    public function barraNavegacao()
    {
        ?>

        <body>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark mx-auto" style="width: 800px">
                <div class="container-fluid">
                    <a class="navbar-brand" href="#">BIBLIOTECA DO IFBA</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                        aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                        <div class="navbar-nav">
                            <a class="nav-link active" aria-current="page" href="#">INICIO</a>
                            <a class="nav-link" href="#">CADASTRO</a>
                            <a class="nav-link" href="#">MOVIMENTAÇÃO</a>
                            <a class="nav-link" href="#">SOBRE</a>
                            <!-- <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a> -->
                        </div>
                    </div>
                </div>
            </nav>
            <?php
    }
    public function corpo($conteudo)
    {
        ?>

            <?php
            $conteudo;
            // require_once $conteudo;
            // $telaLogin = new UsuarioView;
            // $telaLogin->telaLogin();
            ?>


        </body>
        <?php
    }

}