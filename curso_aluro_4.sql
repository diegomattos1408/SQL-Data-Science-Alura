-- Consulta 1: Retorne todas as disciplinas 
SELECT Nome_Disciplina FROM Disciplinas;

-- Consulta 2: Retorne os alunos que estão aprovados na disciplina de matemática
SELECT a.Nome_Aluno, n.Nota,
CASE WHEN n.Nota >= 5 THEN 'Aprovado'ELSE 'Reprovado'END as Situacao
FRom Notas n
JOIN Alunos a ON n.ID_Aluno = a.ID_Aluno 
Where n.ID_Disciplina = 1 and Situacao = 'Aprovado';

-- Consulta 3: Identificar o total de disciplinas por turma
SELECT Nome_Turma, COUNT(Nome_Turma) as Qtd_total_disciplinas
FROM (
  SELECt t.Nome_Turma, td.ID_Disciplina
  FROM Turmas t 
  JOIN Turma_Disciplinas td ON t.ID_Turma = td.ID_Turma
  )
  GROUP BY Nome_Turma;
  
-- Consulta 4: Porcentagem dos alunos que estão aprovados
SELECT ROUND(
  (SELECT COUNT(*)
   FROM (SELECT 
         CASE WHEN n.Nota >= 5 THEN 'Aprovado' ELSE 'Reprovado' END as Situacao
         FROM Notas n
        ) AS Subquery
   WHERE Situacao = 'Aprovado') * 100.0 / COUNT(*), 2) || '%' Percentual_Aprovados
FROM Notas;
  
-- Consulta 5: Porcentagem dos alunos que estão aprovados por disciplina
SELECT d.Nome_Disciplina, 
  ROUND(100.0 * COUNT(n.Nota) / (SELECT COUNT(ID_Aluno) FROM Turma_Alunos), 2) || '%' AS Percentual_Aprovado
FROM Notas n
JOIN Disciplinas d ON n.ID_Disciplina = d.ID_Disciplina
WHERE n.Nota > 5
GROUP BY d.Nome_Disciplina; 