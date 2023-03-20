-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Mar-2021 às 01:33
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dados`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `CODIGO` int(11) NOT NULL,
  `NOME` varchar(200) NOT NULL,
  `CIDADE` varchar(150) NOT NULL,
  `UF` varchar(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`CODIGO`, `NOME`, `CIDADE`, `UF`) VALUES
(1, 'joao', 'Maceio', 'AL'),
(2, 'lucas', 'Recife', 'PE'),
(3, 'joaquim', 'Recife', 'PE'),
(4, 'Luis', 'Caruaru', 'PE'),
(5, 'Jose Maria', 'Recife', 'PE'),
(6, 'Antonio', 'Arapiraca', 'AL'),
(7, 'Cris', 'Sao Paulo', 'SP'),
(8, 'Maria', 'Sao Paulo', 'SP'),
(9, 'LAURA', 'Sao Paulo', 'SP'),
(10, 'Clara', 'Sao Paulo', 'SP'),
(11, 'Alvaro', 'Sao Paulo', 'SP'),
(12, 'Francisco', 'Sao Paulo', 'SP'),
(13, 'Alex', 'Sao Paulo', 'SP'),
(14, 'Marcio', 'Sao Paulo', 'SP'),
(15, 'Maria', 'Sao Paulo', 'SP'),
(16, 'Joana', 'Sao Paulo', 'SP'),
(17, 'Vini', 'Sao Paulo', 'SP'),
(18, 'Vivi', 'Sao Paulo', 'SP'),
(19, 'Viviane', 'Sao Paulo', 'SP'),
(20, 'Tais', 'Sao Paulo', 'SP');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `Codigo` int(11) NOT NULL,
  `Descricao` varchar(250) NOT NULL,
  `PrecoVenda` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`Codigo`, `Descricao`, `PrecoVenda`) VALUES
(1, 'Arroz', 1.2),
(2, 'Feijão', 1.5),
(3, 'Macarrao', 1.5),
(4, 'farinha', 2),
(5, 'acucar', 2),
(6, 'Leite', 3),
(7, 'Cafe', 3),
(8, 'boi', 30),
(9, 'galinha', 12),
(10, 'Peixe', 12),
(11, 'porco', 10),
(12, 'coca', 6),
(13, 'Fanta', 5),
(14, 'livro', 12),
(15, 'agua', 12),
(16, 'sal', 12),
(17, 'cuzcuz', 2),
(18, 'tv', 100),
(19, 'celular', 200),
(20, 'arooz 5kg', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidoVenda`
--

CREATE TABLE `pedidoVenda` (
  `NumeroPedido` int(11) NOT NULL,
  `DataEmissao` date NOT NULL,
  `fkCLiente` int(11) NOT NULL,
  `ValorTotal` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidoVenda`
--

INSERT INTO `pedidoVenda` (`NumeroPedido`, `DataEmissao`, `fkCLiente`, `ValorTotal`) VALUES
(1, '2021-03-12', 1, 13),
(3, '2021-03-12', 2, 4),
(4, '2021-03-12', 4, 10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidoitvenda`
--

CREATE TABLE `pedidoitvenda` (
  `NumItVenda` int(11) NOT NULL,
  `NumeroPedido` int(11) NOT NULL,
  `fkproduto` int(11) NOT NULL,
  `Quantidade` double NOT NULL,
  `VLUnitario` double NOT NULL,
  `VLTotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidoitvenda`
--

INSERT INTO `pedidoitvenda` (`NumItVenda`, `NumeroPedido`, `fkproduto`, `Quantidade`, `VLUnitario`, `VLTotal`) VALUES
(3, 3, 2, 2, 2, 4),
(5, 4, 5, 5, 2, 10);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`CODIGO`),
  ADD KEY `INDEX_CLIENTE_UF` (`UF`) USING BTREE;

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`Codigo`);

--
-- Índices para tabela `pedidoVenda`
--
ALTER TABLE `pedidoVenda`
  ADD PRIMARY KEY (`NumeroPedido`),
  ADD KEY `INDEX_DATAEMISSAO_pedidoVenda` (`DataEmissao`) USING BTREE,
  ADD KEY `INDEX_fkCLiente_pedidoVenda` (`fkCLiente`) USING BTREE;

--
-- Índices para tabela `pedidoitvenda`
--
ALTER TABLE `pedidoitvenda`
  ADD PRIMARY KEY (`NumItVenda`),
  ADD KEY `INDEX_pedidoitvenda_fkproduto` (`fkproduto`) USING BTREE,
  ADD KEY `INDEX_pedidoitvenda_NUMEROPEDIDO` (`NumeroPedido`) USING BTREE;

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `pedidoitvenda`
--
ALTER TABLE `pedidoitvenda`
  MODIFY `NumItVenda` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pedidoVenda`
--
ALTER TABLE `pedidoVenda`
  ADD CONSTRAINT `FK_pedidoVenda` FOREIGN KEY (`fkCLiente`) REFERENCES `cliente` (`CODIGO`);

--
-- Limitadores para a tabela `pedidoitvenda`
--
ALTER TABLE `pedidoitvenda`
  ADD CONSTRAINT `FK_PedidoProduto` FOREIGN KEY (`fkproduto`) REFERENCES `produto` (`Codigo`),
  ADD CONSTRAINT `FK_PedidoProdutoPedido` FOREIGN KEY (`NumeroPedido`) REFERENCES `pedidoVenda` (`NumeroPedido`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;