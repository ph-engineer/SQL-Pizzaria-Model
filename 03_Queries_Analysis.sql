-- ARQUIVO 03: CONSULTAS E ANÁLISES (SELECTS)

USE pizzaria;

-- ===================================
-- CONSULTAS SIMPLES
-- ===================================

-- 1. Ver todos os produtos disponíveis
SELECT nome, preco_g, disponivel
FROM pizzas
WHERE disponivel = 1;

-- 2. Listar nome, telefone e endereco de todos os clientes
SELECT nome, telefone, endereco
FROM clientes;


-- ===================================
-- CONSULTAS DE AGREGAÇÃO E FILTRAGEM
-- ===================================

-- 3. Calcular o faturamento total bruto (Soma de todos os valor_total dos pedidos)
SELECT SUM(valor_total) AS faturamento_total
FROM pedidos;

-- 4. Contar quantos pedidos estão no status 'Em Preparo'
SELECT COUNT(id_pedido) AS pedidos_em_preparo
FROM pedidos
WHERE status = 'Em Preparo';


-- ===================================
-- CONSULTAS COM RELACIONAMENTO (JOIN)
-- ===================================

-- 5. Consulta de 3 JOINs (Cliente, Entregador e Pedido)
-- Objetivo: Ver todos os pedidos, o nome do cliente e o entregador atribuído.
SELECT
    P.id_pedido,
    C.nome AS Nome_Cliente,
    E.nome AS Nome_Entregador,
    P.status,
    P.valor_total
FROM
    pedidos P
INNER JOIN
    clientes C ON P.id_cliente = C.id_cliente
LEFT JOIN
    entregadores E ON P.id_entregador = E.id_entregadores; -- LEFT JOIN para incluir pedidos sem entregador


-- 6. Consulta de 4 JOINs (Análise Detalhada de Itens por Cliente) - Validar e Verificar as colunas e tabelas do Banco de Dados
-- Objetivo: Ver o detalhe de tudo que a cliente 'Maria Souza' comprou.
SELECT
    C.nome AS nome_cliente,
    P.id_pedido,
    PZ.nome AS nome_pizza,
    IP.tamanho AS tamanho_pizza,
    IP.quantidade AS quantidade_pizza,
    IP.preco_unitario AS preco_unidade,
    IP.observacao
FROM
    clientes C
INNER JOIN
    pedidos P ON C.id_cliente = P.id_cliente
INNER JOIN
    itens_pedido IP ON P.id_pedido = IP.id_pedido
INNER JOIN
    pizzas PZ ON IP.id_pizza = PZ.id_pizza
WHERE
    C.nome = 'Maria Souza';