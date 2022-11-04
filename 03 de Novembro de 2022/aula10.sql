-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 30-Out-2022 às 13:26
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aula10`
--
CREATE DATABASE IF NOT EXISTS `aula10` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aula10`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento`
--

CREATE TABLE `agendamento` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_funcionario` int(11) NOT NULL,
  `data` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `agendamento`
--

INSERT INTO `agendamento` (`id`, `id_cliente`, `id_funcionario`, `data`, `hora`) VALUES
(1, 1, 2, '2022-08-08', '09:45:00'),
(2, 2, 1, '2022-08-09', '10:15:00'),
(3, 3, 3, '2022-09-13', '16:00:00'),
(4, 2, 2, '2022-10-01', '11:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento_servico`
--

CREATE TABLE `agendamento_servico` (
  `id` int(11) NOT NULL,
  `id_agendamento` int(11) NOT NULL,
  `id_servico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `agendamento_servico`
--

INSERT INTO `agendamento_servico` (`id`, `id_agendamento`, `id_servico`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 3),
(4, 2, 2),
(5, 2, 1),
(6, 3, 1),
(7, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`id`, `nome`, `cpf`, `telefone`) VALUES
(1, 'Paula Mascarenhas', '45658978923', '44989721425'),
(2, 'Fernando Pessoa', '36521145369', '44987224452'),
(3, 'Ezequiel Pedroso', '96325412355', '44997256325');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `data_entrada` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`id`, `nome`, `telefone`, `data_entrada`) VALUES
(1, 'Sandra Carvalho', '44989728871', '2022-09-03'),
(2, 'Fernanda Pádua', '44987456363', '2022-01-10'),
(3, 'Geovani Almeida', '44981412000', '2021-07-23');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

CREATE TABLE `servico` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `custo` float NOT NULL,
  `tempo_estimado` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `servico`
--

INSERT INTO `servico` (`id`, `nome`, `custo`, `tempo_estimado`) VALUES
(1, 'Corte de cabelo masculino', 35, '00:15:00'),
(2, 'Pintura de unhas das mãos', 40, '00:30:00'),
(3, 'Maquiagem', 100.5, '01:00:00');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_cliente`),
  ADD KEY `fk2` (`id_funcionario`);

--
-- Índices para tabela `agendamento_servico`
--
ALTER TABLE `agendamento_servico`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk3` (`id_agendamento`),
  ADD KEY `fk4` (`id_servico`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `servico`
--
ALTER TABLE `servico`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agendamento`
--
ALTER TABLE `agendamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `agendamento_servico`
--
ALTER TABLE `agendamento_servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `servico`
--
ALTER TABLE `servico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`),
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_funcionario`) REFERENCES `funcionario` (`id`);

--
-- Limitadores para a tabela `agendamento_servico`
--
ALTER TABLE `agendamento_servico`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_agendamento`) REFERENCES `agendamento` (`id`),
  ADD CONSTRAINT `fk4` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
