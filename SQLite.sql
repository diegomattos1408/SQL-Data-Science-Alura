-- 1 Criar Tabelas

CREATE TABLE tabela_alunos(
  ID_Aluno INT PRIMARY KEY, 
  Nome_Aluno VARCHAR (250),
  Data_Nascimento VARCHAR (250),
  Genero VARCHAR (250),
  Endereco VARCHAR (250),
  Telefone_Contato VARCHAR (250),
  Email VARCHAR (250)
)

CREATE TABLE tabela_professores(
  ID_Professor INT PRIMARY KEY, 
  Nome_Professor VARCHAR (250),
  Data_Nascimento VARCHAR (250),
  Genero VARCHAR (250),
  Telefone_Contato VARCHAR (250),
  Email VARCHAR (250)
)

CREATE TABLE tabela_disciplinas(
  ID_Disciplina INT PRIMARY KEY, 
  Nome_Disciplina VARCHAR (250),
  Descricao VARCHAR (250),
  Carga_Horaria DECIMAL(10, 2),
  ID_Professor INT,
  FOREIGN KEY (ID_Professor) REFERENCES tabela_professores (ID_Professor)
 )

 CREATE TABLE tabela_turmas(
   ID_Turma INT PRIMARY KEY,
   Nome_Turma VARCHAR (250),
   Ano_Letivo INT,
   ID_Professor_Orientador INT,
   FOREIGN KEY (ID_Professor_Orientador) REFERENCES tabela_professores (ID_Professor)
)

CREATE TABLE tabela_turmas_disciplinas(
  ID_Turma INT,
  ID_Disciplina INT,
  FOREIGN KEY (ID_Turma) REFERENCES tabela_turmas (ID_Turma),
  FOREIGN KEY (ID_Disciplina) REFERENCES tabela_disciplinas (ID_Disciplina)
)

CREATE TABLE tabela_turmas_alunos(
  ID_Turmas INT,
  ID_Alunos INT,
  FOREIGN KEY (ID_Turmas) REFERENCES tabela_turmas (ID_Turma),
  FOREIGN KEY (ID_Alunos) REFERENCES tabela_alunos (ID_Aluno)
)

CREATE TABLE tabela_notas(
  ID_Nota INT PRIMARY key, 
  ID_Aluno INT, 
  ID_Disciplina INT, 
  Valor_Nota DECIMAL(10,2),
  Data_Avaliaçao VARCHAR(250),
  FOREIGN KEY (ID_Aluno) REFERENCES tabela_alunos (ID_Aluno),
  FOREIGN KEY (ID_Disciplina) REFERENCES tabela_disciplinas (ID_Disciplina)
)

-- 2 Inserindo Dados

INSERT INTO tabela_alunos (ID_Aluno, Nome_Aluno, Data_Nascimento, Genero, Endereco, Telefone_Contato, Email)
VALUES
(1, 'João Silva', '2005-03-15', 'Masculino', 'Rua das Flores, 123', '(11) 9876-5432', 'joao@email.com'),
(2, 'Maria Santos', '2006-06-20', 'Feminino', 'Avenida Principal, 456', '(11) 8765-4321', 'maria@email.com'),
(3, 'Pedro Soares', '2004-01-10', 'Masculino', 'Rua Central, 789', '(11) 7654-3210', 'pedro@email.com'),
(4, 'Ana Lima', '2005-04-02', 'Feminino', 'Rua da Escola, 56', '(11) 8765-4321', 'ana@email.com'),
(5, 'Mariana Fernandes', '2005-08-12', 'Feminino', 'Avenida da Paz, 789', '(11) 5678-1234', 'mariana@email.com');

INSERT INTO tabela_professores (ID_Professor, Nome_Professor, Data_Nascimento, Genero, Telefone_Contato, Email)
VALUES
(1, 'Ana Oliveira', '1980-05-25', 'Feminino', '(11) 1234-5678', 'ana@email.com'),
(2, 'Carlos Ferreira', '1975-09-12', 'Masculino', '(11) 2345-6789', 'carlos@email.com'),
(3, 'Mariana Santos', '1982-03-15', 'Feminino', '(11) 3456-7890', 'mariana@email.com'),
(4, 'Ricardo Silva', '1978-08-20', 'Masculino', '(11) 7890-1234', 'ricardo@email.com'),
(5, 'Fernanda Lima', '1985-01-30', 'Feminino', '(11) 4567-8901', 'fernanda@email.com');

