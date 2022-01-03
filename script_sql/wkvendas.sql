-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Tempo de geração: 02-Jan-2022 às 02:48
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `wkvendas`
--
CREATE DATABASE IF NOT EXISTS `wkvendas` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `wkvendas`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Cidade` varchar(100) NOT NULL,
  `Uf` varchar(2) NOT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `idxNomeCliente` (`Nome`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='Tabela de Clientes';

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`Codigo`, `Nome`, `Cidade`, `Uf`) VALUES
(1, 'MARIANA DE FREITAS', 'UBERABA', 'MG'),
(2, 'PEDRO DE SOUZA', 'UBERLANDIA', 'MG'),
(3, 'JESUS DOS SANTOS', 'UBERABA', 'MG'),
(4, 'DAVI PEREIRA', 'SÃO PAULO', 'SP'),
(5, 'EULA MIRIAM PEREIRA', 'UBERABA', 'MG'),
(6, 'SILVIA PEREIRA', 'SÃO PAULO', 'SP'),
(7, 'LUCAS BILHARINHO', 'UBERABA', 'MG'),
(8, 'VANESSA GUERRA', 'UBERABA', 'MG'),
(9, 'LUIZ DA SILVA', 'ARAXÁ', 'MG'),
(10, 'PRISCILA ALBUQUERQUE BURITI', 'SÃO PAULO', 'SP'),
(11, 'MARCOS PINTO', 'SÃO PAULO', 'SP'),
(12, 'PEDRO ALVES CABRAL', 'RECIFE', 'PE'),
(13, 'ANDREA AGNES DA SILVA', 'RECIFE', 'PE'),
(14, 'LUISA AGNES PEREIRA', 'RECIFE', 'PE'),
(15, 'JOAQUIM MORAIS', 'BRASILIA', 'DF'),
(16, 'ANDRE MENDONÇA', 'BRASÍLIA', 'DF'),
(17, 'ANA MARIA ', 'UBERABA', 'MG'),
(18, 'MARIA DE FREITAS LOBATO', 'UBERABA', 'MG'),
(19, 'HUMBERTO FLORIANO', 'UBERABA', 'MG'),
(20, 'GUSTAVO SOUZA', 'UBERLANDIA', 'MG'),
(21, 'MÔNICA DA SILVEIRA', 'SÃO PAULO', 'SP'),
(22, 'MONTEIRO LOBATO', 'UBERABA', 'MG');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `Numero` int(11) NOT NULL AUTO_INCREMENT,
  `Emissao` date NOT NULL,
  `Cliente` int(11) NOT NULL,
  `ValorTotal` decimal(18,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Numero`),
  KEY `idx_emissao` (`Emissao`),
  KEY `fk_cliente` (`Cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela pedidos dados gerais';

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidosprodutos`
--

DROP TABLE IF EXISTS `pedidosprodutos`;
CREATE TABLE IF NOT EXISTS `pedidosprodutos` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `NumeroPedido` int(11) NOT NULL,
  `Produto` int(11) NOT NULL,
  `Quantidade` int(11) NOT NULL,
  `ValorUnitario` decimal(18,2) NOT NULL DEFAULT '0.00',
  `ValorTotal` decimal(18,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Id`),
  KEY `idx_pedido` (`NumeroPedido`),
  KEY `idx_produto` (`Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tabela Pedidos Produto';

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `Codigo` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(100) NOT NULL,
  `PrecoVenda` decimal(18,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='Tabela de Produtos';

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`Codigo`, `Descricao`, `PrecoVenda`) VALUES
(1, 'ÓLEO DE CANELA', '8.00'),
(2, 'FARINHA DE MANDIOCA', '4.50'),
(3, 'MILHO', '10.00'),
(4, 'MANTEIGA COM SAL', '5.00'),
(5, 'GUARANÁ GOLÉ', '3.50'),
(6, 'COCA-COLA 2 LITROS', '6.00'),
(7, 'ARROZ CASA GRANDE', '18.00'),
(8, 'FEIJÃO PADRE JOÃO', '12.00'),
(9, 'SAL', '4.00'),
(10, 'CAFÉ', '7.00'),
(11, 'BANANA KG', '5.00'),
(12, 'TOMATE', '7.00'),
(13, 'YOGURTE', '3.80'),
(14, 'AZEITE', '8.80'),
(15, 'LEITE', '5.00'),
(16, 'MACARRÃO', '4.00'),
(17, 'MAIONESE', '9.00'),
(18, 'TEMPERO PRONTO', '2.50'),
(19, 'FAROFA', '10.00'),
(20, 'CHÁ', '6.00'),
(21, 'CARNE TEMPERADA FRANGO 1KG', '30.00'),
(22, 'CARNE SUINA 1KG', '40.00'),
(23, 'CARNE MOÍDA 1KG', '49.00'),
(24, 'CHICLETE 10 UN', '7.00'),
(25, 'BOLACHA MABEL', '7.00'),
(26, 'SARDINHA EM LATA', '4.50');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_cliente` FOREIGN KEY (`Cliente`) REFERENCES `clientes` (`Codigo`);

--
-- Limitadores para a tabela `pedidosprodutos`
--
ALTER TABLE `pedidosprodutos`
  ADD CONSTRAINT `fk_pedido` FOREIGN KEY (`NumeroPedido`) REFERENCES `pedidos` (`Numero`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
