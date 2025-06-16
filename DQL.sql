#Pergunta: Quais equipamentos foram emprestados, por quem, e qual seu tipo, ordenados por data de empréstimo?#
SELECT 
    f.nome AS funcionario,
    te.tipo AS tipo_equipamento,
    e.cod_patrimonio,
    emp.data_emprestimo
FROM emprestimo emp
JOIN funcionario f ON emp.funcionario_id = f.id
JOIN equipamento e ON emp.equipamento_cod = e.cod_patrimonio
JOIN tipo_equipamento te ON e.tipo_id = te.id
ORDER BY emp.data_emprestimo DESC;

#Pergunta: Quais chamados de manutenção ainda estão abertos (sem data de conclusão), incluindo empresa responsável e equipamento?#
SELECT 
    ch.id AS chamado_id,
    et.nome AS empresa,
    eq.cod_patrimonio,
    ch.tipo,
    ch.data_abertura
FROM chamado_de_manutencao ch
JOIN empresa_terceirizada et ON ch.empresa_id = et.id
JOIN equipamento eq ON ch.equipamento_id = eq.cod_patrimonio
WHERE ch.data_conclusao IS NULL
ORDER BY ch.data_abertura DESC;

#Pergunta: Quais equipamentos do tipo "Notebook" foram emprestados entre duas datas?#
SELECT 
    f.nome AS funcionario,
    e.cod_patrimonio,
    te.tipo,
    emp.data_emprestimo
FROM emprestimo emp
JOIN funcionario f ON emp.funcionario_id = f.id
JOIN equipamento e ON emp.equipamento_cod = e.cod_patrimonio
JOIN tipo_equipamento te ON e.tipo_id = te.id
WHERE te.tipo LIKE '%Notebook%'
  AND emp.data_emprestimo BETWEEN '2024-01-01' AND '2024-12-31'
ORDER BY emp.data_emprestimo;

#Pergunta: Quais equipamentos foram comprados de empresas específicas e ainda não chegaram?#
SELECT 
    e.cod_patrimonio,
    me.nome,
    c.data_compra,
    c.previsao_entrega
FROM equipamento e
JOIN compra c ON e.compra_id = c.id
JOIN empresa_terceirizada me ON c.fornecedor_id = me.id
WHERE me.nome IN ('TechPlus', 'InfoSolutions')
  AND c.data_chegada IS NULL;


#Pergunta: Quantos equipamentos existem por tipo?#
SELECT 
    te.tipo,
    COUNT(e.cod_patrimonio) AS quantidade
FROM equipamento e
JOIN tipo_equipamento te ON e.tipo_id = te.id
GROUP BY te.tipo
ORDER BY quantidade DESC;

#Pergunta: Quais funcionários realizaram mais de 2 empréstimos?#
SELECT 
    f.nome,
    COUNT(emp.id) AS total_emprestimos
FROM emprestimo emp
JOIN funcionario f ON emp.funcionario_id = f.id
GROUP BY f.nome
HAVING COUNT(emp.id) > 2
ORDER BY total_emprestimos DESC;

#Pergunta: Quais equipamentos foram comprados na mesma data da última compra registrada?#
SELECT cod_patrimonio, compra_id
FROM equipamento
WHERE compra_id IN (
    SELECT id FROM compra WHERE data_compra = (
        SELECT MAX(data_compra) FROM compra
    )
);

#Pergunta: Quais funcionários trabalham no mesmo setor que seu gerente?#
SELECT f1.nome
FROM funcionario f1
WHERE setor_id IN (
    SELECT s.id FROM setor s
    WHERE s.gerente_id = f1.id
);

#Pergunta: Quais empresas já fabricaram algum modelo de equipamento?#
SELECT et.nome
FROM empresa_terceirizada et
WHERE EXISTS (
    SELECT 1 FROM modelo_equipamento me
    WHERE me.fabricante_id = et.id
);

