
CREATE DATABASE escola;
USE escola;

CREATE TABLE professor (
    id_professor INT AUTO_INCREMENT PRIMARY KEY, 
    nome VARCHAR(100) NOT NULL,                 
    especialidade VARCHAR(100),                
    salario DECIMAL(10,2),                    
    uf CHAR(2)                                   
);

CREATE TABLE disciplina (
    id_disciplina INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    id_professor INT,                           
    carga_horaria INT,
    FOREIGN KEY (id_professor) REFERENCES professor(id_professor)
);

CREATE TABLE aluno (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sexo CHAR(1),
    data_nascimento DATE,
    nota_final DECIMAL(4,2),
    ativo BOOLEAN
);

CREATE TABLE curso (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT,
    modalidade VARCHAR(50)
);

CREATE TABLE matricula (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    id_curso INT,
    data_matricula DATE,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno),
    FOREIGN KEY (id_curso) REFERENCES curso(id_curso)
);

CREATE TABLE login (
    id_login INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    data_hora DATETIME,
    ip VARCHAR(45),
    sucesso BOOLEAN,
    FOREIGN KEY (id_aluno) REFERENCES aluno(id_aluno)
);

-- Professores -> select * from professor
INSERT INTO professor (nome, especialidade, salario, uf) VALUES
('Maria Silva', 'Matemática', 5500.00, 'SP'),
('Jorge Silva', 'Física', 10000.00, 'PR'),
('Alex Moreira', 'Inglês', 8000.00, 'SC');

-- Disciplinas -> select * from disciplina
INSERT INTO disciplina (nome, id_professor, carga_horaria) VALUES
('Álgebra Linear', 1, 60),
('Física', 2, 70),
('Inglês', 3, 40);

-- Alunos -> select * from aluno
INSERT INTO aluno (nome, sexo, data_nascimento, nota_final, ativo) VALUES
('Carlos Andrade', 'M', '2002-05-10', 8.5, TRUE),
('Alexandre Alves', 'M', '1999-04-01', 8.9, TRUE),
('Alexandra Ribeiro', 'F', '1997-06-01', 9.9, TRUE);

-- Cursos -> select * from curso
INSERT INTO curso (nome, carga_horaria, modalidade) VALUES
('Engenharia', 3600, 'Presencial'),
('Física Teorica', 3800,'Online');

-- Matrículas -> select * from matricula
INSERT INTO matricula (id_aluno, id_curso, data_matricula) VALUES
(1, 1, '2024-02-01'),
(2, 2, '2023-02-11'),
(3, 3, '2023-02-011');

-- Logins -> select * from login
INSERT INTO login (id_aluno, data_hora, ip, sucesso) VALUES
(1, '2024-05-01 08:30:00', '192.168.1.10', TRUE),
(2, '2024-05-01 08:37:13', '192.168.1.11', TRUE),
(3, '2024-05-01 08:31:54', '192.168.1.12', TRUE);

SELECT * FROM aluno;

SELECT
	m.id_matricula,
    a.nome AS aluno,
    c.nome AS curso,
    m.data_matricula
FROM matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
JOIN curso c ON m.id_curso = c.id_curso;
