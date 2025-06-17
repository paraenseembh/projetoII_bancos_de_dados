USE almoxarifado;

-- Inserção de dados em tabelas de domínio 
INSERT INTO servico (tipo_servico) VALUES ('Fornecedor'), ('Fabricante'), ('Empresa de Assistência');
INSERT INTO cargo (nome_cargo) VALUES ('Advogado'), ('Técnico de T.I'), ('Gestor');
INSERT INTO modalidade (nome_modalidade) VALUES ('Presencial'), ('Home Office'), ('Híbrido');
INSERT INTO tipo_equipamento (tipo) VALUES ('Desktop'), ('Notebook'), ('Monitor');
INSERT INTO disponibilidade_equipamento (disponibilidade) VALUES ('Em uso'), ('Em estoque'), ('Em manutenção'), ('Reservado'), ('Indisponível');
INSERT INTO estado_equipamento (estado) VALUES ('Em bom estado'), ('Defeituoso'), ('Descartado');
INSERT INTO setor(nome) VALUES ('Tecnologia da Informação'), ('Jurídico'), ('Financeiro'), ('Projetos'), ('Recursos Humanos'), ('Marketing'), ('Vendas'), ('Logística'), ('Suporte Técnico');
INSERT INTO tipo_chamado (tipo) VALUES ('Conserto'), ('Manutenção preventiva'), ('Troca de peça'), ('Atualização'), ('Manutenção corretiva'), ('Limpeza'), ('Troca de periférico');

-- Inserção em empresa_terceirizada
INSERT INTO empresa_terceirizada (cnpj, razao_social, nome_fantasia, telefone, email, endereco)
VALUES 
('11223344000166', 'TechNova', 'TechNova', '11911112222', 'contato@technova.com', 'Rua Inovação, 321 - São Paulo/SP'),
('22334455000177', 'LogiTrans Logística', 'LogiTrans', '21922223333', 'suporte@logitrans.com.br', 'Av. das Cargas, 654 - Rio de Janeiro/RJ'),
('33445566000188', 'VerdeJardins', 'VerdeJardins', '31933334444', 'contato@verdejardins.com', 'Rua Verde, 987 - Belo Horizonte/MG'),
('44556677000199', 'SeguraMais', 'SeguraMais', '11944445555', 'atendimento@seguramais.com', 'Av. Proteção, 111 - São Paulo/SP'),
('55667788000100', 'CleanFast', 'CleanFast', '21955556666', 'contato@cleanfast.com.br', 'Rua Limpa, 222 - Rio de Janeiro/RJ'),
('12345678000199', 'Altaf Fornecimentos', 'Altaf', '11999998888', 'contato@altafito.com', 'Rua das Flores, 123 - São Paulo/SP'),
('00011122200155', 'Fialho Sistemas', 'Fialho Sistemas', '31922229999', 'contato@fialhosistemas.com', 'Rua dos Sistemas, 707 - Belo Horizonte/MG'),
('98765432000155', 'Apple 2', 'Apple 2', '21988887777', 'atendimento@apple2.com', 'Av. Central, 456 - Rio de Janeiro/RJ'),
('45678912000122', 'Fialho & Escochi Soluções', 'F&E Soluções', '31977776666', 'suporte@fesol.com', 'Rua da Tecnologia, 789 - Belo Horizonte/MG'),
('78901234000133', 'TechPlus', 'TechPlus', '11988885555', 'comercial@techplus.com', 'Av. Inovação, 101 - São Paulo/SP'),
('32109876000144', 'InfoSolutions', 'InfoSolutions', '21977774444', 'comercial@infosolutions.com', 'Rua da Informação, 202 - Rio de Janeiro/RJ'),
('65432109800111', 'Mega Equipamentos', 'Mega Equipamentos', '31966663333', 'comercial@megaequipamentos.com', 'Av. Tecnologia, 303 - Belo Horizonte/MG'),
('11122233300122', 'Fialho Fornecimentos', 'Fialho Forn.', '31955552222', 'comercial@fialhoforn.com', 'Rua das Inovações, 404 - Belo Horizonte/MG'),
('44455566600133', 'Fialho Tecnologia', 'Fialho Tec', '31944441111', 'contato@fialhotecnologia.com', 'Rua da Tecnologia, 505 - Belo Horizonte/MG'),
('77788899900144', 'Fialho Soluções', 'Fialho Soluções', '31933330000', 'contato@fialhosolucoes.com', 'Rua das Soluções, 606 - Belo Horizonte/MG');

