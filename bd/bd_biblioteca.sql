-- Criando o banco de dados
CREATE DATABASE IF NOT EXISTS bd_biblioteca;
USE bd_biblioteca;
-- Criando a tabela usuario
CREATE TABLE IF NOT EXISTS usuarios(
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(80),
    login_usuario VARCHAR(80) NOT NULL UNIQUE,
    senha_usuario VARCHAR(128)
);
-- Criando a tabela generos
CREATE TABLE IF NOT EXISTS generos(
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nome_genero VARCHAR(80)
);
-- Criando a tabela locais
CREATE TABLE IF NOT EXISTS locais(
    id_local INT PRIMARY KEY AUTO_INCREMENT,
    sessao_local VARCHAR(10),
    fileira_local INT,
    num_fileira_local INT
);
-- Criando a tabela livros
CREATE TABLE IF NOT EXISTS livros(
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo_livro VARCHAR(80) NOT NULL,
    valor_venda_livro DOUBLE,
    valor_aluguel_livro DOUBLE,
    isbn_livro VARCHAR(80),
    quantidade_livro INT,
    fk_local_livro INT,
    FOREIGN KEY (fk_local_livro) REFERENCES locais(id_local)
);
-- Criando a tabela de relacionamento de livros com generos
CREATE TABLE IF NOT EXISTS livros_generos(
    id_livro_genero INT PRIMARY KEY AUTO_INCREMENT,
    fk_livro INT,
    fk_genero INT,
    FOREIGN KEY (fk_livro) REFERENCES livros(id_livro),
    FOREIGN KEY (fk_genero) REFERENCES generos(id_genero)
);
-- Criando a tabela do tipo de movimento
CREATE TABLE IF NOT EXISTS tipos_mov(
    id_tipo_mov INT PRIMARY KEY AUTO_INCREMENT,
    nome_tipo_mov VARCHAR(15)
);
-- Criando a tabela de relacionamento entre usuario (autor) com o livro
CREATE TABLE IF NOT EXISTS livros_autores(
    id_livro_autor INT PRIMARY KEY AUTO_INCREMENT,
    fk_livro INT,
    fk_autor INT,
    FOREIGN KEY (fk_autor) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (fk_livro) REFERENCES livros(id_livro)
);
-- Criando a tabela de movimentações
CREATE TABLE IF NOT EXISTS movimentos(
    id_movimento INT PRIMARY KEY AUTO_INCREMENT,
    data_movimento DATE,
    quant_movimento DOUBLE,
    fk_usuario_movimento INT,
    fk_tipo_movimento INT,
    FOREIGN KEY (fk_usuario_movimento) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (fk_tipo_movimento) REFERENCES tipos_mov(id_tipo_mov)
);
-- Criando a tabela de endereco
CREATE TABLE IF NOT EXISTS endereco(
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    rua_endereco VARCHAR(30),
    bairro_endereco varchar(30),
    cidade_endereco varchar(80),
    fk_usuario_endereco INT,
    fk_movimento_endereco INT UNIQUE,
    FOREIGN KEY (fk_usuario_endereco) REFERENCES usuarios(id_usuario),
    FOREIGN key (fk_movimento_endereco) REFERENCES movimentos(id_movimento)
);
-- Criando a relação livros e movimentos
CREATE TABLE IF NOT EXISTS livros_movimentos(
    id_livro_movimento INT PRIMARY KEY AUTO_INCREMENT,
    fk_livro INT,
    fk_movimento INT,
    FOREIGN KEY (fk_livro) REFERENCES livros(id_livro),
    FOREIGN KEY (fk_movimento) REFERENCES movimentos(id_movimento)
);