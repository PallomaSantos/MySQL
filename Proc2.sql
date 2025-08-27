-- query 1

CREATE DATABASE escola;
USE escola;

CREATE TABLE alunos (
	id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255),
	idade INT,
    id_turma INT
);

CREATE TABLE turmas (
	id_turma INT PRIMARY KEY AUTO_INCREMENT,
	turma VARCHAR(50),
    id_curso INT
);

CREATE TABLE boletim(
	id_boletim INT PRIMARY KEY AUTO_INCREMENT,
	id_curso INT,
    id_turma INT, 
    id_aluno INT,
	nota DECIMAL(4,2)
);

CREATE TABLE cursos (
	id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100)
);

-- query 2 (procedure)

DELIMITER //

CREATE PROCEDURE DadosInseridos(
	IN p_nome_curso VARCHAR(100),
	IN p_turma VARCHAR(50),
    IN p_nome_aluno VARCHAR(255),
    IN p_nota DECIMAL(4,2),
    IN p_idade INT,
    OUT p_id_aluno INT 
)

BEGIN 
	DECLARE v_id_curso INT;
    DECLARE v_id_turma INT;
    
    INSERT INTO cursos(nome_curso) VALUES (p_nome_curso);
    SET v_id_curso = LAST_INSERT_ID();
    
    INSERT INTO turmas(turma, id_curso) VALUES (p_turma, v_id_turma);
    SET v_id_turma = LAST_INSERT_ID();
    
    INSERT INTO alunos(nome, idade, id_turma) VALUES (p_nome_aluno, p_idade, v_id_turma);
	  SET p_id_aluno = LAST_INSERT_ID();
    
    INSERT INTO boletim(id_curso, id_turma, id_aluno, nota) VALUES (v_id_curso, v_id_turma, p_id_aluno, p_nota);
    
	END //
    
DELIMITER ;
    
-- query 3 (call e select)


SET @id_aluno_novo = 0;

CALL DadosInseridos(
	'Técnico em Desenvolvimento de Sistemas',
    '3ds',
    'Thomas Ratatouille',
	  7.5,
    16,
	@id_aluno_novo
);

SELECT @id_aluno_novo AS 'Id do aluno inserido';

SELECT 
	c.nome_curso AS Curso,
	t.turma AS Turma,
    a.nome AS Aluno,
    a.idade AS Idade,
    b.nota AS Nota
FROM boletim b
JOIN alunos a ON b.id_aluno = a.id_aluno
JOIN turmas t ON b.id_turma = t.id_turma
JOIN cursos c ON b.id_curso = c.id_curso
WHERE t.turma = '3ds'
	AND c.nome_curso = 'Técnico em Desenvolvimento de Sistemas';