-- Inserção em servicos_prestados 
INSERT INTO servicos_prestados (empresa_id, servico_id) 
VALUES
(1, 1), (1, 2), (2, 1), (2, 3), (3, 2), (4, 1), (5, 3),
(6, 1), (7, 2), (8, 3), (9, 1), (10, 2), (11, 3),
(12, 1), (13, 2), (14, 3), (15, 1);

-- Inserção em funcionario
INSERT INTO funcionario (cpf, setor_id, nome, ativo, telefone, email, modalidade_id, cargo_id) 
VALUES
('12345678901', 1, 'João Vitor Totoro', 1, '(31)98765-4321', 'vitin@empresa.com', 1, 3),
('23456789012', 2, 'Lucas Pará', 1, '(91)99876-1234', 'paraense@empresa.com', 2, 3),
('34567890123', 3, 'Rafael Altafito', 1, '(31)91234-5678', 'altafito@empresa.com', 1, 3),
('45678901234', 4, 'Heitor da Mota', 0, '(33)93456-7890', 'heitormota@empresa.com', 1, 2),
('56789012345', 5, 'João Carlos Escoliose', 1, '(21)94567-8901', 'joaocaraujo@empresa.com', 2, 1),
('63640001001', 6, 'Altafito Fialho', 1, '(31)98765-4321', 'altafito.fialho@empresa.com', 1, 3),
('74750002002', 7, 'João Vitor Fialho', 1, '(31)99876-1234', 'joao.fialho@empresa.com', 2, 3),
('85860003003', 8, 'Rafael Fialho', 1, '(31)91234-5678', 'rafael.fialho@empresa.com', 1, 3),
('96970004004', 9, 'Heitor Fialho', 0, '(33)93456-7890', 'heitor.fialho@empresa.com', 1, 3),
('07080005005', 1, 'João Carlos Fialho', 1, '(21)94567-8901', 'joalho@empresa.com', 2, 1),
('18190006006', 2, 'Marcos Fialho', 1, '(31)98765-4321', 'marcos.fialho@empresa.com', 1, 2),
('29200007007', 3, 'Ana Fialho', 1, '(31)99876-1234', 'ana.fialho@empresa.com', 2, 2),
('30310008008', 4, 'Carlos Fialho', 1, '(31)91234-5678', 'carlos.fialho@empresa.com', 1, 1),
('41420009009', 5, 'Fernanda Fialho', 0, '(33)93456-7890', 'fernanda.fialho@empresa.com', 1, 2),
('52530010010', 6, 'Roberto Fialho', 1, '(21)94567-8901', 'roberto.fialho.com', 2, 1),
('67890123456', 7,'Ana Beatriz Lima', 1, '(31)98765-1234', 'ana.lima@empresa.com', 2, 1),
('78901234567', 9, 'Carlos Eduardo Santos', 0, '(21)99876-4321', 'carlos.santos@empresa.com', 3, 2),
('89012345678', 1, 'Mariana Freitas', 1, '(31)91234-5679', 'mariana.freitas@empresa.com', 1, 1),
('90123456789', 2, 'Fernando Oliveira', 0, '(21)94567-8902', 'fernando.oliveira@empresa.com', 2, 2),
('01234567890', 3, 'Paula Mendes', 1, '(31)93456-7891', 'paula.mendes@empresa.com', 3, 1);

-- Atualização de Gerentes de Setor 
UPDATE setor SET gerente_id = 1 WHERE id = 1;
UPDATE setor SET gerente_id = 2 WHERE id = 2;
UPDATE setor SET gerente_id = 3 WHERE id = 3;
UPDATE setor SET gerente_id = 4 WHERE id = 4;
UPDATE setor SET gerente_id = 5 WHERE id = 5;
UPDATE setor SET gerente_id = 6 WHERE id = 6;
UPDATE setor SET gerente_id = 7 WHERE id = 7;
UPDATE setor SET gerente_id = 8 WHERE id = 8;
UPDATE setor SET gerente_id = 9 WHERE id = 9;

