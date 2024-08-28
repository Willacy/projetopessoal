-- CRIANDO O BANCO DE DADOS;
CREATE DATABASE IF NOT EXISTS bd_biblioteca;

-- USANDO O BANCO DE DADOS
USE bd_biblioteca;

-- CRIANDO A TABELA USUARIOS
CREATE TABLE
  IF NOT EXISTS usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome_usuario VARCHAR(80),
    login_usuario VARCHAR(80) NOT NULL UNIQUE,
    senha_usuario VARCHAR(128) NOT NULL
  );

-- CRIANDO A TABELA ESTADOS
CREATE TABLE
  IF NOT EXISTS estados (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nome_estado VARCHAR(45)
  );

-- CRIANDO A TABELA CIDADES
CREATE TABLE
  IF NOT EXISTS cidades (
    id_cidade INT PRIMARY KEY AUTO_INCREMENT,
    nome_cidade VARCHAR(45),
    fk_estado INT,
    FOREIGN KEY (fk_estado) REFERENCES estados (id_estado)
  );

-- CRIANDO A TABELA BAIRROS
CREATE TABLE
  IF NOT EXISTS bairros (
    id_bairro INT PRIMARY KEY AUTO_INCREMENT,
    nome_bairro VARCHAR(45),
    fk_cidade INT,
    FOREIGN KEY (fk_cidade) REFERENCES cidades (id_cidade)
  );

-- CRIANDO A TABELA TIPOS DE MOVIMENTOS
CREATE TABLE
  IF NOT EXISTS tipos_mov (
    id_tipo_mov INT PRIMARY KEY AUTO_INCREMENT,
    nome_tipo_mov VARCHAR(15)
  );

-- CRIANDO A TABELA DE MOVIMENTOS
CREATE TABLE
  IF NOT EXISTS movimentos (
    id_movimento INT PRIMARY KEY AUTO_INCREMENT,
    data_movimento DATE,
    quant_movimento DOUBLE NULL DEFAULT NULL,
    fk_usuario INT,
    fk_tipo INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (fk_tipo) REFERENCES tipos_mov (id_tipo_mov)
  );

-- CRIANDO A TABELA DE ENDERECO
CREATE TABLE
  IF NOT EXISTS endereco (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    rua_endereco VARCHAR(30),
    cep VARCHAR(30),
    fk_usuario INT (11),
    fk_bairro INT (11) NOT NULL,
    fk_movimento INT (11) NOT NULL,
    FOREIGN KEY (fk_usuario) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (fk_bairro) REFERENCES bairros (id_bairro),
    FOREIGN KEY (fk_movimento) REFERENCES movimentos (id_movimento)
  );

-- CRIANDO A TABELA DE GENEROS DOS LIVROS
CREATE TABLE
  IF NOT EXISTS generos (
    id_genero INT PRIMARY KEY AUTO_INCREMENT,
    nome_genero VARCHAR(80),
  );

-- CRIANDO A TABELA DE LOCAIS DE ARMAZENAMENTO DOS LIVROS
CREATE TABLE
  IF NOT EXISTS locais (
    id_local INT PRIMARY KEY AUTO_INCREMENT,
    sessao_local VARCHAR(10),
    fileira_local INT (11),
    num_fileira_local INT
  );

-- CRIANDO A TABELA LIVROS
CREATE TABLE
  IF NOT EXISTS livros (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo_livro VARCHAR(80),
    valor_venda_livro DOUBLE,
    valor_aluguel_livro DOUBLE,
    isbn_livro VARCHAR(80),
    quantidade_livro INT,
    fk_local,
    FOREIGN KEY (fk_local) REFERENCES locais (id_local)
  );

-- CRIANDO A TABELA DE RELAÇÃO DE LIVROS COM AUTORES
CREATE TABLE
  IF NOT EXISTS livros_autores (
    fk_livro INT,
    fk_autor INT,
    FOREIGN KEY (`fk_autor`) REFERENCES usuarios (id_usuario),
    FOREIGN KEY (`fk_livro`) REFERENCES livros (id_livro)
  );

-- CRIANDO A TABELA DE RELAÇÃO DE LIVROS COM GENEROS
CREATE TABLE
  IF NOT EXISTS livros_generos (
    fk_livro INT,
    fk_genero INT,
    FOREIGN KEY (fk_livro) REFERENCES livros (id_livro),
    FOREIGN KEY (fk_genero) REFERENCES generos (id_genero)
  );

-- CRIANDO A TABELA DE RELAÇÃO DE LIVROS COM MOVIMENTOS
CREATE TABLE
  IF NOT EXISTS livros_movimentos (
    fk_livro INT,
    fk_movimento INT,
    FOREIGN KEY (fk_livro) REFERENCES livros (id_livro),
    FOREIGN KEY (fk_movimento) REFERENCES movimentos (id_movimento)
  );