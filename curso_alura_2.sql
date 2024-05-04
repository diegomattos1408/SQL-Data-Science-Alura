-- Consulta 1: Retornar a média de Notas dos Alunos em história
SELECT * FROM Disciplinas;

SELECT ID_Disciplina FROM Disciplinas
WHERE Nome_Disciplina = 'História';

SELECT * FROM Notas;

SELECT AVG(Nota) FROM Notas 
Where ID_Disciplina = 2;

-- Consulta 2: Retornar as informações dos alunos cujo Nome começa com 'A'.
SELECT * FROM Alunos;

SELECT * FROM Alunos
WHERE Nome_Aluno LIKE 'A%';

-- Consulta 3: Buscar apenas os alunos que fazem aniversário em fevereiro.
SELECT * FROM Alunos
WHERE STRFTIME('%m', Data_Nascimento) = '02';

-- Consulta 4: Realizar uma consulta que calcula a idade dos Alunos. 
SELECT Nome_Aluno, (strftime('%Y', 'now') - strftime('%Y', Data_Nascimento)) AS Idade
FROM Alunos;

 