-- Inserção em modelo_equipamento
INSERT INTO modelo_equipamento (fabricante_id, nome) 
VALUES
(2, 'Mec Ultra'), (2, 'Mecbook 1'), (2, 'IindaPo 2400TI'), (4, 'UltraDesk 5000'),
(4, 'NoteFast X2'), (4, 'ProScreen 27" Monitor'), (4, 'ErgoMouse V3'), (4, 'SpeedKey Mechanical Keyboard'),
(2, 'Mecbook Air'), (2, 'Mecbook Pro'), (4, 'UltraDesk Mini'), (4, 'NoteFast Z3'), (4, 'ProScreen 24" Monitor');

-- Inserção em compra 
INSERT INTO compra (fornecedor_id, modelo_equipamento, nota_fiscal, data_compra, previsao_entrega, data_chegada, valor, quantidade_equipamentos) 
VALUES
(1, 1, 'https://media.licdn.com/dms/image/v2/D4E35AQHE1-miudyHkg/profile-framedphoto-shrink_200_200/B4EZY3MUFqG0Ak-/0/1744682697404?e=1749499200&v=beta&t=Fhlw-y2vKaemUZACbYJ6mg9vbEUPM_8tUo6QYkMdGio', '2025-04-16', '2025-04-19', '2025-04-20', 4500.00, 10),
(6, 2, 'https://fakeurl.com/nota_fiscal_001.pdf', '2025-05-01', '2025-05-05', '2025-05-06', 5200.50, 5),
(7, 3, 'https://fakeurl.com/nota_fiscal_002.pdf', '2025-05-10', '2025-05-15', '2025-05-16', 12300.00, 15),
(15, 4, 'https://fakeurl.com/nota_fiscal_003.pdf', '2025-06-01', '2025-06-05', '2025-06-06', 8800.75, 8),
(12, 5, 'https://fakeurl.com/nota_fiscal_004.pdf', '2025-06-10', '2025-06-14', '2025-06-15', 3400.00, 20),
(11, 6, 'https://fakeurl.com/nota_fiscal_005.pdf', '2025-06-20', '2025-06-25', '2025-06-26', 7650.25, 7),
(7, 7, 'https://fakeurl.com/nota_fiscal_006.pdf', '2025-07-01', '2025-07-05', '2025-07-06', 9100.00, 12),
(10, 8, 'https://fakeurl.com/nota_fiscal_007.pdf', '2025-07-10', '2025-07-15', '2025-07-16', 22500.00, 3),
(13, 9, 'https://fakeurl.com/nota_fiscal_008.pdf', '2025-07-20', '2025-07-25', '2025-07-26', 1500.50, 30),
(5, 10, 'https://fakeurl.com/nota_fiscal_009.pdf', '2025-08-01', '2025-08-05', '2025-08-06', 6800.00, 9);

-- Inserção em equipamento
INSERT INTO equipamento (cod_patrimonio, modelo_id, compra_id, numero_de_serie, tipo_id, disponibilidade_id, estado_id) 
VALUES
(1001, 1, 1, 'NB450G9-001', 1, 3, 2),
(1002, 2, 1, 'MONU27-002', 1, 2, 1),
(1003, 2, 1, 'PRLM234-003', 2, 1, 1),
(1004, 2, 1, 'DTM70Q-004', 2, 2, 1),
(1005, 3, 1, 'PWRLE20-005', 3, 2, 1),
(1006, 3, 1, 'SG350-006', 3, 1, 1),
(1007, 4, 2, 'NB450G9-007', 1, 1, 1),
(1008, 5, 2, 'MONU27-008', 2, 2, 1),
(1009, 6, 3, 'PRLM234-009', 3, 3, 2),
(1010, 7, 3, 'DTM70Q-010', 1, 1, 1),
(1011, 8, 4, 'PWRLE20-011', 2, 2, 1);

-- Inserção em especificacao 
INSERT INTO especificacao (equipamento_id, ram, armazenamento, cpu, gpu)
VALUES
(1001, '16GB DDR4', '512GB SSD', 'Intel Core i7-9700', 'NVIDIA GTX 1660'),
(1002, '8GB DDR4', '1TB HDD', 'AMD Ryzen 5 3600', 'AMD Radeon RX 570'),
(1003, '32GB DDR4', '1TB SSD', 'Intel Core i9-10900K', 'NVIDIA RTX 3080'),
(1004, '16GB DDR4', '256GB SSD', 'Intel Core i5-10400', 'Intel UHD Graphics 630'),
(1005, '8GB DDR3', '500GB HDD', 'AMD Ryzen 3 3200G', 'AMD Radeon Vega 8'),
(1006, '4GB DDR4', '128GB SSD', 'Intel Core i3-10100', 'Intel UHD Graphics 610'),
(1007, '16GB DDR4', '512GB SSD', 'Intel Core i7-10700', 'NVIDIA GTX 1650'),
(1008, '8GB DDR4', '256GB SSD', 'AMD Ryzen 5 3400G', 'AMD Radeon RX 560'),
(1009, '32GB DDR4', '2TB SSD', 'Intel Core i9-11900K', 'NVIDIA RTX 3090'),
(1010, '16GB DDR4', '1TB HDD', 'Intel Core i5-11400', 'Intel Iris Xe');

