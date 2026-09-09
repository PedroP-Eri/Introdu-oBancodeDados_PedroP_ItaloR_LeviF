SELECT turmas.nome AS turma,
COUNT(alunos.id) AS quantidade_alunos
FROM turmas
JOIN alunos
ON alunos.turma_id = turmas.id
GROUP BY turmas.id, turmas.nome;

SELECT alunos.nome AS aluno,
COUNT(aluno_disciplina.disciplina_id) AS quantidade_disciplinas
FROM alunos
JOIN aluno_disciplina
ON alunos.id = aluno_disciplina.aluno_id
GROUP BY alunos.id, alunos.nome;

SELECT disciplinas.nome AS disciplina,
COUNT(aluno_disciplina.aluno_id) AS quantidade_alunos
FROM disciplinas
JOIN aluno_disciplina
ON disciplinas.id = aluno_disciplina.disciplina_id
GROUP BY disciplinas.id, disciplinas.nome;