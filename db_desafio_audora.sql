-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 07-Dez-2017 às 18:48
-- Versão do servidor: 10.1.25-MariaDB
-- PHP Version: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_desafio_audora`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_categoria_log`
--

CREATE TABLE `tb_categoria_log` (
  `id_categoria_log` int(11) NOT NULL,
  `nome_categoria_log` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_categoria_log`
--

INSERT INTO `tb_categoria_log` (`id_categoria_log`, `nome_categoria_log`) VALUES
(1, 'erro'),
(2, 'permissão'),
(3, 'autenticação');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente`
--

CREATE TABLE `tb_cliente` (
  `id_cliente` int(11) NOT NULL,
  `nome_cliente` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_cliente`
--

INSERT INTO `tb_cliente` (`id_cliente`, `nome_cliente`) VALUES
(1, 'Acre'),
(2, 'Alagoas'),
(4, 'Amapá'),
(3, 'Amazonas'),
(5, 'Bahia'),
(6, 'Ceará'),
(7, 'Distrito Federal'),
(8, 'Espírito Santo'),
(9, 'Goiás'),
(10, 'Maranhão'),
(13, 'Mato Grosso'),
(12, 'Mato Grosso do Sul'),
(11, 'Minas Gerais'),
(14, 'Pará'),
(15, 'Paraíba'),
(18, 'Paraná'),
(16, 'Pernambuco'),
(17, 'Piauí'),
(19, 'Rio de Janeiro'),
(20, 'Rio Grande do Norte'),
(23, 'Rio Grande do Sul'),
(21, 'Rondônia'),
(22, 'Roraima'),
(24, 'Santa Catarina'),
(26, 'São Paulo'),
(25, 'Sergipe'),
(27, 'Tocantins');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_cliente_produto`
--

CREATE TABLE `tb_cliente_produto` (
  `id_cliente_produto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_cliente_produto`
--

INSERT INTO `tb_cliente_produto` (`id_cliente_produto`, `id_cliente`, `id_produto`) VALUES
(1, 1, 2),
(2, 2, 2),
(3, 3, 2),
(4, 4, 1),
(5, 5, 2),
(6, 6, 1),
(7, 7, 2),
(8, 8, 2),
(9, 9, 2),
(10, 10, 1),
(11, 11, 2),
(12, 12, 1),
(13, 13, 1),
(14, 14, 2),
(15, 15, 2),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 2),
(20, 20, 2),
(21, 21, 1),
(22, 22, 1),
(23, 23, 2),
(24, 24, 1),
(25, 25, 1),
(26, 26, 2),
(27, 27, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_login`
--

CREATE TABLE `tb_login` (
  `id_login` int(11) NOT NULL,
  `id_cliente_produto` int(11) NOT NULL,
  `usuario` varchar(20) DEFAULT NULL,
  `senha` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_login`
--

INSERT INTO `tb_login` (`id_login`, `id_cliente_produto`, `usuario`, `senha`) VALUES
(1, 1, 'alagoas.maceio', '147541'),
(2, 2, 'maceio.serraria', '111222333');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_produto`
--

CREATE TABLE `tb_produto` (
  `id_produto` int(11) NOT NULL,
  `nome_produto` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_produto`
--

INSERT INTO `tb_produto` (`id_produto`, `nome_produto`) VALUES
(1, 'Defensoria'),
(2, 'OAB');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_registro_log`
--

CREATE TABLE `tb_registro_log` (
  `id_registro_log` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `datahora_registro_log` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `tb_registro_log`
--

INSERT INTO `tb_registro_log` (`id_registro_log`, `id_produto`, `id_cliente`, `id_categoria`, `datahora_registro_log`) VALUES
(1, 1, 4, 1, '2015-01-01 08:00:00'),
(2, 1, 27, 3, '2016-01-01 08:00:00'),
(3, 1, 25, 3, '2017-01-01 08:00:00'),
(4, 1, 20, 2, '2015-02-01 08:00:00'),
(5, 1, 15, 1, '2015-03-01 08:00:00'),
(6, 1, 25, 2, '2015-04-01 08:00:00'),
(7, 2, 4, 1, '2015-05-01 08:00:00'),
(8, 2, 24, 1, '2015-06-01 08:00:00'),
(9, 1, 13, 1, '2015-07-01 08:00:00'),
(10, 1, 2, 1, '2015-08-01 08:00:00'),
(11, 1, 14, 1, '2015-09-01 08:00:00'),
(12, 2, 14, 2, '2015-10-01 08:00:00'),
(13, 1, 10, 2, '2015-11-01 08:00:00'),
(14, 2, 15, 1, '2015-12-01 08:00:00'),
(15, 2, 9, 2, '2016-01-01 08:00:00'),
(16, 2, 12, 3, '2016-02-01 08:00:00'),
(17, 1, 12, 1, '2016-03-01 08:00:00'),
(18, 2, 2, 3, '2016-04-01 08:00:00'),
(19, 2, 2, 1, '2016-05-01 08:00:00'),
(20, 2, 27, 2, '2016-06-01 08:00:00'),
(21, 2, 13, 1, '2016-07-01 08:00:00'),
(22, 1, 15, 2, '2016-08-01 08:00:00'),
(23, 2, 14, 2, '2016-09-01 08:00:00'),
(24, 2, 19, 2, '2016-10-01 08:00:00'),
(25, 1, 8, 2, '2016-11-01 08:00:00'),
(26, 2, 14, 1, '2016-12-01 08:00:00'),
(27, 2, 4, 1, '2017-02-01 08:00:00'),
(28, 2, 27, 1, '2017-03-01 08:00:00'),
(29, 2, 8, 1, '2017-04-01 08:00:00'),
(30, 2, 22, 3, '2017-05-01 08:00:00'),
(31, 1, 21, 2, '2017-06-01 08:00:00'),
(32, 1, 11, 2, '2017-07-01 08:00:00'),
(33, 1, 4, 2, '2017-08-01 08:00:00'),
(34, 2, 23, 3, '2017-09-01 08:00:00'),
(35, 1, 17, 3, '2017-10-01 08:00:00'),
(36, 2, 16, 2, '2017-11-01 08:00:00'),
(37, 1, 18, 2, '2017-12-01 08:00:00'),
(38, 1, 8, 3, '2015-01-01 08:00:00'),
(39, 1, 15, 2, '2015-01-02 08:00:00'),
(40, 1, 9, 2, '2015-01-03 08:00:00'),
(41, 2, 14, 2, '2015-01-04 08:00:00'),
(42, 2, 10, 1, '2015-01-05 08:00:00'),
(43, 2, 6, 3, '2015-01-06 08:00:00'),
(44, 1, 7, 1, '2015-01-07 08:00:00'),
(45, 2, 2, 2, '2015-01-08 08:00:00'),
(46, 2, 17, 3, '2015-01-09 08:00:00'),
(47, 1, 26, 1, '2015-01-10 08:00:00'),
(48, 2, 7, 1, '2015-01-11 08:00:00'),
(49, 2, 21, 3, '2015-01-12 08:00:00'),
(50, 1, 18, 3, '2015-01-13 08:00:00'),
(51, 2, 9, 2, '2015-01-14 08:00:00'),
(52, 2, 13, 2, '2015-01-15 08:00:00'),
(53, 2, 5, 2, '2015-01-16 08:00:00'),
(54, 1, 15, 1, '2015-01-17 08:00:00'),
(55, 2, 23, 2, '2015-01-18 08:00:00'),
(56, 1, 12, 1, '2015-01-19 08:00:00'),
(57, 2, 16, 2, '2015-01-20 08:00:00'),
(58, 1, 4, 3, '2015-01-21 08:00:00'),
(59, 2, 14, 3, '2015-01-22 08:00:00'),
(60, 2, 10, 1, '2015-01-23 08:00:00'),
(61, 2, 10, 2, '2015-01-24 08:00:00'),
(62, 1, 22, 1, '2015-01-25 08:00:00'),
(63, 2, 14, 1, '2015-01-26 08:00:00'),
(64, 1, 8, 2, '2015-01-27 08:00:00'),
(65, 1, 17, 3, '2015-01-28 08:00:00'),
(66, 1, 18, 2, '2015-01-29 08:00:00'),
(67, 1, 2, 1, '2015-01-30 08:00:00'),
(68, 1, 1, 3, '2015-01-31 08:00:00'),
(69, 2, 11, 1, '2015-01-01 08:00:00'),
(70, 1, 24, 2, '2015-01-02 08:00:00'),
(71, 2, 12, 2, '2015-01-03 08:00:00'),
(72, 2, 22, 3, '2015-01-04 08:00:00'),
(73, 1, 3, 1, '2015-01-05 08:00:00'),
(74, 1, 16, 1, '2015-01-06 08:00:00'),
(75, 1, 21, 2, '2015-01-07 08:00:00'),
(76, 1, 19, 2, '2015-01-08 08:00:00'),
(77, 1, 8, 1, '2015-01-09 08:00:00'),
(78, 2, 4, 2, '2015-01-10 08:00:00'),
(79, 2, 26, 1, '2015-01-11 08:00:00'),
(80, 1, 3, 1, '2015-01-12 08:00:00'),
(81, 2, 14, 3, '2015-01-13 08:00:00'),
(82, 1, 21, 3, '2015-01-14 08:00:00'),
(83, 1, 10, 2, '2015-01-15 08:00:00'),
(84, 2, 13, 3, '2015-01-16 08:00:00'),
(85, 1, 10, 3, '2015-01-17 08:00:00'),
(86, 2, 17, 3, '2015-01-18 08:00:00'),
(87, 2, 26, 1, '2017-10-19 08:00:00'),
(88, 1, 18, 2, '2015-05-20 08:00:00'),
(89, 2, 11, 3, '2017-08-21 08:00:00'),
(95, 1, 1, 1, '2017-12-07 10:00:00'),
(105, 1, 1, 1, '2017-12-07 10:00:00'),
(106, 1, 1, 1, '2017-12-07 10:00:00'),
(107, 1, 1, 1, '2017-12-07 10:00:00'),
(108, 1, 1, 1, '2017-12-07 10:00:00'),
(109, 1, 1, 1, '2017-12-07 10:00:00'),
(110, 1, 1, 1, '2017-12-07 10:00:00'),
(111, 1, 1, 1, '2017-12-07 10:00:00'),
(112, 1, 1, 1, '2017-12-07 10:00:00'),
(113, 1, 1, 1, '2017-12-07 10:00:00'),
(114, 1, 1, 1, '2017-12-07 10:00:00'),
(115, 1, 1, 1, '2017-12-07 10:00:00'),
(116, 1, 1, 1, '2017-12-07 10:00:00'),
(117, 1, 1, 1, '2017-12-07 10:00:00'),
(118, 1, 1, 1, '2017-12-07 10:00:00'),
(119, 1, 1, 1, '2017-12-06 10:00:00'),
(120, 1, 1, 3, '2017-12-07 15:08:04'),
(121, 2, 2, 3, '2017-12-07 15:10:00'),
(122, 1, 1, 3, '2017-12-07 18:22:54'),
(123, 1, 1, 3, '2017-12-07 18:26:18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_categoria_log`
--
ALTER TABLE `tb_categoria_log`
  ADD PRIMARY KEY (`id_categoria_log`);

--
-- Indexes for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `id_estado` (`nome_cliente`);

--
-- Indexes for table `tb_cliente_produto`
--
ALTER TABLE `tb_cliente_produto`
  ADD PRIMARY KEY (`id_cliente_produto`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Indexes for table `tb_login`
--
ALTER TABLE `tb_login`
  ADD PRIMARY KEY (`id_login`),
  ADD KEY `id_cliente_produto` (`id_cliente_produto`);

--
-- Indexes for table `tb_produto`
--
ALTER TABLE `tb_produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Indexes for table `tb_registro_log`
--
ALTER TABLE `tb_registro_log`
  ADD PRIMARY KEY (`id_registro_log`),
  ADD KEY `id_produto` (`id_produto`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_categoria_log`
--
ALTER TABLE `tb_categoria_log`
  MODIFY `id_categoria_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tb_cliente`
--
ALTER TABLE `tb_cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `tb_cliente_produto`
--
ALTER TABLE `tb_cliente_produto`
  MODIFY `id_cliente_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `tb_login`
--
ALTER TABLE `tb_login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_produto`
--
ALTER TABLE `tb_produto`
  MODIFY `id_produto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tb_registro_log`
--
ALTER TABLE `tb_registro_log`
  MODIFY `id_registro_log` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tb_cliente_produto`
--
ALTER TABLE `tb_cliente_produto`
  ADD CONSTRAINT `tb_cliente_produto_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  ADD CONSTRAINT `tb_cliente_produto_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id_produto`);

--
-- Limitadores para a tabela `tb_login`
--
ALTER TABLE `tb_login`
  ADD CONSTRAINT `tb_login_ibfk_1` FOREIGN KEY (`id_cliente_produto`) REFERENCES `tb_cliente_produto` (`id_cliente_produto`);

--
-- Limitadores para a tabela `tb_registro_log`
--
ALTER TABLE `tb_registro_log`
  ADD CONSTRAINT `tb_registro_log_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id_produto`),
  ADD CONSTRAINT `tb_registro_log_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `tb_cliente` (`id_cliente`),
  ADD CONSTRAINT `tb_registro_log_ibfk_3` FOREIGN KEY (`id_categoria`) REFERENCES `tb_categoria_log` (`id_categoria_log`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