#Pergunta: Quais tipos de equipamento têm quantidade acima de todos os outros?#
SELECT te.tipo, COUNT(e.cod_patrimonio) AS total
FROM equipamento e
JOIN tipo_equipamento te ON e.tipo_id = te.id
GROUP BY te.tipo
HAVING COUNT(e.cod_patrimonio) > ALL (
    SELECT COUNT(e2.cod_patrimonio)
    FROM equipamento e2
    JOIN tipo_equipamento te2 ON e2.tipo_id = te2.id
    GROUP BY te2.tipo
    HAVING te2.tipo <> te.tipo
);

# Pergunta: Quais equipamentos estão disponíveis para empréstimo e nunca foram emprestados? #
SELECT 
    e.cod_patrimonio,
    me.nome AS modelo,
    te.tipo,
    de.disponibilidade,
    ee.estado
FROM equipamento e
JOIN modelo_equipamento me ON e.modelo_id = me.id
JOIN tipo_equipamento te ON e.tipo_id = te.id
JOIN disponibilidade_equipamento de ON e.disponibilidade_id = de.id
JOIN estado_equipamento ee ON e.estado_id = ee.id
WHERE de.disponibilidade = 'Disponível'
  AND NOT EXISTS (
      SELECT 1 FROM emprestimo emp 
      WHERE emp.equipamento_cod = e.cod_patrimonio
  )
ORDER BY te.tipo, me.nome;

# Pergunta: Quais funcionários ativos trabalham em modo presencial e seus respectivos setores? #
SELECT 
    f.nome AS funcionario,
    s.nome AS setor,
    c.nome_cargo AS cargo,
    f.telefone,
    f.email
FROM funcionario f
JOIN setor s ON f.setor_id = s.id
JOIN cargo c ON f.cargo_id = c.id
JOIN modalidade m ON f.modalidade_id = m.id
WHERE f.ativo = 1 
  AND m.nome_modalidade = 'Presencial'
ORDER BY s.nome, f.nome;

# Pergunta: Quais requisições de equipamento foram abertas mas ainda não foram atendidas por nenhum técnico? #
SELECT 
    req.id AS requisicao_id,
    f.nome AS requerente,
    s.nome AS setor_requerente,
    req.descricao,
    req.data_abertura,
    DATEDIFF(CURDATE(), req.data_abertura) AS dias_em_aberto
FROM requisicao_de_equipamento req
JOIN funcionario f ON req.requerente_id = f.id
JOIN setor s ON f.setor_id = s.id
WHERE req.tecnico_id IS NULL
  AND req.data_conclusao IS NULL
ORDER BY req.data_abertura;

# Pergunta: Qual é o tempo médio entre a compra e a chegada dos equipamentos por fornecedor? #
SELECT 
    et.nome AS fornecedor,
    COUNT(c.id) AS total_compras,
    AVG(DATEDIFF(c.data_chegada, c.data_compra)) AS media_dias_entrega,
    MIN(DATEDIFF(c.data_chegada, c.data_compra)) AS menor_tempo_entrega,
    MAX(DATEDIFF(c.data_chegada, c.data_compra)) AS maior_tempo_entrega
FROM compra c
JOIN empresa_terceirizada et ON c.fornecedor_id = et.id
WHERE c.data_chegada IS NOT NULL
GROUP BY et.nome, et.id
HAVING COUNT(c.id) >= 1
ORDER BY media_dias_entrega;

# Pergunta: Quais equipamentos têm empréstimos em atraso (passaram da data limite sem devolução)? #
SELECT 
    f.nome AS funcionario,
    f.telefone,
    s.nome AS setor,
    e.cod_patrimonio,
    te.tipo AS tipo_equipamento,
    emp.data_emprestimo,
    emp.data_limite,
    DATEDIFF(CURDATE(), emp.data_limite) AS dias_em_atraso
FROM emprestimo emp
JOIN funcionario f ON emp.funcionario_id = f.id
JOIN setor s ON f.setor_id = s.id
JOIN equipamento e ON emp.equipamento_cod = e.cod_patrimonio
JOIN tipo_equipamento te ON e.tipo_id = te.id
WHERE emp.data_devolucao IS NULL
  AND emp.data_limite IS NOT NULL
  AND emp.data_limite < CURDATE()
ORDER BY dias_em_atraso DESC, f.nome;