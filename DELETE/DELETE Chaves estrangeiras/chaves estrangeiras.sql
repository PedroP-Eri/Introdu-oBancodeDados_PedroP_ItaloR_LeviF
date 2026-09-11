DELETE FROM alunos
WHERE id = 2;

PRAGMA foreign_keys = ON;

DELETE FROM aluno_disciplina
WHERE aluno_id = 2;

DELETE FROM alunos
WHERE id = 2;