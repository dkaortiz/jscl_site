-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql310.infinityfree.com
-- Tempo de geração: 30/01/2026 às 11:10
-- Versão do servidor: 11.4.9-MariaDB
-- Versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `if0_40940045_jscl`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acoes_sociais`
--

CREATE TABLE `acoes_sociais` (
  `id_acao` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` longtext NOT NULL,
  `responsavel` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `dia_semana` varchar(20) DEFAULT NULL,
  `horario` varchar(10) DEFAULT NULL,
  `local_realizacao` varchar(200) DEFAULT NULL,
  `icone` varchar(100) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `criado_por` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avisos`
--

CREATE TABLE `avisos` (
  `id_aviso` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `conteudo` text NOT NULL,
  `imagem` varchar(500) DEFAULT NULL,
  `unidade_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `data_criacao` datetime DEFAULT current_timestamp(),
  `data_atualizacao` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ativo` int(11) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `avisos`
--

INSERT INTO `avisos` (`id_aviso`, `titulo`, `conteudo`, `imagem`, `unidade_id`, `usuario_id`, `data_criacao`, `data_atualizacao`, `ativo`) VALUES
(1, 'Campanha', 'Venha participar campanha 12 segunda feiras', 'uploads/avisos/aviso_1769275065_6974feb980370.png', NULL, 2, '2026-01-24 09:17:45', '2026-01-24 09:17:45', 1),
(2, 'Aniversario da Igreja', 'Fique atento e nao falte!!!', NULL, NULL, 2, '2026-01-28 17:15:59', '2026-01-28 17:15:59', 1),
(3, 'Aniversario da Igreja', 'Fique atento e nao falte!!!', NULL, NULL, 2, '2026-01-28 17:16:06', '2026-01-28 17:16:06', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `avisos_leitura`
--

CREATE TABLE `avisos_leitura` (
  `id` int(11) NOT NULL,
  `aviso_id` int(11) NOT NULL,
  `membro_id` int(11) NOT NULL,
  `data_leitura` datetime DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avisos_unidades`
--

