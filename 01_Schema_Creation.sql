clientes, CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `endereco` varchar(255) NOT NULL,
  `complemento` varchar(100) DEFAULT NULL,
  `cep` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3


entregadores, CREATE TABLE `entregadores` (
  `id_entregador` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cnh` varchar(20) DEFAULT NULL,
  `data_contratacao` date NOT NULL,
  `ativo` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_entregador`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3



itens_pedido, CREATE TABLE `itens_pedido` (
  `id_item` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int NOT NULL,
  `id_pizza` int NOT NULL,
  `tamanho` varchar(1) NOT NULL,
  `quantidade` int NOT NULL DEFAULT '1',
  `preco_unitario` decimal(10,2) NOT NULL,
  `observacao` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  KEY `fk_itens_pedido_pedidos_idx` (`id_pedido`),
  KEY `fk_itens_pedido_pizzas_idx` (`id_pizza`),
  CONSTRAINT `fk_itens_pedido_pedidos` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_itens_pedido_pizzas` FOREIGN KEY (`id_pizza`) REFERENCES `pizzas` (`id_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3


pedidos, CREATE TABLE `pedidos` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int NOT NULL,
  `data_hora` datetime NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Em Preparo',
  `valor_total` decimal(10,2) NOT NULL,
  `tipo_pagamento` varchar(50) DEFAULT NULL,
  `id_entregador` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedidos_clientes_idx` (`id_cliente`),
  KEY `fk_pedidos_entregadores_idx` (`id_entregador`),
  CONSTRAINT `fk_pedidos_clientes` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_pedidos_entregadores` FOREIGN KEY (`id_entregador`) REFERENCES `entregadores` (`id_entregador`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3


pizzas, CREATE TABLE `pizzas` (
  `id_pizza` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  `preco_p` decimal(10,2) NOT NULL,
  `preco_m` decimal(10,2) NOT NULL,
  `preco_g` decimal(10,2) NOT NULL,
  `disponivel` tinyint DEFAULT '1',
  PRIMARY KEY (`id_pizza`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3
