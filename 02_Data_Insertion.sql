-- ARQUIVO 02: INSERÇÃO DE DADOS (DML)

USE pizzaria;

-- A. INSERÇÃO NA TABELA 'pizzas' (Produtos)
INSERT INTO `pizzas` (`nome`, `descricao`, `preco_p`, `preco_m`, `preco_g`, `disponivel`) VALUES
('Margherita', 'Molho de tomate, mussarela e manjericão.', 25.00, 35.00, 45.00, 1),
('Calabresa', 'Molho, mussarela, calabresa e cebola.', 28.50, 39.90, 49.90, 1),
('Quatro Queijos', 'Mussarela, provolone, parmesão e gorgonzola.', 30.00, 42.00, 55.00, 1),
('Chocolate', 'Chocolate ao leite com morangos frescos.', 20.00, 30.00, 40.00, 0);

-- B. INSERÇÃO NA TABELA 'clientes'
INSERT INTO `clientes` (`nome`, `telefone`, `endereco`, `complemento`, `cep`) VALUES
('João da Silva', '11987654321', 'Rua das Flores, 100', 'Ap. 101, Bloco A', '01000-001'),
('Maria Souza', '11999998888', 'Avenida Principal, 55', 'Casa 2', '02000-002'),
('Pedro Santos', '11977776666', 'Travessa da Lua, 20', NULL, NULL),
('Ana Costa', '11955554444', 'Rua Boa Vista, 15', 'Próximo à praça', '03000-003');

-- C. INSERÇÃO NA TABELA 'entregadores'
INSERT INTO `entregadores` (`nome`, `cpf`, `telefone`, `cnh`, `data_contratacao`, `ativo`) VALUES
('Roberto Oliveira', '12345678901', '11911112222', '123456789012', '2023-01-15', 1),
('Juliana Costa', '98765432109', '11933334444', NULL, '2024-05-20', 1),
('Fernando Almeida', '55544433322', '11955556666', '999888777666', '2022-11-01', 0);

-- D. INSERÇÃO NA TABELA 'pedidos' (Tabela Pai)
INSERT INTO `pedidos` (`id_cliente`, `id_entregador`, `data_hora`, `status`, `valor_total`, `tipo_pagamento`) VALUES
-- Pedido 1: Cliente João (ID 1), Entregador Roberto (ID 1)
(1, 1, '2025-10-15 19:00:00', 'Entregue', 94.90, 'Cartão'),
-- Pedido 2: Cliente Maria (ID 2), Sem Entregador (NULL)
(2, NULL, '2025-10-15 20:10:00', DEFAULT, 42.00, 'Dinheiro'),
-- Pedido 3: Cliente Pedro (ID 3), Entregador Juliana (ID 2)
(3, 2, '2025-10-15 20:30:00', 'Cancelado', 55.00, 'Pix');

-- E. INSERÇÃO NA TABELA 'itens_pedido' (Tabela Filha)
INSERT INTO `itens_pedido` (`id_pedido`, `id_pizza`, `tamanho`, `quantidade`, `preco_unitario`, `observacao`) VALUES
-- Pedido 1 (João da Silva)
(1, 3, 'G', 1, 55.00, NULL),     -- Quatro Queijos G (55.00)
(1, 2, 'M', 1, 39.90, 'Sem cebola'), -- Calabresa M (39.90)
-- Pedido 2 (Maria Souza)
(2, 3, 'M', 1, 42.00, 'Borda recheada'), -- Quatro Queijos M (42.00)
-- Pedido 3 (Pedro Santos)
(3, 1, 'P', 2, 25.00, NULL); -- Duas Margheritas P (2 x 25.00 = 50.00)