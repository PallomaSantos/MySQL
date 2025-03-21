CREATE DATABASE IF NOT EXISTS loja_eletronicos;
USE loja_eletronicos;

CREATE TABLE produtos(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100),
    categoria VARCHAR(50),
    preco DECIMAL(8,2), 
    quantidade_estoque INT
);


INSERT INTO produtos (nome, categoria, preco, quantidade_estoque) VALUES
('Smartphone XYZ', 'Celulares', 1500.00, 10),
('Notebook ABC', 'Computadores', 3500.00, 5),
('Tablet 10 Polegadas', 'Tablets', 1200.00, 8),
('Fone de Ouvido Bluetooth', 'Acessórios', 250.00, 20),
('Smartwatch Pro', 'Wearables', 800.00, 15),
('Teclado Mecânico RGB', 'Periféricos', 400.00, 12),
('Mouse Gamer', 'Periféricos', 300.00, 18),
('Monitor 24 Polegadas', 'Monitores', 900.00, 7),
('Caixa de Som Portátil', 'Acessórios', 200.00, 25),
('Impressora Multifuncional', 'Impressão', 600.00, 3);

SELECT * FROM produtos; 
SELECT nome, preco FROM produtos;
SELECT * FROM produtos where preco > 1000; 
SELECT * FROM produtos
ORDER BY preco ASC;

SELECT * FROM produtos where preco < 500;
SELECT * FROM produtos where categoria = 'Acessórios'; 
SELECT * FROM produtos where quantidade_estoque > 10;
SELECT * FROM produtos where preco BETWEEN 300 AND 800;

INSERT INTO produtos (nome, categoria, preco, quantidade_estoque)
VALUES ('Redmi Note 7', 'Celulares', 800, 3);

UPDATE produtos SET preco = 1600.00 WHERE id = 1;
DELETE FROM produtos WHERE id = 10;
ALTER TABLE produtos 
ADD marcas VARCHAR (100);

SELECT * FROM produtos 
ORDER BY nome ASC;
SELECT * FROM produtos where categoria = 'Periféricos'
ORDER BY 'Periféricos' DESC;
SELECT * FROM produtos
ORDER BY quantidade_estoque DESC;
SELECT * FROM produtos where preco > 1000
ORDER BY nome ASC;

SELECT * FROM produtos where preco = 250.00 OR preco = 800;
SELECT MAX(preco) FROM produtos;
UPDATE produtos
SET preco = preco * 1.05
WHERE id BETWEEN 1 AND 11;
INSERT INTO produtos (nome, categoria, preco, quantidade_estoque, marcas)
VALUES ('Notebook positivo', 'Computadores', 2000.00, NULL, 'Positivo');
SELECT * FROM produtos WHERE quantidade_estoque IS NULL;




 


