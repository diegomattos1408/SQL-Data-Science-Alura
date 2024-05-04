-- Buscar o nome do professor e a turma que ele é orientador
CREATE VIEW professor_orientador AS
SELECT p.Nome_Professor, t.Nome_Turma FROM Professores p 
JOIN Turmas t ON t.ID_Professor_Orientador = p.ID_Professor

SELECT * fROM professor_orientador

-- Retornar o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática
SELECT * FROM Notas
SELEcT * FROM Disciplinas

-- Filtrando pela disciplina Matemática e checando o número de notas
CREATE VIEW notas_matemática as
SELEcT COUNT(id_disciplina) AS numero_notas, SUM(nota) as soma_notas FROM Notas
WHERE id_disciplina = 1

SELECT * FROM notas_matemática

-- Criando uma view com as informações do nome do aluno e sua nota em matemática
CREATE VIEW melhor_nota_matemática AS
SELECT a.Nome_ALuno, n.Nota, d.Nome_Disciplina FROM Alunos a 
JOIN Notas n ON a.ID_Aluno = n.ID_Aluno 
JOIN Disciplinas d ON d.ID_Disciplina = n.ID_Disciplina
WHERE d.Nome_Disciplina = 'Matemática'

-- Checando se a soma das notas é a mesma da soma das notas em notas_matemática
SELECT SUM(Nota) FROM melhor_nota_matemática

-- Retornando o valor máximo
SElect Nome_Aluno, MAX(Nota), Nome_Disciplina 
FRom melhor_nota_matemática

DROP VIEW notas_matemática

-- Identificar o total de alunos por turma
SELECT * FROM Alunos
SELECT * FROM Turmas
SELECT * FROM Turma_Alunos

CREATE VIEW contamge_alunos AS
SELECt a.ID_Aluno, ta.ID_Turma FROM Alunos a
JOIN Turma_Alunos ta 
WHERE a.ID_Aluno = ta.ID_Aluno

SELECT * FROM contamge_alunos

CREATE VIEW quantidade_alunos_turmas AS
SELECT t.Nome_Turma, COUNT(c.ID_Aluno) FROM Turmas t
JOIN contamge_alunos c 
WHERE t.ID_Turma = c.ID_Turma
GROUP BY t.Nome_Turma

SELECT * FROM quantidade_alunos_turmas

DROP VIEW contamge_alunos

-- Listar os Alunos e as disciplinas em que estão matriculados

CREATE VIEW contamge_alunos AS
SELECt a.ID_Aluno, a.Nome_Aluno, ta.ID_Turma FROM Alunos a
JOIN Turma_Alunos ta 
WHERE a.ID_Aluno = ta.ID_Aluno

SELECT * FROM contamge_alunos

CREATE VIEW turmas_alunos_matriculados AS 
SELECT c.Nome_Aluno, t.Nome_Turma FROM contamge_alunos c 
JOIN Turmas t 
Where c.ID_Turma = t.ID_Turma

SELECT * FROM turmas_alunos_matriculados

DROP VIEW contamge_alunos

-- Criar uma view que apresenta o nome, a disciplina e a nota dos alunosAlunos
CREATE VIEW alunos_notas_disciplinas AS
SELECT a.Nome_ALuno, n.Nota, d.Nome_Disciplina FROM Alunos a 
JOIN Notas n ON a.ID_Aluno = n.ID_Aluno 
JOIN Disciplinas d ON d.ID_Disciplina = n.ID_Disciplina

SELECT * FROM alunos_notas_disciplinas



