SELECT disciplinas.nome AS disciplina,
COUNT(aluno_disciplina.aluno_id) AS quantidade_alunos
FROM disciplinas
JOIN aluno_disciplina

ON disciplinas.id = aluno_disciplina.disciplina_id
GROUP BY disciplinas.id, disciplinas.nome
ORDER BY quantidade_alunos DESC;