-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19/12/2025 às 12:52
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `mischool`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `bi` varchar(15) NOT NULL,
  `numero_processo` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_curso` int(11) DEFAULT NULL,
  `id_presenca` int(11) NOT NULL,
  `id_encarregado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno_avaliacao`
--

CREATE TABLE `aluno_avaliacao` (
  `id` int(11) NOT NULL,
  `id_aluno` int(11) NOT NULL,
  `id_avaliacao` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno_disciplina`
--

CREATE TABLE `aluno_disciplina` (
  `id_aluno` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `avaliacao`
--

CREATE TABLE `avaliacao` (
  `id` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL,
  `id_tipo_teste` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `classes`
--

CREATE TABLE `classes` (
  `id` int(11) NOT NULL,
  `numero` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `contacto_encarregado`
--

CREATE TABLE `contacto_encarregado` (
  `id` int(11) NOT NULL,
  `id_encarregado` int(11) NOT NULL,
  `telefone` int(11) NOT NULL,
  `telefone_secundario` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplinas`
--

CREATE TABLE `disciplinas` (
  `id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina_classe`
--

CREATE TABLE `disciplina_classe` (
  `id_classe` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `disciplina_curso`
--

CREATE TABLE `disciplina_curso` (
  `id_disciplina` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `encarregados`
--

CREATE TABLE `encarregados` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `notas`
--

CREATE TABLE `notas` (
  `id` int(11) NOT NULL,
  `nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `presencas`
--

CREATE TABLE `presencas` (
  `id` int(11) NOT NULL,
  `estado` enum('ausente','presente') DEFAULT 'ausente',
  `id_disciplina` int(11) NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professores`
--

CREATE TABLE `professores` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor_classe`
--

CREATE TABLE `professor_classe` (
  `id_professor` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor_curso`
--

CREATE TABLE `professor_curso` (
  `id_professor` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `professor_disciplina`
--

CREATE TABLE `professor_disciplina` (
  `id_professor` int(11) NOT NULL,
  `id_disciplina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tempos_aula`
--

CREATE TABLE `tempos_aula` (
  `id` int(11) NOT NULL,
  `tempo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tempos_disciplina`
--

CREATE TABLE `tempos_disciplina` (
  `id_disciplina` int(11) NOT NULL,
  `id_tempo_aula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_teste`
--

CREATE TABLE `tipo_teste` (
  `id` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL,
  `tipo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `tipo`) VALUES
(1, 'Professor'),
(2, 'Aluno'),
(3, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `id_tipo_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `id_tipo_usuario`) VALUES
(1, 'Benny KG0', 'benny@gmail.com', 'beneditogamboa', 2),
(2, 'Aomine Daiki', 'aomine@gmail.com', 'aominedaiki', 2),
(3, 'Aomine Daiki', 'aomine@gmail.com', 'aominedaiki', 2),
(4, 'Narcotics', 'narcos@gmail.com', 'narcoticos', 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_presenca` (`id_presenca`),
  ADD KEY `id_encarregado` (`id_encarregado`);

--
-- Índices de tabela `aluno_avaliacao`
--
ALTER TABLE `aluno_avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_aluno` (`id_aluno`),
  ADD KEY `id_avaliacao` (`id_avaliacao`);

--
-- Índices de tabela `aluno_disciplina`
--
ALTER TABLE `aluno_disciplina`
  ADD KEY `id_aluno` (`id_aluno`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_nota` (`id_nota`),
  ADD KEY `id_disciplina` (`id_disciplina`),
  ADD KEY `id_tipo_teste` (`id_tipo_teste`);

--
-- Índices de tabela `classes`
--
ALTER TABLE `classes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `contacto_encarregado`
--
ALTER TABLE `contacto_encarregado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_encarregado` (`id_encarregado`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `disciplina_classe`
--
ALTER TABLE `disciplina_classe`
  ADD KEY `id_classe` (`id_classe`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices de tabela `disciplina_curso`
--
ALTER TABLE `disciplina_curso`
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices de tabela `encarregados`
--
ALTER TABLE `encarregados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `presencas`
--
ALTER TABLE `presencas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices de tabela `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Índices de tabela `professor_classe`
--
ALTER TABLE `professor_classe`
  ADD KEY `id_professor` (`id_professor`),
  ADD KEY `id_classe` (`id_classe`);

--
-- Índices de tabela `professor_curso`
--
ALTER TABLE `professor_curso`
  ADD KEY `id_professor` (`id_professor`),
  ADD KEY `id_curso` (`id_curso`);

--
-- Índices de tabela `professor_disciplina`
--
ALTER TABLE `professor_disciplina`
  ADD KEY `id_professor` (`id_professor`),
  ADD KEY `id_disciplina` (`id_disciplina`);

--
-- Índices de tabela `tempos_aula`
--
ALTER TABLE `tempos_aula`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tempos_disciplina`
--
ALTER TABLE `tempos_disciplina`
  ADD KEY `id_disciplina` (`id_disciplina`),
  ADD KEY `id_tempo_aula` (`id_tempo_aula`);

--
-- Índices de tabela `tipo_teste`
--
ALTER TABLE `tipo_teste`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_usuario` (`id_tipo_usuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `aluno_avaliacao`
--
ALTER TABLE `aluno_avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `avaliacao`
--
ALTER TABLE `avaliacao`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `classes`
--
ALTER TABLE `classes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `contacto_encarregado`
--
ALTER TABLE `contacto_encarregado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `cursos`
--
ALTER TABLE `cursos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `disciplinas`
--
ALTER TABLE `disciplinas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `encarregados`
--
ALTER TABLE `encarregados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notas`
--
ALTER TABLE `notas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `presencas`
--
ALTER TABLE `presencas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `professores`
--
ALTER TABLE `professores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tempos_aula`
--
ALTER TABLE `tempos_aula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_teste`
--
ALTER TABLE `tipo_teste`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `alunos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `alunos_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `alunos_ibfk_3` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `alunos_ibfk_4` FOREIGN KEY (`id_presenca`) REFERENCES `presencas` (`id`),
  ADD CONSTRAINT `alunos_ibfk_5` FOREIGN KEY (`id_encarregado`) REFERENCES `encarregados` (`id`);

--
-- Restrições para tabelas `aluno_avaliacao`
--
ALTER TABLE `aluno_avaliacao`
  ADD CONSTRAINT `aluno_avaliacao_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id`),
  ADD CONSTRAINT `aluno_avaliacao_ibfk_2` FOREIGN KEY (`id_avaliacao`) REFERENCES `avaliacao` (`id`);

--
-- Restrições para tabelas `aluno_disciplina`
--
ALTER TABLE `aluno_disciplina`
  ADD CONSTRAINT `aluno_disciplina_ibfk_1` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id`),
  ADD CONSTRAINT `aluno_disciplina_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id`);

--
-- Restrições para tabelas `avaliacao`
--
ALTER TABLE `avaliacao`
  ADD CONSTRAINT `avaliacao_ibfk_1` FOREIGN KEY (`id_nota`) REFERENCES `notas` (`id`),
  ADD CONSTRAINT `avaliacao_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id`),
  ADD CONSTRAINT `avaliacao_ibfk_3` FOREIGN KEY (`id_tipo_teste`) REFERENCES `tipo_teste` (`id`);

--
-- Restrições para tabelas `contacto_encarregado`
--
ALTER TABLE `contacto_encarregado`
  ADD CONSTRAINT `contacto_encarregado_ibfk_1` FOREIGN KEY (`id_encarregado`) REFERENCES `encarregados` (`id`);

--
-- Restrições para tabelas `disciplina_classe`
--
ALTER TABLE `disciplina_classe`
  ADD CONSTRAINT `disciplina_classe_ibfk_1` FOREIGN KEY (`id_classe`) REFERENCES `classes` (`id`),
  ADD CONSTRAINT `disciplina_classe_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id`);

--
-- Restrições para tabelas `disciplina_curso`
--
ALTER TABLE `disciplina_curso`
  ADD CONSTRAINT `disciplina_curso_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `disciplina_curso_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id`);

--
-- Restrições para tabelas `presencas`
--
ALTER TABLE `presencas`
  ADD CONSTRAINT `presencas_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id`);

--
-- Restrições para tabelas `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `professores_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `professor_classe`
--
ALTER TABLE `professor_classe`
  ADD CONSTRAINT `professor_classe_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `professores` (`id`),
  ADD CONSTRAINT `professor_classe_ibfk_2` FOREIGN KEY (`id_classe`) REFERENCES `classes` (`id`);

--
-- Restrições para tabelas `professor_curso`
--
ALTER TABLE `professor_curso`
  ADD CONSTRAINT `professor_curso_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `professores` (`id`),
  ADD CONSTRAINT `professor_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `cursos` (`id`);

--
-- Restrições para tabelas `professor_disciplina`
--
ALTER TABLE `professor_disciplina`
  ADD CONSTRAINT `professor_disciplina_ibfk_1` FOREIGN KEY (`id_professor`) REFERENCES `professores` (`id`),
  ADD CONSTRAINT `professor_disciplina_ibfk_2` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id`);

--
-- Restrições para tabelas `tempos_disciplina`
--
ALTER TABLE `tempos_disciplina`
  ADD CONSTRAINT `tempos_disciplina_ibfk_1` FOREIGN KEY (`id_disciplina`) REFERENCES `disciplinas` (`id`),
  ADD CONSTRAINT `tempos_disciplina_ibfk_2` FOREIGN KEY (`id_tempo_aula`) REFERENCES `tempos_aula` (`id`);

--
-- Restrições para tabelas `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipo_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
