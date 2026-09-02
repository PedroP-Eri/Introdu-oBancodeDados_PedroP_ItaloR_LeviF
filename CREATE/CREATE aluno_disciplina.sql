PRAGMA foreign_keys = ON;


CREATE TABLE aluno_disciplina (
aluno_id INTEGER,
disciplina_id INTEGER,
PRIMARY KEY (aluno_id, disciplina_id),
FOREIGN KEY (aluno_id) REFERENCES alunos(id),
FOREIGN KEY (disciplina_id) REFERENCES disciplinas(id)
);