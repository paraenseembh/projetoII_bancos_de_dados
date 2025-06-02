USE almoxarifado;

INSERT INTO servico (tipo_servico) VALUES ('Fornecedor'), ('Fabricante'), ('Empresa de Assistência');
INSERT INTO	cargo (nome_cargo) VALUES ('Advogado'), ('Técnico de T.I');
INSERT INTO modalidade (nome_modalidade) VALUES ('Presencial'), ('Home Office');
INSERT INTO tipo_equipamento (tipo) VALUES ('Desktop'), ('Notebook'), ('Monitor');
INSERT INTO disponibilidade_equipamento (disponibilidade) VALUES ('Em uso'), ('Em estoque'), ('Em manutenção');
INSERT INTO estado_equipamento (estado) VALUES ('Em bom estado'), ('Defeituoso'), ('Descartado');

INSERT INTO empresa_terceirizada (cnpj, nome, telefone, email, endereco, servico_id)
VALUES 
('12345678000199', 'Altaf Fornecimentos', '11999998888', 'contato@altafito.com', 'Rua das Flores, 123 - São Paulo/SP', 1),
('98765432000155', 'Apple 2', '21988887777', 'atendimento@apple2.com', 'Av. Central, 456 - Rio de Janeiro/RJ', 2),
('45678912000122', 'Fialho & Escochi Soluções', '31977776666', 'suporte@fesol.com', 'Rua da Tecnologia, 789 - Belo Horizonte/MG', 3);

INSERT INTO setor(nome) VALUES ('Advocacia'), ('T.I');

INSERT INTO funcionario (cpf, setor_id, nome, ativo, telefone, email, modalidade_id, cargo_id) VALUES
('12345678901', 1, 'João Vitor Totoro', 1, '(31)98765-4321', 'vitin@empresa.com', 1, 1),
('23456789012', 2, 'Lucas Pará', 1, '(91)99876-1234', 'paraense@empresa.com', 2, 2),
('34567890123', 1, 'Rafael Altafito', 1, '(31)91234-5678', 'altafito@empresa.com', 1, 1),
('45678901234', 1, 'Heitor da Mota', 0, '(33)93456-7890', 'heitormota@empresa.com', 1, 2),
('56789012345', 2, 'João Carlos Escoliose', 1, '(21)94567-8901', 'joaocaraujo@empresa.com', 2, 1);

UPDATE setor SET gerente_id = 1 WHERE id = 1;
UPDATE setor SET gerente_id = 2 WHERE id = 2;

INSERT INTO requisicao_de_equipamento 
(requerente_id, tecnico_id, descricao, data_abertura, data_limite, data_conclusao) VALUES 
(1, 5, 'Pedido de Desktop para Heitor', '2025-04-15 09:30:00', '2025-04-30 18:00:00', '2025-04-20 16:20:00'),
(1, 2, 'Pedido de Notebook para João Vitor', '2025-05-28 14:00:00', '2025-06-03 17:00:00', '2025-05-29 15:30:00'),
(1, 5, 'Pedido de Monitor para Altafito', '2025-05-30 10:45:00', '2025-06-05 12:00:00', '2025-06-02 13:00:00');

INSERT INTO compra
(fornecedor_id, nota_fiscal, data_compra, previsao_entrega, data_chegada) VALUES
(1, 'https://media.licdn.com/dms/image/v2/D4E35AQHE1-miudyHkg/profile-framedphoto-shrink_200_200/B4EZY3MUFqG0Ak-/0/1744682697404?e=1749499200&v=beta&t=Fhlw-y2vKaemUZACbYJ6mg9vbEUPM_8tUo6QYkMdGio', 
'2025-04-16', '2025-04-19', '2025-04-20');

INSERT INTO modelo_equipamento (fabricante_id, nome) VALUES
(2, 'Mec Ultra'),
(2, 'Mecbook 1'),
(2, 'IindaPo 2400TI');

INSERT INTO equipamento (
  cod_patrimonio, modelo_id, compra_id, numero_de_serie,
  tipo_id, disponibilidade_id, estado_id
) VALUES
(1001, 1, 1, 'NB450G9-001', 1, 3, 2),
(1002, 2, 1, 'MONU27-002', 1, 2, 1),
(1003, 2, 1, 'PRLM234-003', 2, 1, 1),
(1004, 2, 1, 'DTM70Q-004', 2, 2, 1),
(1005, 3, 1, 'PWRLE20-005', 3, 2, 1),
(1006, 3, 1, 'SG350-006', 3, 1, 1);

INSERT INTO emprestimo (
	funcionario_id, equipamento_cod, requisicao_id, termo_de_comodato,
    data_emprestimo, data_limite, data_devolucao
) VALUES
(4, 1001, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKsgVwq-JURTH9woHRu7QNJ8RTNvdOLT_97A&s', 
'2025-04-20 16:20:00', '2025-06-10 16:20:00', '2025-05-28 07:30:00'),
(1, 1003, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMKBjqXznB-Pc__G6iUSCBY3fVfxdX_bqQNA&s',
'2025-05-29 15:30:00', '2025-07-15 15:30:00', NULL),
(3, 1006, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlavEskkl0G_XThy5dSqA5L3Zt-VdEYrXYZA&s',
'2025-06-02 13:00:00', '2025-07-10 13:00:00', NULL);

INSERT INTO especificacao (modelo_equipamento_id, ram, armazenamento, cpu, gpu)
VALUES
(1, '16GB DDR4', '512GB SSD', 'Intel Core i7-9700', 'NVIDIA GTX 1660'),
(2, '8GB DDR4', '1TB HDD', 'AMD Ryzen 5 3600', 'AMD Radeon RX 570');

INSERT INTO chamado_de_manutencao (
    requerente_id, empresa_id, equipamento_id, tipo, prioridade, 
    descricao, data_abertura, data_limite, data_conclusao
) VALUES (
    2, 3, 1001, 'Conserto', 3, 'Remover água e repor as peças inutilizáveis',
    '2025-05-30 08:00:00', '2025-06-06 12:30:00', NULL
);
