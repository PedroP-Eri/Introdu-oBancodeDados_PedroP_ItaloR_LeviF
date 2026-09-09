SELECT alunos.nome AS aluno,
turmas.nome AS turma FROM alunos
JOIN turmas
ON alunos.turma_id = turmas.id;

SELECT alunos.nome AS aluno,
carteirinhas.numero AS carteirinha
FROM alunos
JOIN carteirinhas
ON alunos.id = carteirinhas.aluno_id;