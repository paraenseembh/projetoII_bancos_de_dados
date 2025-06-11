CREATE DATABASE almoxarifado;
USE almoxarifado;

CREATE TABLE servico(
	id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_servico VARCHAR(30)
);

CREATE TABLE empresa_terceirizada (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cnpj CHAR(14) UNIQUE NOT NULL,
    nome VARCHAR(50) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    email VARCHAR(100) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    servico_id INT NOT NULL,
	CONSTRAINT fk_servico FOREIGN KEY (servico_id) REFERENCES servico(id)
);

CREATE TABLE setor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(80) NOT NULL,
    gerente_id INT
);

CREATE TABLE cargo(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_cargo VARCHAR(80) NOT NULL
);

CREATE TABLE modalidade(
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_modalidade VARCHAR(11) NOT NULL
);

CREATE TABLE funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    cpf CHAR(11) UNIQUE NOT NULL,
    setor_id INT NOT NULL,
    nome VARCHAR(80) NOT NULL,
    ativo TINYINT NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    email VARCHAR(80) NOT NULL,
    modalidade_id INT NOT NULL,
    cargo_id INT NOT NULL,
    CONSTRAINT fk_setor FOREIGN KEY (setor_id) REFERENCES setor(id),
    CONSTRAINT fk_cargo FOREIGN KEY (cargo_id) REFERENCES cargo(id),
	CONSTRAINT fk_modalidade FOREIGN KEY (modalidade_id) REFERENCES modalidade(id)
);

ALTER TABLE setor
ADD CONSTRAINT fk_gerente FOREIGN KEY (gerente_id) REFERENCES funcionario(id);

CREATE TABLE requisicao_de_equipamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    requerente_id INT NOT NULL,
    tecnico_id INT,
    descricao VARCHAR(200) NOT NULL,
    data_abertura DATETIME NOT NULL,
    data_limite DATETIME,
    data_conclusao DATETIME,
    CONSTRAINT fk_requerente FOREIGN KEY (requerente_id) REFERENCES funcionario(id),
    CONSTRAINT fk_tecnico FOREIGN KEY (tecnico_id) REFERENCES funcionario(id)
);

CREATE TABLE compra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fornecedor_id INT NOT NULL,
    nota_fiscal VARCHAR(255),
    data_compra DATE NOT NULL,
    previsao_entrega DATE NOT NULL,
    data_chegada DATE,
    CONSTRAINT fk_fornecedor FOREIGN KEY (fornecedor_id) REFERENCES empresa_terceirizada(id)
);

CREATE TABLE modelo_equipamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fabricante_id INT NOT NULL,
    nome VARCHAR(80) NOT NULL,
    CONSTRAINT fk_fabricante FOREIGN KEY (fabricante_id) REFERENCES empresa_terceirizada(id)
); 

CREATE TABLE tipo_equipamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(25) NOT NULL
);

CREATE TABLE disponibilidade_equipamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
    disponibilidade VARCHAR(25) NOT NULL
);

CREATE TABLE estado_equipamento(
	id INT PRIMARY KEY AUTO_INCREMENT,
    estado VARCHAR(25) NOT NULL
);

CREATE TABLE equipamento (
    cod_patrimonio INT PRIMARY KEY,
    modelo_id INT NOT NULL,
    compra_id INT,
    numero_de_serie VARCHAR(20) NOT NULL,
    tipo_id INT NOT NULL,
    disponibilidade_id INT NOT NULL,
    estado_id INT NOT NULL,
    CONSTRAINT fk_modelo FOREIGN KEY (modelo_id) REFERENCES modelo_equipamento(id),
    CONSTRAINT fk_compra FOREIGN KEY (compra_id) REFERENCES compra(id),
    CONSTRAINT fk_tipo FOREIGN KEY (tipo_id) REFERENCES tipo_equipamento(id),
    CONSTRAINT fk_disponibilidade FOREIGN KEY (disponibilidade_id) REFERENCES disponibilidade_equipamento(id),
    CONSTRAINT fk_estado FOREIGN KEY (estado_id) REFERENCES estado_equipamento(id)
);

CREATE TABLE emprestimo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    funcionario_id INT NOT NULL,
    equipamento_cod INT NOT NULL,
    requisicao_id INT NOT NULL,
    termo_de_comodato VARCHAR(255),
    data_emprestimo DATETIME NOT NULL,
    data_limite DATETIME,
    data_devolucao DATETIME,
    CONSTRAINT fk_funcionario_emprestimo FOREIGN KEY (funcionario_id) REFERENCES funcionario(id),
    CONSTRAINT fk_equipamento_emprestimo FOREIGN KEY (equipamento_cod) REFERENCES equipamento(cod_patrimonio),
    CONSTRAINT fk_requisicao_emprestimo FOREIGN KEY (requisicao_id) REFERENCES requisicao_de_equipamento(id)
);

CREATE TABLE especificacao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    modelo_equipamento_id INT NOT NULL,
    ram VARCHAR(80) NOT NULL,
    armazenamento VARCHAR(80) NOT NULL,
    cpu VARCHAR(80) NOT NULL,
    gpu VARCHAR(80) NOT NULL,
    CONSTRAINT fk_modelo_equipamento FOREIGN KEY (modelo_equipamento_id) REFERENCES modelo_equipamento(id)
);

CREATE TABLE chamado_de_manutencao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    requerente_id INT NOT NULL,
    empresa_id INT NOT NULL,
    equipamento_id INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    prioridade INT NOT NULL,
    descricao VARCHAR(200) NOT NULL,
    data_abertura DATETIME NOT NULL,
    data_limite DATETIME,
    data_conclusao DATETIME,
    CONSTRAINT fk_requerente_chamado FOREIGN KEY (requerente_id) REFERENCES funcionario(id),
    CONSTRAINT fk_empresa FOREIGN KEY (empresa_id) REFERENCES empresa_terceirizada(id),
    CONSTRAINT fk_equipamento_chamado FOREIGN KEY (equipamento_id) REFERENCES equipamento(cod_patrimonio)
);
