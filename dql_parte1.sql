SELECT * FROM fato_vendas LIMIT 100
SELECT * FROM dim_produto LIMIT 100
SELECT * FROM dim_loja LIMIT 100
SELECT * FROM dim_cliente LIMIT 100

-- Questão 01
SELECT COUNT(*) 
FROM fato_vendas
WHERE id_cliente IS NULL;

-- Questão 02

SELECT COUNT(DISTINCT id_cliente) 
FROM fato_vendas;

-- Questão 03

SELECT SUM(valor_total)
FROM fato_vendas 
WHERE data_venda >= '2025-01-01' AND data_venda < '2026-01-01';

-- Questão 04

SELECT DISTINCT marca
FROM dim_produto
WHERE categoria = 'Higiene'
ORDER BY marca;

-- Questão 05
SELECT AVG(valor_total)
FROM fato_vendas
WHERE canal = 'Aplicativo';

-- Questão 06
SELECT COUNT(preco_tabela)
FROM dim_produto
WHERE categoria = 'Bebidas' AND preco_tabela > 10;

-- Questão 07
SELECT nome_produto, marca, preco_tabela
FROM dim_produto
ORDER BY preco_tabela DESC, nome_produto ASC LIMIT 1;

-- Questão 08

-- Questão 09

-- Questão 10

-- Questão 11

-- Questão 12

-- Questão 13

-- Questão 14

-- Questão 15

-- Questão 16

-- Questão 17

-- Questão 18

-- Questão 19

-- Questão 20

-- Questão 21

-- Questão 22

-- Questão 23

-- Questão 24

-- Questão 25