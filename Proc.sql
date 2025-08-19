
CREATE DATABASE Atv01;
USE Atv01;


CREATE TABLE cad_cli (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    cpf VARCHAR(15),
    endereco VARCHAR(100),
    celular VARCHAR(12),
    data_nasc DATE
);

-- Cria a procedure
DELIMITER $$

CREATE PROCEDURE insere_cliente (
    IN p_nome VARCHAR(100),
    IN p_cpf VARCHAR(15),
    IN p_endereco VARCHAR(100),
    IN p_celular VARCHAR(12),
    IN p_data_nasc DATE
)
BEGIN
    START TRANSACTION;
    
    INSERT INTO cad_cli (nome, cpf, endereco, celular, data_nasc)
    VALUES (p_nome, p_cpf, p_endereco, p_celular, p_data_nasc);
    
    COMMIT;
    
    SELECT * FROM cad_cli;
END$$

DELIMITER ;

-- Testa a procedure
CALL insere_cliente(
    'Maria Gabriela',
    '456-345-768-38',
    'Rua das Flores, 279',
    '11995779823',
    '2000-05-10'
);
