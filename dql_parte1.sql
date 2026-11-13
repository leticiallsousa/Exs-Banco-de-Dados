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
SELECT categoria, COUNT(*)
FROM dim_produto
GROUP BY categoria
ORDER BY COUNT(*) DESC, categoria ASC;

-- Questão 09
SELECT categoria, AVG(preco_tabela) as media
FROM dim_produto
GROUP BY categoria
ORDER BY media DESC;

-- Questão 10
SELECT cidade, COUNT(*)
FROM dim_cliente
GROUP BY cidade
HAVING COUNT(*) >= 60 
ORDER BY cidade ASC;

-- Questão 11
SELECT COUNT(id_cliente)
FROM dim_cliente
WHERE email IS NULL;

-- Questão 12
SELECT COUNT(id_cliente)
FROM dim_cliente
WHERE sexo = 'F' AND data_nascimento BETWEEN '1990-01-01' AND '1999-12-31';

-- Questão 13
SELECT COUNT(id_cliente)
FROM dim_cliente
WHERE nome LIKE 'Ana %' OR nome = 'Ana';

-- Questão 14
SELECT uf, COUNT(id_loja) AS quantidade
FROM dim_loja
GROUP BY uf
HAVING COUNT(id_loja) > 3
ORDER BY quantidade DESC;

-- Questão 15
SELECT nome_loja, cidade, data_inauguracao
FROM dim_loja
WHERE data_inauguracao < '2007-01-01'
ORDER BY data_inauguracao ASC;

-- Questão 16
SELECT canal, SUM(valor_total) as faturamento
FROM fato_vendas
WHERE data_venda BETWEEN '2025-01-01' and '2025-12-31'
GROUP BY canal
ORDER BY faturamento DESC;

-- Questão 17
SELECT forma_pagamento, COUNT(*), SUM(valor_total) as faturamento
FROM fato_vendas
WHERE canal = 'Loja física'
GROUP BY forma_pagamento
ORDER BY faturamento DESC;

-- Questão 18
SELECT id_produto, SUM(quantidade) AS unidades
FROM fato_vendas
GROUP BY id_produto
ORDER BY unidades DESC, id_produto ASC LIMIT 10;

-- Questão 19
SELECT id_loja, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE data_venda BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY id_loja
ORDER BY faturamento DESC LIMIT 5;

-- Questão 20
SELECT id_loja, COUNT(id_loja) as quantidade
FROM fato_vendas
GROUP BY id_loja
HAVING COUNT(id_loja) > 300
ORDER BY quantidade DESC;

-- Questão 21
SELECT id_cliente, COUNT(*) AS quantidade
FROM fato_vendas
WHERE id_cliente IS NOT NULL
GROUP BY id_cliente
HAVING COUNT(*) >= 70
ORDER BY quantidade DESC, id_cliente ASC;

-- Questão 22
SELECT COUNT(id_venda), ROUND(AVG(desconto), 2) as desconto
FROM fato_vendas
WHERE desconto > 0;

-- Questão 23
SELECT MIN(valor_total) AS menor_valor,
		MAX(valor_total) AS maior_valor
FROM fato_vendas
WHERE data_venda BETWEEN '2025-12-01' AND '2025-12-31';

-- Questão 24
SELECT COUNT(id_venda) as linhas_venda, SUM(valor_total) as faturamento
FROM fato_vendas
WHERE data_venda = '2025-12-24';

-- Questão 25
SELECT id_venda, 
		quantidade*preco_unitario AS valor_bruto, 
		desconto, 
		valor_total, 
		ROUND(desconto/(quantidade*preco_unitario)*100, 2) AS percentual_desconto
FROM fato_vendas
WHERE canal = 'Site' AND data_venda BETWEEN '2025-01-01' AND '2025-12-31' AND desconto > 0
ORDER BY percentual_desconto DESC, id_venda ASC LIMIT 10;
