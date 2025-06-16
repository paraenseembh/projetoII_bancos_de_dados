USE almoxarifado;

-- Serviço
INSERT INTO servico (tipo_servico) VALUES ('Fornecedor'), ('Fabricante'), ('Empresa de Assistência');
-- Cargo
INSERT INTO	cargo (nome_cargo) VALUES ('Advogado'), ('Técnico de T.I'), ('Gestor');
--Modalidade
INSERT INTO modalidade (nome_modalidade) VALUES ('Presencial'), ('Home Office'), ('Híbrido');
-- Empresa Terceirizada
INSERT INTO tipo_equipamento (tipo) VALUES ('Desktop'), ('Notebook'), ('Monitor');
-- Disponibilidade
INSERT INTO disponibilidade_equipamento (disponibilidade) VALUES ('Em uso'), ('Em estoque'), ('Em manutenção'), ('Reservado'), ('Indisponível');
-- Estado Equipamento
INSERT INTO estado_equipamento (estado) VALUES ('Em bom estado'), ('Defeituoso'), ('Descartado');
-- Setor
INSERT INTO setor(nome) VALUES ('Tecnologia da Informação'), ('Jurídico'), ('Financeiro'), ('Projetos'), 
('Recursos Humanos'), ('Marketing'), ('Vendas'), ('Logística'), ('Suporte Técnico');

-- Empresa Terceirizada
INSERT INTO empresa_terceirizada (cnpj, nome, telefone, email, endereco, servico_id)
VALUES 
('11223344000166', 'TechNova', '11911112222', 'contato@technova.com', 'Rua Inovação, 321 - São Paulo/SP', 1),
('22334455000177', 'LogiTrans Logística', '21922223333', 'suporte@logitrans.com.br', 'Av. das Cargas, 654 - Rio de Janeiro/RJ', 2),
('33445566000188', 'VerdeJardins', '31933334444', 'contato@verdejardins.com', 'Rua Verde, 987 - Belo Horizonte/MG', 3),
('44556677000199', 'SeguraMais', '11944445555', 'atendimento@seguramais.com', 'Av. Proteção, 111 - São Paulo/SP', 1),
('55667788000100', 'CleanFast', '21955556666', 'contato@cleanfast.com.br', 'Rua Limpa, 222 - Rio de Janeiro/RJ', 2);
('12345678000199', 'Altaf Fornecimentos', '11999998888', 'contato@altafito.com', 'Rua das Flores, 123 - São Paulo/SP', 3),
('00011122200155', 'Fialho Sistemas', '31922229999', 'Rua dos Sistemas, 707 - Belo Horizonte/MG', 1);
('98765432000155', 'Apple 2', '21988887777', 'atendimento@apple2.com', 'Av. Central, 456 - Rio de Janeiro/RJ', 2),
('45678912000122', 'Fialho & Escochi Soluções', '31977776666', 'suporte@fesol.com', 'Rua da Tecnologia, 789 - Belo Horizonte/MG', 3),
('78901234000133', 'TechPlus', '11988885555', 'comercial@techplus.com', 'Av. Inovação, 101 - São Paulo/SP', 3),
('32109876000144', 'InfoSolutions', '21977774444', 'comercial@infosolutions.com', 'Rua da Informação, 202 - Rio de Janeiro/RJ', 1),
('65432109800111', 'Mega Equipamentos', '31966663333', 'comercial@megaequipamentos.com', 'Av. Tecnologia, 303 - Belo Horizonte/MG', 2),
('11122233300122', 'Fialho Fornecimentos', '31955552222', 'comercial@fialhoforn.com', 'Rua das Inovações, 404 - Belo Horizonte/MG', 3),
('44455566600133', 'Fialho Tecnologia', '31944441111', 'Rua da Tecnologia, 505 - Belo Horizonte/MG', 1),
('77788899900144', 'Fialho Soluções', '31933330000', 'Rua das Soluções, 606 - Belo Horizonte/MG', 2);

INSERT INTO servicos_prestados (empresa_id, servico_id) VALUES
(1, 1), (1, 2), (2, 1), (2, 3), (3, 2), (4, 1), (5, 3),
(6, 1), (7, 2), (8, 3), (9, 1), (10, 2), (11, 3),
(12, 1), (13, 2), (14, 3), (15, 1);

