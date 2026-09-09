SELECT alunos.nome AS aluno,
carteirinhas.numero AS carteirinha
FROM alunos
JOIN carteirinhas
ON alunos.id = carteirinhas.aluno_id;