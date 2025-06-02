CREATE DATABASE almoxarifado;
USE almoxarifado;

CREATE TABLE setor (
    id INT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    gerente_id INT
);

CREATE TABLE funcionario (
    id INT PRIMARY KEY,
    cpf CHAR(11) UNIQUE NOT NULL,
    setor_id INT NOT NULL,
    nome VARCHAR(80) NOT NULL,
    ativo TINYINT NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    email VARCHAR(80) NOT NULL,
    modalidade VARCHAR(11) NOT NULL,
    cargo VARCHAR(80) NOT NULL,
    CONSTRAINT fk_setor FOREIGN KEY (setor_id) REFERENCES setor(id)
);

ALTER TABLE setor
CHANGE COLUMN gerente_id gerente_id INT NOT NULL,
ADD CONSTRAINT fk_gerente FOREIGN KEY (gerente_id) REFERENCES funcionario(id);

CREATE TABLE requisicao_de_equipamento (
    id INT PRIMARY KEY,
    requerente_id INT NOT NULL,
    tecnico_id INT,
    descricao VARCHAR(200) NOT NULL,
    data_abertura DATETIME NOT NULL,
    prazo DATETIME,
    data_conclusao DATETIME,
    CONSTRAINT fk_requerente FOREIGN KEY (requerente_id) REFERENCES funcionario(id),
    CONSTRAINT fk_tecnico FOREIGN KEY (tecnico_id) REFERENCES funcionario(id)
);

CREATE TABLE fornecedor (
    id INT PRIMARY KEY,
    cnpj CHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE compra (
    id INT PRIMARY KEY,
    fornecedor_id INT NOT NULL,
    nota_fiscal BLOB,
    data_compra DATE NOT NULL,
    previsao_entrega DATE NOT NULL,
    data_chegada DATE,
    CONSTRAINT fk_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES fornecedor(id)
);

CREATE TABLE fabricante (
    id INT PRIMARY KEY,
    cnpj CHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE modelo_equipamento (
    id INT PRIMARY KEY,
    fabricante_id INT NOT NULL,
    nome VARCHAR(80) NOT NULL,
    CONSTRAINT fk_fabricante FOREIGN KEY (fabricante_id) REFERENCES fabricante(id)
);

CREATE TABLE equipamento (
    cod_patrimonio INT PRIMARY KEY,
    modelo_id INT NOT NULL,
    compra_id INT,
    numero_de_serie VARCHAR(20) NOT NULL,
    tipo VARCHAR(25) NOT NULL,
    disponibilidade VARCHAR(25) NOT NULL,
    estado VARCHAR(20) NOT NULL,
    CONSTRAINT fk_modelo FOREIGN KEY (modelo_id) REFERENCES modelo_equipamento(id),
    CONSTRAINT fk_compra FOREIGN KEY (compra_id) REFERENCES compra(id),
    CONSTRAINT ck_tipo CHECK (tipo IN ("Desktop", "Notebook", "Monitor")),
    CONSTRAINT ck_disponibilidade CHECK (disponibilidade IN ("Em uso", "Em estoque", "Em manutenção")),
    CONSTRAINT ck_estado CHECK (estado IN ("Em bom estado", "Defeituoso", "Descartado"))
);

CREATE TABLE especificacao (
    id INT PRIMARY KEY,
    equipamento_id INT NOT NULL,
    ram VARCHAR(80) NOT NULL,
    armazenamento VARCHAR(80) NOT NULL,
    cpu VARCHAR(80) NOT NULL,
    gpu VARCHAR(80) NOT NULL,
    CONSTRAINT fk_equipamento FOREIGN KEY (equipamento_id) REFERENCES equipamento(cod_patrimonio)
);

CREATE TABLE empresa_de_assistencia (
    id INT PRIMARY KEY,
    cnpj CHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL
);

CREATE TABLE chamado_de_manutencao (
    id INT PRIMARY KEY,
    requerente_id INT NOT NULL,
    empresa_id INT NOT NULL,
    equipamento_id INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    prioridade INT NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    data_abertura DATETIME NOT NULL,
    prazo DATETIME,
    data_conclusao DATETIME,
    CONSTRAINT fk_requerente_chamado FOREIGN KEY (requerente_id) REFERENCES funcionario(id),
    CONSTRAINT fk_empresa FOREIGN KEY (empresa_id) REFERENCES empresa_de_assistencia(id),
    CONSTRAINT fk_equipamento_chamado FOREIGN KEY (equipamento_id) REFERENCES equipamento(cod_patrimonio)
);