-- Inserção em requisicao_de_equipamento 
INSERT INTO requisicao_de_equipamento (requerente_id, tecnico_id, descricao, data_abertura, data_limite, data_conclusao) 
VALUES 
(1, 5, 'Pedido de Desktop para Heitor', '2025-04-15 09:30:00', '2025-04-30 18:00:00', '2025-04-20 16:20:00'),
(1, 2, 'Pedido de Notebook para João Vitor', '2025-05-28 14:00:00', '2025-06-03 17:00:00', '2025-05-29 15:30:00'),
(1, 5, 'Pedido de Monitor para Altafito', '2025-05-30 10:45:00', '2025-06-05 12:00:00', '2025-06-02 13:00:00'),
(2, 3, 'Solicitação de teclado para Lucas Pará', '2025-06-01 08:00:00', '2025-06-10 17:00:00', '2025-06-08 15:00:00'),
(3, 4, 'Solicitação de mouse para Rafael Altafito', '2025-06-03 09:30:00', '2025-06-12 18:00:00', '2025-06-10 16:00:00'),
(4, 1, 'Pedido de notebook para Heitor da Mota', '2025-06-05 10:00:00', '2025-06-15 17:00:00', '2025-06-13 14:00:00'),
(5, 2, 'Solicitação de monitor para João Carlos Escoliose', '2025-06-07 11:15:00', '2025-06-17 18:00:00', '2025-06-15 13:30:00'),
(2, 5, 'Pedido de desktop para Lucas Pará', '2025-06-09 12:00:00', '2025-06-19 17:00:00', '2025-06-17 16:00:00'),
(3, 1, 'Solicitação de teclado para Rafael Altafito', '2025-06-11 13:30:00', '2025-06-21 18:00:00', '2025-06-19 15:00:00'),
(4, 3, 'Pedido de mouse para Heitor da Mota', '2025-06-13 14:45:00', '2025-06-23 17:00:00', '2025-06-21 12:00:00'),
(1, 5, 'Pedido de notebook para João Vitor Totoro', '2025-06-10 09:00:00', '2025-06-17 18:00:00', '2025-06-15 15:00:00'),
(1, 18, 'Pedido de monitor para Rafael Altafito', '2025-06-11 10:15:00', '2025-06-20 18:00:00', '2025-06-18 14:30:00'),
(2, 12, 'Pedido de teclado para Lucas Pará', '2025-06-12 11:30:00', '2025-06-22 18:00:00', '2025-06-20 10:00:00'),
(2, 4, 'Pedido de mouse para João Carlos Escoliose', '2025-06-13 08:45:00', '2025-06-25 18:00:00', '2025-06-23 12:15:00'),
(1, 18, 'Pedido de desktop para Paula Mendes', '2025-06-14 09:50:00', '2025-06-28 18:00:00', '2025-06-25 16:00:00'),
(3, 2, 'Solicitação de notebook para Ana Fialho', '2025-06-15 10:00:00', '2025-06-22 17:00:00', '2025-06-20 13:00:00'),
(4, 17, 'Pedido de monitor para Carlos Fialho', '2025-06-16 11:30:00', '2025-06-23 18:00:00', '2025-06-21 15:30:00'),
(5, 4, 'Solicitação de teclado para Fernanda Fialho', '2025-06-17 09:45:00', '2025-06-24 18:00:00', '2025-06-22 11:00:00'),
(2, 5, 'Pedido de mouse para Roberto Fialho', '2025-06-18 08:20:00', '2025-06-25 18:00:00', '2025-06-23 10:30:00'),
(1, 12, 'Solicitação de desktop para Ana Beatriz Lima', '2025-06-19 14:10:00', '2025-06-26 18:00:00', '2025-06-24 16:45:00');