INSERT INTO funcionario (cpf, setor_id, nome, ativo, telefone, email, modalidade_id, cargo_id) VALUES
('12345678901', 1, 'João Vitor Totoro', 1, '(31)98765-4321', 'vitin@empresa.com', 1, 3),
('23456789012', 2, 'Lucas Pará', 1, '(91)99876-1234', 'paraense@empresa.com', 2, 3),
('34567890123', 3, 'Rafael Altafito', 1, '(31)91234-5678', 'altafito@empresa.com', 1, 3),
('45678901234', 4, 'Heitor da Mota', 0, '(33)93456-7890', 'heitormota@empresa.com', 1, 2),
('56789012345', 5, 'João Carlos Escoliose', 1, '(21)94567-8901', 'joaocaraujo@empresa.com', 2, 1);
('63640001001', 6, 'Altafito Fialho', 1, '(31)98765-4321', 'altafito.fialho@empresa.com', 1, 3);
('74750002002', 7, 'João Vitor Fialho', 1, '(31)99876-1234', 'joao.fialho@empresa.com', 2, 3);
('85860003003', 8, 'Rafael Fialho', 1, '(31)91234-5678', 'rafael.fialho@empresa.com', 1, 3);
('96970004004', 9, 'Heitor Fialho', 0, '(33)93456-7890', 'heitor.fialho@empresa.com', 1, 3);
('07080005005', 1, 'João Carlos Fialho', 1, '(21)94567-8901', 'joalho@empresa.com', 2, 1);
('18190006006', 2, 'Marcos Fialho', 1, '(31)98765-4321', 'marcos.fialho@empresa.com', 1, 2);
('29200007007', 3, 'Ana Fialho', 1, '(31)99876-1234', 'ana.fialho@empresa.com', 2, 2),
('30310008008', 4, 'Carlos Fialho', 1, '(31)91234-5678', 'carlos.fialho@empresa.com', 1, 1),
('41420009009', 5, 'Fernanda Fialho', 0, '(33)93456-7890', 'fernanda.fialho@empresa.com', 1, 2),
('52530010010', 6, 'Roberto Fialho', 1, '(21)94567-8901', 'roberto.fialho.com', 2, 1);
('67890123456', 7,'Ana Beatriz Lima', 1, '(31)98765-1234', 'ana.lima@empresa.com', 2, 1),
('78901234567', 9, 'Carlos Eduardo Santos', 0, '(21)99876-4321', 'carlos.santos@empresa.com', 3, 2),
('89012345678', 1, 'Mariana Freitas', 1, '(31)91234-5679', 'mariana.freitas@empresa.com', 1, 1),
('90123456789', 2, 'Fernando Oliveira', 0, '(21)94567-8902', 'fernando.oliveira@empresa.com', 2, 2),
('01234567890', 3, 'Paula Mendes', 1, '(31)93456-7891', 'paula.mendes@empresa.com', 3, 1);

UPDATE setor SET gerente_id = 1 WHERE id = 1;
UPDATE setor SET gerente_id = 2 WHERE id = 2;
UPDATE setor SET gerente_id = 3 WHERE id = 3;


INSERT INTO requisicao_de_equipamento 
(requerente_id, tecnico_id, descricao, data_abertura, data_limite, data_conclusao) VALUES 
(1, 5, 'Pedido de Desktop para Heitor', '2025-04-15 09:30:00', '2025-04-30 18:00:00', '2025-04-20 16:20:00'),
(1, 2, 'Pedido de Notebook para João Vitor', '2025-05-28 14:00:00', '2025-06-03 17:00:00', '2025-05-29 15:30:00'),
(1, 5, 'Pedido de Monitor para Altafito', '2025-05-30 10:45:00', '2025-06-05 12:00:00', '2025-06-02 13:00:00');

INSERT INTO compra
(fornecedor_id, nota_fiscal, data_compra, previsao_entrega, data_chegada) VALUES
(1, 'https://media.licdn.com/dms/image/v2/D4E35AQHE1-miudyHkg/profile-framedphoto-shrink_200_200/B4EZY3MUFqG0Ak-/0/1744682697404?e=1749499200&v=beta&t=Fhlw-y2vKaemUZACbYJ6mg9vbEUPM_8tUo6QYkMdGio', 
'2025-04-16', '2025-04-19', '2025-04-20')
(22, 'https://fakeurl.com/nota_fiscal_001.pdf', '2025-05-01', '2025-05-05', '2025-05-06'),
(22, 'https://fakeurl.com/nota_fiscal_002.pdf', '2025-05-10', '2025-05-15', '2025-05-16'),
(15, 'https://fakeurl.com/nota_fiscal_003.pdf', '2025-06-01', '2025-06-05', '2025-06-06'),
(19, 'https://fakeurl.com/nota_fiscal_004.pdf', '2025-06-10', '2025-06-14', '2025-06-15'),
(19, 'https://fakeurl.com/nota_fiscal_005.pdf', '2025-06-20', '2025-06-25', '2025-06-26');

INSERT INTO modelo_equipamento (fabricante_id, nome) VALUES
(2, 'Mec Ultra'),
(2, 'Mecbook 1'),
(2, 'IindaPo 2400TI')
(4, 'UltraDesk 5000'),
(4, 'NoteFast X2'),
(4, 'ProScreen 27" Monitor'),
(4, 'ErgoMouse V3'),
(4, 'SpeedKey Mechanical Keyboard');;

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

INSERT INTO requisicao_de_equipamento(
    requerente_id, tecnico_id, descricao, data_abertura, data_limite, data_conclusao
) VALUES 
(1, 5, 'Pedido de notebook para João Vitor Totoro', '2025-06-10 09:00:00', '2025-06-17 18:00:00', '2025-06-15 15:00:00'),
(1, 21, 'Pedido de monitor para Rafael Altafito', '2025-06-11 10:15:00', '2025-06-20 18:00:00', '2025-06-18 14:30:00'),
(2, 23, 'Pedido de teclado para Lucas Pará', '2025-06-12 11:30:00', '2025-06-22 18:00:00', '2025-06-20 10:00:00'),
(2, 16, 'Pedido de mouse para João Carlos Escoliose', '2025-06-13 08:45:00', '2025-06-25 18:00:00', '2025-06-23 12:15:00'),
(1, 21, 'Pedido de desktop para Paula Mendes', '2025-06-14 09:50:00', '2025-06-28 18:00:00', '2025-06-25 16:00:00');

INSERT INTO chamado_de_manutencao (
    requerente_id, empresa_id, equipamento_id, tipo, prioridade, 
    descricao, data_abertura, data_limite, data_conclusao
) VALUES (2, 3, 1001, 'Conserto', 3, 'Remover água e repor as peças inutilizáveis','2025-05-30 08:00:00', '2025-06-06 12:30:00', NULL);
