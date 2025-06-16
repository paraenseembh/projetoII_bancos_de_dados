## Pergunta 1
**Quais equipamentos foram emprestados, por quem, e qual seu tipo, ordenados por data de empréstimo?**
```sql
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
```

---

## Pergunta 2
**Quais chamados de manutenção ainda estão abertos (sem data de conclusão), incluindo empresa responsável e equipamento?**
```sql
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
```

---

## Pergunta 3
**Quais equipamentos do tipo "Notebook" foram emprestados entre duas datas?**
```sql
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
```

---

## Pergunta 4
**Quais equipamentos foram comprados de empresas específicas e ainda não chegaram?**
```sql
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
```

---

## Pergunta 5
**Quantos equipamentos existem por tipo?**
```sql
SELECT 
    te.tipo,
    COUNT(e.cod_patrimonio) AS quantidade
FROM equipamento e
JOIN tipo_equipamento te ON e.tipo_id = te.id
GROUP BY te.tipo
ORDER BY quantidade DESC;
```

---

## Pergunta 6
**Quais funcionários realizaram mais de 2 empréstimos?**
```sql
SELECT 
    f.nome,
    COUNT(emp.id) AS total_emprestimos
FROM emprestimo emp
JOIN funcionario f ON emp.funcionario_id = f.id
GROUP BY f.nome
HAVING COUNT(emp.id) > 2
ORDER BY total_emprestimos DESC;
```

---

## Pergunta 7
**Quais equipamentos foram comprados na mesma data da última compra registrada?**
```sql
SELECT cod_patrimonio, compra_id
FROM equipamento
WHERE compra_id IN (
    SELECT id FROM compra WHERE data_compra = (
        SELECT MAX(data_compra) FROM compra
    )
);
```

---

## Pergunta 8
**Quais funcionários trabalham no mesmo setor que seu gerente?**
```sql
SELECT f1.nome
FROM funcionario f1
WHERE setor_id IN (
    SELECT s.id FROM setor s
    WHERE s.gerente_id = f1.id
);
```

---

## Pergunta 9
**Quais empresas já fabricaram algum modelo de equipamento?**
```sql
SELECT et.nome
FROM empresa_terceirizada et
WHERE EXISTS (
    SELECT 1 FROM modelo_equipamento me
    WHERE me.fabricante_id = et.id
);
```

---

## Pergunta 10
**Quais tipos de equipamento têm quantidade acima de todos os outros?**
```sql
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
```