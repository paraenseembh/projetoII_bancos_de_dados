CREATE DATABASE Almoxarifado;
USE Almoxarifado;

CREATE TABLE setor (
    id INT PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE funcionario (
    id INT PRIMARY KEY,
    cpf CHAR(11),
    setor_id INT,
    nome VARCHAR(80),
    ativo TINYINT,
    telefone VARCHAR(14),
    email VARCHAR(80),CREATE TABLE setor (
    id INT PRIMARY KEY,
    nome VARCHAR(80)
);

CREATE TABLE funcionario (
    id INT PRIMARY KEY,
    cpf CHAR(11),
    setor_id INT,
    nome VARCHAR(80),
    ativo TINYINT,
    telefone VARCHAR(14),
    email VARCHAR(80),
    modalidade VARCHAR(11),
    cargo VARCHAR(80),
    CONSTRAINT fk_setor FOREIGN KEY (setor_id) REFERENCES setor(id)
);

CREATE TABLE requisicao_de_equipamento (
    id INT PRIMARY KEY,
    requerente_id INT,
    tecnico_id INT,
    descricao VARCHAR(200),
    data_abertura DATETIME,
    prazo DATETIME,
    data_conclusao DATETIME,
    CONSTRAINT fk_requerente FOREIGN KEY (requerente_id) REFERENCES funcionario(id),
    CONSTRAINT fk_tecnico FOREIGN KEY (tecnico_id) REFERENCES funcionario(id)
);

CREATE TABLE fornecedor (
    id INT PRIMARY KEY,
    cnpj CHAR(14),
    nome VARCHAR(50),
    telefone VARCHAR(14),
    email VARCHAR(100),
    endereco VARCHAR(100)
);

CREATE TABLE compra (
    id INT PRIMARY KEY,
    fornecedor_id INT,
    nota_fiscal BLOB,
    data_compra DATE,
    previsao_entrega DATE,
    data_chegada DATE,
    CONSTRAINT fk_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

CREATE TABLE fabricante (
    id INT PRIMARY KEY,
    cnpj CHAR(14),
    nome VARCHAR(50),
    telefone VARCHAR(14),
    email VARCHAR(100),
    endereco VARCHAR(100)
);

CREATE TABLE modelo_equipamento (
    id INT PRIMARY KEY,
    fabricante_id INT,
    nome VARCHAR(80),
    CONSTRAINT fk_fabricante FOREIGN KEY (fabricante_id) REFERENCES fabricante(id)
);

CREATE TABLE equipamento (
    cod_patrimonio INT PRIMARY KEY,
    modelo_id INT,
    compra_id INT,
    numero_de_serie VARCHAR(20),
    tipo VARCHAR(25),
    disponibilidade VARCHAR(25),
    estado VARCHAR(20),
    CONSTRAINT fk_modelo FOREIGN KEY (modelo_id) REFERENCES modelo_equipamento(id),
    CONSTRAINT fk_compra FOREIGN KEY (compra_id) REFERENCES compra(id)
);

CREATE TABLE especificacao (
    id INT PRIMARY KEY,
    equipamento_id INT,
    ram VARCHAR(80),
    armazenamento VARCHAR(80),
    cpu VARCHAR(80),
    gpu VARCHAR(80),
    CONSTRAINT fk_equipamento FOREIGN KEY (equipamento_id) REFERENCES equipamento(cod_patrimonio)
);

CREATE TABLE empresa_de_assistencia (
    id INT PRIMARY KEY,
    cnpj CHAR(14),
    nome VARCHAR(100),
    telefone VARCHAR(14),
    email VARCHAR(100),
    endereco VARCHAR(100)
);

CREATE TABLE chamado_de_manutencao (
    id INT PRIMARY KEY,
    requerente_id INT,
    empresa_id INT,
    equipamento_id INT,
    tipo VARCHAR(20),
    prioridade INT,
    descricao VARCHAR(200),
    data_abertura DATETIME,
    prazo DATETIME,
    data_conclusao DATETIME,
    CONSTRAINT fk_requerente_chamado FOREIGN KEY (requerente_id) REFERENCES funcionario(id),
    CONSTRAINT fk_empresa FOREIGN KEY (empresa_id) REFERENCES empresa_de_assistencia(id),
    CONSTRAINT fk_equipamento_chamado FOREIGN KEY (equipamento_id) REFERENCES equipamento(cod_patrimonio)
);
    modalidade VARCHAR(11),
    cargo VARCHAR(80),
    CONSTRAINT fk_setor FOREIGN KEY (setor_id) REFERENCES setor(id)
);

CREATE TABLE requisicao_de_equipamento (
    id INT PRIMARY KEY,
    requerente_id INT,
    tecnico_id INT,
    descricao VARCHAR(200),
    data_abertura DATETIME,
    prazo DATETIME,
    data_conclusao DATETIME,
    CONSTRAINT fk_requerente FOREIGN KEY (requerente_id) REFERENCES funcionario(id),
    CONSTRAINT fk_tecnico FOREIGN KEY (tecnico_id) REFERENCES funcionario(id)
);

CREATE TABLE fornecedor (
    id INT PRIMARY KEY,
    cnpj CHAR(14),
    nome VARCHAR(50),
    telefone VARCHAR(14),
    email VARCHAR(100),
    endereco VARCHAR(100)
);

CREATE TABLE compra (
    id INT PRIMARY KEY,
    fornecedor_id INT,
    nota_fiscal BLOB,
    data_compra DATE,
    previsao_entrega DATE,
    data_chegada DATE,
    CONSTRAINT fk_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

CREATE TABLE fabricante (
    id INT PRIMARY KEY,
    cnpj CHAR(14),
    nome VARCHAR(50),
    telefone VARCHAR(14),
    email VARCHAR(100),
    endereco VARCHAR(100)
);

CREATE TABLE modelo_equipamento (
    id INT PRIMARY KEY,
    fabricante_id INT,
    nome VARCHAR(80),
    CONSTRAINT fk_fabricante FOREIGN KEY (fabricante_id) REFERENCES fabricante(id)
);

CREATE TABLE equipamento (
    cod_patrimonio INT PRIMARY KEY,
    modelo_id INT,
    compra_id INT,
    numero_de_serie VARCHAR(20),
    tipo VARCHAR(25),
    disponibilidade VARCHAR(25),
    estado VARCHAR(20),
    CONSTRAINT fk_modelo FOREIGN KEY (modelo_id) REFERENCES modelo_equipamento(id),
    CONSTRAINT fk_compra FOREIGN KEY (compra_id) REFERENCES compra(id)
);

CREATE TABLE especificacao (
    id INT PRIMARY KEY,
    equipamento_id INT,
    ram VARCHAR(80),
    armazenamento VARCHAR(80),
    cpu VARCHAR(80),
    gpu VARCHAR(80),
    CONSTRAINT fk_equipamento FOREIGN KEY (equipamento_id) REFERENCES equipamento(cod_patrimonio)
);

CREATE TABLE empresa_de_assistencia (
    id INT PRIMARY KEY,
    cnpj CHAR(14),
    nome VARCHAR(100),
    telefone VARCHAR(14),
    email VARCHAR(100),
    endereco VARCHAR(100)
);

CREATE TABLE chamado_de_manutencao (
    id INT PRIMARY KEY,
    requerente_id INT,
    empresa_id INT,
    equipamento_id INT,
    tipo VARCHAR(20),
    prioridade INT,
    descricao VARCHAR(200),
    data_abertura DATETIME,
    prazo DATETIME,
    data_conclusao DATETIME,
    CONSTRAINT fk_requerente_chamado FOREIGN KEY (requerente_id) REFERENCES funcionario(id),
    CONSTRAINT fk_empresa FOREIGN KEY (empresa_id) REFERENCES empresa_de_assistencia(id),
    CONSTRAINT fk_equipamento_chamado FOREIGN KEY (equipamento_id) REFERENCES equipamento(cod_patrimonio)
);