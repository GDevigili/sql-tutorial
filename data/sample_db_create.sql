-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-03-17 18:36:08.629

-- foreign keys
-- ALTER TABLE DROP CONSTRAINT not supported

-- ALTER TABLE DROP CONSTRAINT not supported

-- ALTER TABLE DROP CONSTRAINT not supported

-- ALTER TABLE DROP CONSTRAINT not supported

-- tables
DROP TABLE IF EXISTS categoria;

DROP TABLE IF EXISTS cliente;

DROP TABLE IF EXISTS ordem_servico;

DROP TABLE IF EXISTS os_pro;

DROP TABLE IF EXISTS produto;

-- End of file.




-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2022-03-17 18:36:08.629

-- tables
-- Table: categoria
CREATE TABLE categoria (
    id integer NOT NULL CONSTRAINT categoria_pk PRIMARY KEY,
    nome varchar(45) NOT NULL
);

-- Table: cliente
CREATE TABLE cliente (
    id integer NOT NULL CONSTRAINT cliente_pk PRIMARY KEY,
    nome varchar(45) NOT NULL,
    telefone character(11) NOT NULL,
    cpf character(11) NOT NULL,
    nascimento date NOT NULL
);

-- Table: ordem_servico
CREATE TABLE ordem_servico (
    id integer NOT NULL CONSTRAINT ordem_servico_pk PRIMARY KEY,
    data date NOT NULL,
    cliente_id integer NOT NULL,
    CONSTRAINT ordem_servico_cliente FOREIGN KEY (cliente_id)
    REFERENCES cliente (id)
);

-- Table: os_pro
CREATE TABLE os_pro (
    produto_id integer NOT NULL,
    ordem_servico_id integer NOT NULL,
    quantidade integer NOT NULL,
    CONSTRAINT os_pro_pk PRIMARY KEY (produto_id,ordem_servico_id),
    CONSTRAINT os_pro_produto FOREIGN KEY (produto_id)
    REFERENCES produto (id),
    CONSTRAINT os_pro_ordem_servico FOREIGN KEY (ordem_servico_id)
    REFERENCES ordem_servico (id)
);

-- Table: produto
CREATE TABLE produto (
    id integer NOT NULL CONSTRAINT produto_pk PRIMARY KEY,
    nome varchar(100) NOT NULL,
    valor decimal(10,2) NOT NULL,
    descricao text NOT NULL,
    categoria_id integer NOT NULL,
    CONSTRAINT produto_categoria FOREIGN KEY (categoria_id)
    REFERENCES categoria (id)
);

-- End of file.