-- Inserção em emprestimo
INSERT INTO emprestimo (funcionario_id, equipamento_cod, requisicao_id, termo_de_comodato, data_emprestimo, data_limite, data_devolucao) 
VALUES
(4, 1001, 1, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKsgVwq-JURTH9woHRu7QNJ8RTNvdOLT_97A&s', '2025-04-20 16:20:00', '2025-06-10 16:20:00', '2025-05-28 07:30:00'),
(1, 1003, 2, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMKBjqXznB-Pc__G6iUSCBY3fVfxdX_bqQNA&s', '2025-05-29 15:30:00', '2025-07-15 15:30:00', NULL),
(3, 1006, 3, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlavEskkl0G_XThy5dSqA5L3Zt-VdEYrXYZA&s', '2025-06-02 13:00:00', '2025-07-10 13:00:00', NULL),
(2, 1002, 4, 'https://example.com/termo4.pdf', '2025-06-08 10:00:00', '2025-07-08 10:00:00', '2025-06-30 09:00:00'),
(5, 1004, 5, 'https://example.com/termo5.pdf', '2025-06-15 11:00:00', '2025-07-15 11:00:00', NULL),
(6, 1005, 6, 'https://example.com/termo6.pdf', '2025-06-20 14:00:00', '2025-07-20 14:00:00', NULL),
(7, 1007, 7, 'https://example.com/termo7.pdf', '2025-06-25 15:00:00', '2025-07-25 15:00:00', NULL),
(8, 1008, 8, 'https://example.com/termo8.pdf', '2025-07-01 16:00:00', '2025-08-01 16:00:00', NULL),
(9, 1009, 9, 'https://example.com/termo9.pdf', '2025-07-05 17:00:00', '2025-08-05 17:00:00', NULL),
(10, 1010, 10, 'https://example.com/termo10.pdf', '2025-07-10 18:00:00', '2025-08-10 18:00:00', NULL),
(11, 1011, 1, 'https://example.com/termo11.pdf', '2025-07-15 19:00:00', '2025-08-15 19:00:00', NULL),
(12, 1001, 2, 'https://example.com/termo12.pdf', '2025-07-20 20:00:00', '2025-08-20 20:00:00', NULL),
(13, 1002, 3, 'https://example.com/termo13.pdf', '2025-07-25 21:00:00', '2025-08-25 21:00:00', NULL);

-- Inserção em chamado_de_manutencao 
INSERT INTO chamado_de_manutencao (requerente_id, empresa_id, equipamento_cod, tipo_id, prioridade, descricao, data_abertura, data_limite, data_conclusao) 
VALUES
(2, 3, 1001, 1, 3, 'Remover água e repor as peças inutilizáveis','2025-05-30 08:00:00', '2025-06-06 12:30:00', NULL),
(1, 2, 1002, 2, 2, 'Limpeza interna e atualização de software', '2025-06-01 09:00:00', '2025-06-07 17:00:00', '2025-06-06 15:00:00'),
(3, 4, 1003, 3, 1, 'Substituir HD com defeito', '2025-06-02 10:30:00', '2025-06-09 18:00:00', '2025-06-08 14:00:00'),
(4, 5, 1004, 1, 2, 'Teclado não funciona', '2025-06-03 11:00:00', '2025-06-10 17:00:00', NULL),
(5, 1, 1005, 4, 1, 'Atualizar sistema operacional', '2025-06-04 08:45:00', '2025-06-11 16:00:00', '2025-06-10 13:30:00'),
(6, 2, 1006, 5, 3, 'Monitor não liga', '2025-06-05 09:20:00', '2025-06-12 18:00:00', NULL),
(7, 3, 1007, 1, 2, 'Problema na placa-mãe', '2025-06-06 10:10:00', '2025-06-13 17:00:00', '2025-06-12 11:00:00'),
(8, 4, 1008, 6, 1, 'Limpeza de cooler e troca de pasta térmica', '2025-06-07 14:00:00', '2025-06-14 16:00:00', '2025-06-13 10:00:00'),
(9, 5, 1009, 7, 2, 'Mouse com defeito', '2025-06-08 15:30:00', '2025-06-15 18:00:00', NULL),
(10, 1, 1010, 1, 3, 'Tela quebrada', '2025-06-09 16:45:00', '2025-06-16 17:00:00', NULL);