CREATE TABLE `avisos_unidades` (
  `id` int(11) NOT NULL,
  `aviso_id` int(11) NOT NULL,
  `unidade_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `avisos_unidades`
--

INSERT INTO `avisos_unidades` (`id`, `aviso_id`, `unidade_id`) VALUES
(3, 1, 1),
(2, 1, 6),
(4, 2, 1),
(5, 3, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `membros`
--

CREATE TABLE `membros` (
  `id_membro` int(11) NOT NULL,
  `nome_completo` varchar(150) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `endereco` text DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `genero` enum('Masculino','Feminino','Outro') DEFAULT NULL,
  `funcao` varchar(150) DEFAULT NULL,
  `whatsapp` varchar(20) DEFAULT NULL,
  `unidade_id` int(11) NOT NULL,
  `data_reconciliacao` date DEFAULT NULL,
  `data_batismo` date DEFAULT NULL,
  `igreja_anterior` varchar(150) DEFAULT NULL,
  `cargo_eclesiastico` varchar(100) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `status` enum('ativo','pendente','inativo') DEFAULT 'ativo',
  `data_aprovacao` datetime DEFAULT NULL,
  `data_desativacao` datetime DEFAULT NULL,
  `aprovado_por` int(11) DEFAULT NULL,
  `data_cadastro` timestamp NULL DEFAULT current_timestamp(),
  `cadastrado_por` int(11) DEFAULT NULL,
  `ultima_reativacao_solicitada` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `membros`
--

INSERT INTO `membros` (`id_membro`, `nome_completo`, `telefone`, `email`, `cpf`, `endereco`, `data_nascimento`, `genero`, `funcao`, `whatsapp`, `unidade_id`, `data_reconciliacao`, `data_batismo`, `igreja_anterior`, `cargo_eclesiastico`, `observacoes`, `status`, `data_aprovacao`, `data_desativacao`, `aprovado_por`, `data_cadastro`, `cadastrado_por`, `ultima_reativacao_solicitada`) VALUES
(8, 'David Kelvin Adonis Ortiz', '11999999', 'dkaortiz@gmail.com', '1231232211', 'Rua Doutor Francisco Soares Marialva 2399', '1992-04-22', 'Masculino', '', '11977446315', 6, NULL, '2000-10-10', NULL, 'diacono', '', 'ativo', NULL, '2026-01-24 20:13:16', NULL, '2026-01-22 19:18:03', NULL, NULL),
(9, 'MIDIA SOUSA FREITAS', '11973337782', '28.midia.sousa@gmail.com', '43364251835', 'Dr Francisco Soares Marialva, 2399', '1994-03-28', 'Feminino', '', '11973337782', 1, NULL, NULL, NULL, 'missionario', '', 'ativo', NULL, NULL, NULL, '2026-01-29 01:08:02', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `ministerios`
--

CREATE TABLE `ministerios` (
  `id_ministerio` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` longtext NOT NULL,
  `responsavel` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `icone` varchar(100) DEFAULT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp(),
  `data_atualizacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `criado_por` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `ministerios`
--

INSERT INTO `ministerios` (`id_ministerio`, `nome`, `descricao`, `responsavel`, `email`, `telefone`, `icone`, `data_criacao`, `data_atualizacao`, `criado_por`) VALUES
(3, 'Grupo de Louvor', 'Grupo de louvor', 'Miss Camila', '', '', 'fas fa-music', '2026-01-29 01:13:07', '2026-01-29 01:13:07', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `pedidos_oracao`
--

CREATE TABLE `pedidos_oracao` (
  `id_pedido` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `nome_completo` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tipo_oracao` varchar(50) DEFAULT NULL,
  `titulo` varchar(200) DEFAULT NULL,
  `descricao` text NOT NULL,
  `eh_membro` tinyint(1) DEFAULT 0,
  `unidade_id` int(11) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pendente',
  `respondido` tinyint(1) DEFAULT 0,
  `data_criacao` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `pedidos_oracao`
--

INSERT INTO `pedidos_oracao` (`id_pedido`, `usuario_id`, `nome_completo`, `telefone`, `email`, `tipo_oracao`, `titulo`, `descricao`, `eh_membro`, `unidade_id`, `status`, `respondido`, `data_criacao`) VALUES
(1, NULL, 'Midia S Freitas', '11973337782', '28.midia.sousa@gmail.com', 'libertacao', NULL, 'aweraweaw', 0, NULL, 'pendente', 1, '2026-01-20 15:41:39'),
(2, NULL, 'DAVID KELVIN ADONIS ORTIZ', '11956649583', 'david.ortiz@csitech.com.br', 'libertacao', NULL, '0', 1, 1, 'pendente', 1, '2026-01-21 13:02:40'),
(3, NULL, 'David Kelvin Adonis Ortiz', '11977446315', 'dkaortiz@gmail.com', 'libertacao', NULL, '0', 0, NULL, 'pendente', 1, '2026-01-22 01:42:47');

-- --------------------------------------------------------

--
-- Estrutura para tabela `solicitacoes_reativacao`
--

CREATE TABLE `solicitacoes_reativacao` (
  `id` int(11) NOT NULL,
  `membro_id` int(11) NOT NULL,
  `data_solicitacao` timestamp NULL DEFAULT current_timestamp(),
  `ultima_solicitacao` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `contador_tentativas` int(11) DEFAULT 1,
  `status` enum('pendente','aprovado','rejeitado') DEFAULT 'pendente',
  `observacoes` text DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `unidades`
--

CREATE TABLE `unidades` (
  `id_unidade` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` enum('Sede','Unidade') NOT NULL,
  `endereco` varchar(255) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `dias_cultos` longtext DEFAULT NULL,
  `pastores_locais` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL
) ;

--
-- Despejando dados para a tabela `unidades`
--

INSERT INTO `unidades` (`id_unidade`, `nome`, `tipo`, `endereco`, `telefone`, `dias_cultos`, `pastores_locais`, `data_criacao`) VALUES
(1, 'Sede', 'Sede', 'Rua Dr Francisco soares Marialva', '11977111111', '[{\"dia\":\"Segunda\",\"horario\":\"18:00\"},{\"dia\":\"Quarta\",\"horario\":\"18:00\"},{\"dia\":\"Domingo\",\"horario\":\"18:00\"}]', '[\"Ap Monica\"]', '2026-01-19 18:39:31'),
(6, 'St Angelo', 'Unidade', 'Rua santo angelo', '11999999', '[{\"dia\":\"Terça\",\"horario\":\"19:00\"},{\"dia\":\"Quinta\",\"horario\":\"19:00\"},{\"dia\":\"Domingo\",\"horario\":\"18:00\"}]', '[\"Pr Marcelo\",\"Pr(a) Erika\"]', '2026-01-22 15:12:55'),
(7, 'Rio de Janeiro', 'Unidade', 'Rua Gen. Guajao 12 - Centro - Duque de Caxias', '', '[{\"dia\":\"Terça\",\"horario\":\"19:00\"},{\"dia\":\"Quinta\",\"horario\":\"19:00\"},{\"dia\":\"Sábado\",\"horario\":\"19:00\"}]', '[\"Ap Monica\"]', '2026-01-29 01:10:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nome_completo` varchar(150) NOT NULL,
  `unidade` varchar(50) NOT NULL,
  `data_criacao` timestamp NULL DEFAULT current_timestamp(),
  `ativo` tinyint(1) DEFAULT 1
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `email`, `senha`, `nome_completo`, `unidade`, `data_criacao`, `ativo`) VALUES
(1, 'david.ortiz@csitech.com.br', '$2y$10$C7k.QxE8Y9l3Zh0T5m8Z1OsN4xP2uV6wQ8rJ5kL9mN3aN2bK1dL7C', 'Administrador', 'Sede', '2026-01-19 18:39:31', 1),
(2, 'dkaortiz@gmail.com', '$2y$10$mL1GniWBsGW0i6BsvK9a3Oadad4x3GfDaY91tZaJ0HHamXGkttMNa', 'David Ortiz', 'St Angelo', '2026-01-19 19:36:38', 1);

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `acoes_sociais`
--
ALTER TABLE `acoes_sociais`
  ADD PRIMARY KEY (`id_acao`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `criado_por` (`criado_por`);

--
-- Índices de tabela `avisos`
--
ALTER TABLE `avisos`
  ADD PRIMARY KEY (`id_aviso`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `idx_unidade` (`unidade_id`),
  ADD KEY `idx_data` (`data_criacao`);

--
-- Índices de tabela `avisos_leitura`
--
ALTER TABLE `avisos_leitura`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_aviso_membro` (`aviso_id`,`membro_id`),
  ADD KEY `idx_membro` (`membro_id`);

--
-- Índices de tabela `avisos_unidades`
--
ALTER TABLE `avisos_unidades`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_aviso_unidade` (`aviso_id`,`unidade_id`),
  ADD KEY `idx_unidade` (`unidade_id`);

--
-- Índices de tabela `membros`
--
ALTER TABLE `membros`
  ADD PRIMARY KEY (`id_membro`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD KEY `unidade_id` (`unidade_id`),
  ADD KEY `cadastrado_por` (`cadastrado_por`);

--
-- Índices de tabela `ministerios`
--
ALTER TABLE `ministerios`
  ADD PRIMARY KEY (`id_ministerio`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD KEY `criado_por` (`criado_por`);

--
-- Índices de tabela `pedidos_oracao`
--
ALTER TABLE `pedidos_oracao`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `idx_usuario` (`usuario_id`),
  ADD KEY `idx_eh_membro` (`eh_membro`),
  ADD KEY `idx_status` (`status`),
  ADD KEY `idx_data` (`data_criacao`),
  ADD KEY `idx_respondido` (`respondido`),
  ADD KEY `idx_unidade` (`unidade_id`);

--
-- Índices de tabela `solicitacoes_reativacao`
--
ALTER TABLE `solicitacoes_reativacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_membro` (`membro_id`),
  ADD KEY `idx_data` (`data_solicitacao`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `acoes_sociais`
--
ALTER TABLE `acoes_sociais`
  MODIFY `id_acao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `avisos`
--
ALTER TABLE `avisos`
  MODIFY `id_aviso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `avisos_leitura`
--
ALTER TABLE `avisos_leitura`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avisos_unidades`
--
ALTER TABLE `avisos_unidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `membros`
--
ALTER TABLE `membros`
  MODIFY `id_membro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `ministerios`
--
ALTER TABLE `ministerios`
  MODIFY `id_ministerio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `pedidos_oracao`
--
ALTER TABLE `pedidos_oracao`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `solicitacoes_reativacao`
--
ALTER TABLE `solicitacoes_reativacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `unidades`
--
ALTER TABLE `unidades`
  MODIFY `id_unidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
