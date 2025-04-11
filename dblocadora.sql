create database locadora;
use locadora;

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    data_cadastro DATE DEFAULT (CURRENT_DATE)
);



CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    tipo ENUM('admin', 'funcionario') DEFAULT 'funcionario',
    data_criacao DATE DEFAULT (CURRENT_DATE)
);

insert into usuarios(nome,email,senha,tipo) values("admin","admin@admin.com","admin",'admin');
select * from usuarios;


CREATE TABLE editoras (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(50),
    site VARCHAR(100)
);


CREATE TABLE autores (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    nacionalidade VARCHAR(50)
);


CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(50),
    ano_lancamento YEAR,
    duracao INT, -- em minutos
    id_editora INT,
    preco DECIMAL(10, 2),
    estoque INT DEFAULT 1,
    FOREIGN KEY (id_editora) REFERENCES editoras(id_editora)
);


CREATE TABLE produto_autor (
    id_produto INT,
    id_autor INT,
    PRIMARY KEY (id_produto, id_autor),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_autor) REFERENCES autores(id_autor)
);


CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    id_usuario INT,
    data_venda DATETIME DEFAULT CURRENT_TIMESTAMP,
    total DECIMAL(10, 2),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);


CREATE TABLE itens_venda (
    id_venda INT,
    id_produto INT,
    quantidade INT DEFAULT 1,
    preco_unitario DECIMAL(10,2),
    PRIMARY KEY (id_venda, id_produto),
    FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

update usarios set nome = ?, email = ?, senha = ?, tipo = ?  where email = ?