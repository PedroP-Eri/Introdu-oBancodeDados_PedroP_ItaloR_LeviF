SELECT 
    alunos.nome,
    turmas.nome AS turma
FROM alunos
JOIN turmas ON alunos.turma_id = turmas.id
WHERE turmas.id = 1
ORDER BY alunos.nome ASC;