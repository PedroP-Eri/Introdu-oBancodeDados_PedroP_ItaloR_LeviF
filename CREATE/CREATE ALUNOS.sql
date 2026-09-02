PRAGMA foreign_keys = ON;


CREATE TABLE alunos (
id INTEGER PRIMARY KEY AUTOINCREMENT,
nome TEXT NOT NULL,
turma_id INTEGER NOT NULL,
FOREIGN KEY (turma_id) REFERENCES turmas(id)
);