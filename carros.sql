SET SQL_SAFE_UPDATES = 0;

CREATE DATABASE IF NOT EXISTS ETE_multimarcas;
USE ETE_multimarcas;
CREATE TABLE carros(
	id_carro INT AUTO_INCREMENT PRIMARY KEY,
    fabricante VARCHAR(50),
    modelo VARCHAR(50),
    ano_fabricacao VARCHAR(25),
    cor VARCHAR(25),
    quantidade INT,
    categoria VARCHAR(50));

INSERT INTO carros (fabricante, modelo, ano_fabricacao, cor, quantidade, categoria) VALUES
('Volkswagen', 'Gol', '2023', 'Branco', 10, 'Hatch'),
('Chevrolet', 'Onix', '2022', 'Prata', 15, 'Hatch'),
('Fiat', 'Argo', '2021', 'Vermelho', 8, 'Hatch'),
('Toyota', 'Corolla', '2023', 'Preto',5, 'Sedan'),
('Honda', 'Civic','2022', 'Azul', 7, 'Sedan'),
('Ford', 'EcoSport','2020','Cinza', 12, 'SUV' ),
('Hyundai', 'Tucson', '2021', 'Branco', 6, 'SUV'),
('Nissan', 'Kicks','2023', 'Amarelo', 9, 'SUV'),
('Renault', 'Kwid', '2020', 'Vermelho', 13, 'Hatch'),
('Jeep','Compass', '2022', 'Verde', 4, 'SUV'),
('BMW','X3', '2023', 'Preto', 3, 'SUV'),
('Mercedes-Benz', 'GLC', '2022', 'Prata', 2, 'SUV'),
('Audi', 'A3', '2023', 'Azul', 5, 'Sedan'),
('Peugeot', '208', '2021', 'Branco', 10, 'Hatch'),
('Kia', 'Seltos', '2021', 'Cinza', 8, 'SUV'),
('Volkswagen', 'T-Cross', '2022', 'Vermelho', 6,'SUV'),
('Fiat', 'Toro', '2023', 'Azul',7, 'Pickup'),
('Toyota', 'Hilux', '2022', 'Preto', 5, 'Pickup'),
('Chevrolet', 'S10', '2023', 'Branco', 4, 'Pickup'),
('Land Rover', 'Defender', '2023', 'Verde', 2, 'SUV');

SELECT * FROM carros WHERE fabricante = 'Toyota';

SELECT fabricante, modelo, cor FROM carros WHERE fabricante = 'Fiat';

SELECT * FROM carros 
ORDER BY quantidade DESC;

SELECT * FROM carros WHERE cor = 'Preto';

UPDATE carros SET quantidade = 5 WHERE fabricante = "Fiat";

UPDATE carros SET cor = "Azul" WHERE cor = "Vermelho";

UPDATE carros SET modelo ="Polo" WHERE modelo = "Gol";

UPDATE 	carros SET quantidade = 8 WHERE quantidade = 1