INSERT INTO tabela_disciplinas (ID_Disciplina, Nome_Disciplina, Descricao, Carga_Horaria, ID_Professor)
VALUES
(1, 'Matemática', 'Estudo de conceitos matemáticos avançados', 60, 1),
(2, 'História', 'História mundial e local', 45, 2),
(3, 'Física', 'Princípios fundamentais da física', 60, 1),
(4, 'Química', 'Estudo da química e suas aplicações', 45, 3),
(5, 'Inglês', 'Aulas de inglês para iniciantes', 45, 4);

INSERT INTO tabela_turmas (ID_Turma, Nome_Turma, Ano_Letivo, ID_Professor_Orientador)
VALUES
(1, 'Turma A', 2023, 1),
(2, 'Turma B', 2023, 2),
(3, 'Turma C', 2023, 3),
(4, 'Turma D', 2023, 4),
(5, 'Turma E', 2023, 5);

INSERT INTO tabela_turmas_disciplinas (ID_Turma, ID_Disciplina)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO tabela_turmas_alunos (ID_Turmas, ID_Alunos)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO tabela_notas (ID_Nota, ID_Aluno, ID_Disciplina, Valor_Nota, Data_Avaliaçao)
VALUES
(2, 1, 1, 6.19, '2023-07-07'),
(3, 2, 1, 7.18, '2023-07-07'),
(4, 3, 1, 7.47, '2023-07-07'),
(5, 4, 1, 7.46, '2023-07-07'),
(6, 5, 1, 4.35, '2023-07-07');

-- Consulta 1: Executar consultas para verificar se os dados foram importados corretamente em todas as tabelas.

SELECT * FROM tabela_alunos
SELECT * FROM tabela_disciplinas
SELECT * FROM tabela_notas
SELECT * FROM tabela_professores
SELECT * FROM tabela_turmas
SELECT * FROM tabela_turmas_alunos
SELECT * FROM tabela_turmas_disciplinas

-- Consulta 2: Retorne as informações de todos os alunos ordenados pelo nome.

CREATE VIEW info_alunos_discilpinas AS
SELECT ttd.ID_Turma, td.Nome_Disciplina FROM tabela_turmas_disciplinas ttd
JOIN tabela_disciplinas td
WHERE ttd.ID_Disciplina = td.ID_Disciplina

SELECT * FROM info_alunos_discilpinas

CREATE VIEW info_alunos_turmas AS
SELECT iad.Nome_Disciplina, tt.ID_Turma, tt.Nome_Turma, tt.Ano_Letivo FROM tabela_turmas tt
JOIN info_alunos_discilpinas iad
WHERE tt.ID_Turma = iad.ID_Turma

SELECT * FROM info_alunos_turmas

CREATE VIEW info_alunos_id AS 
SELECT tta.ID_Alunos, iat.Nome_Disciplina, iat.Nome_Turma, iat.Ano_Letivo FROM tabela_turmas_alunos tta
JOIN info_alunos_turmas iat
WHERE tta.ID_Turmas = iat.ID_Turma

SELECT * FROM info_alunos_id

CREATE VIEW info_alunos AS
SELECT ta.ID_Aluno, ta.Nome_Aluno, ta.Data_Nascimento, ta.Genero, ta.Endereco, ta.Telefone_Contato, ta.Email, iai.Nome_Disciplina, iai.Nome_Turma, iai.Ano_Letivo 
FROM info_alunos_id iai
JOIN tabela_alunos ta
WHERE ta.ID_Aluno = iai.ID_Alunos

SELECT * FROM info_alunos ORDER BY Nome_Aluno

-- Consulta 3: Retornar a disciplina que possui a carga horaria maior que 40.

SELECT * FROM tabela_disciplinas WHERE Carga_Horaria > 40

-- Consulta 4: Buscar as notas que são maiores que 6 e menores que 8.

SELECT * FROM tabela_notas WHERE Valor_Nota BETWEEN 6 AND 8



