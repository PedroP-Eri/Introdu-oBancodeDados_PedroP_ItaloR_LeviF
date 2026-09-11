SELECT
    alunos.nome AS aluno,
    disciplinas.nome AS disciplina
FROM alunos
JOIN aluno_disciplina
    ON alunos.id = aluno_disciplina.aluno_id
JOIN disciplinas
    ON disciplinas.id = aluno_disciplina.disciplina_id
ORDER BY alunos.nome ASC, disciplinas.nome ASC;