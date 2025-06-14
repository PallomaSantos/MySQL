CREATE DATABASE IF NOT EXISTS Supermercado;
USE Supermercado;

CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Email VARCHAR(100),
    Telefone VARCHAR(20),
    DataCadastro DATE NOT NULL
);

CREATE TABLE Fornecedores (
    FornecedorID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    CNPJ VARCHAR(18) UNIQUE NOT NULL,
    Telefone VARCHAR(20),
    Email VARCHAR(100),
    Endereco VARCHAR(200)
);

CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Categoria VARCHAR(50),
    Preco DECIMAL(10, 2) NOT NULL,
    QuantidadeEstoque INT NOT NULL,
    FornecedorID INT,
    FOREIGN KEY (FornecedorID) REFERENCES Fornecedores(FornecedorID)
);

CREATE TABLE Vendas (
    VendaID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataVenda DATE NOT NULL,
    Total DECIMAL(10, 2),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE ItensVenda (
    ItemVendaID INT PRIMARY KEY AUTO_INCREMENT,
    VendaID INT,
    ProdutoID INT,
    Quantidade INT,
    PrecoUnitario DECIMAL(10, 2),
    Subtotal DECIMAL(10, 2),
    FOREIGN KEY (VendaID) REFERENCES Vendas(VendaID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);


INSERT INTO Clientes (Nome, CPF, Email, Telefone, DataCadastro) VALUES
('João Silva', '123.456.789-09', 'joao.silva@example.com', '(11) 91234-5678', '2025-06-13'),
('Maria Oliveira', '987.654.321-00', 'maria.oliveira@testmail.com', '(21) 99876-5432', '2025-06-13'),
('Lucas Fernandes', '111.222.333-96', 'lucas.fernandes@fakeemail.org', '(31) 98765-4321', '2025-06-13');

INSERT INTO Fornecedores (Nome, CNPJ, Telefone, Email, Endereco) VALUES
('Distribuidora Alimentos Brasil', '45.678.123/0001-22', '(11) 2233-4455', 'contato@alimentosbr.com', 'Rua das Mercadorias, 100 - São Paulo/SP'),
('Higienix Suprimentos LTDA', '87.654.321/0001-33', '(21) 9988-7766', 'vendas@higienix.com.br', 'Avenida dos Fornecedores, 250 - Rio de Janeiro/RJ');

INSERT INTO Produtos (Nome, Categoria, Preco, QuantidadeEstoque, FornecedorID) VALUES
('Arroz Tipo 1 - 5kg', 'Alimentos', 24.90, 100, 1),
('Feijão Carioca - 1kg', 'Alimentos', 8.50, 80, 1),
('Óleo de Soja 900ml', 'Alimentos', 6.75, 120, 1),
('Sabão em Pó 1kg', 'Limpeza', 12.90, 60, 2),
('Desinfetante Lavanda 500ml', 'Limpeza', 5.50, 70, 2);

INSERT INTO Vendas (ClienteID, DataVenda, Total) VALUES
(1, '2025-06-10', 56.55),
(2, '2025-06-11', 59.00),
(3, '2025-06-12', 25.40);

INSERT INTO ItensVenda (VendaID, ProdutoID, Quantidade, PrecoUnitario, Subtotal) VALUES
(1, 1, 2, 24.90, 49.80),
(1, 3, 1, 6.75, 6.75),
(2, 2, 5, 8.50, 42.50),
(2, 5, 3, 5.50, 16.50),
(3, 4, 1, 12.90, 12.90),
(3, 2, 1, 8.50, 8.50);

-- Consultar Produtos com Estoque Disponível
SELECT * FROM Produtos WHERE QuantidadeEstoque IS NOT NULL;

-- Consultar Clientes
SELECT * FROM Clientes WHERE ClienteID IS NOT NULL;

-- Consultar Fornecedores
SELECT Nome, Telefone, Email FROM Fornecedores;

-- Consultar Produtos com Estoque Baixo
SELECT * FROM Produtos WHERE QuantidadeEstoque < 10;

-- Consultar Vendas do Mês Atual
SELECT * FROM Vendas WHERE MONTH(DataVenda) = MONTH(CURDATE());

-- Consultar Clientes com Nome Iniciado com 'A'
SELECT * FROM Clientes WHERE Nome LIKE 'A%';

-- Consultar Produtos, Fornecedores e Preços
SELECT p.Nome AS Produto, f.Nome AS Fornecedor, p.Preco
FROM ItensVenda i
JOIN Produtos p ON i.ProdutoID = p.ProdutoID
JOIN Fornecedores f ON p.FornecedorID = f.FornecedorID
GROUP BY p.nome;

-- Consultar Itens de Venda com Quantidade, Preço Unitário e Subtotal
SELECT p.Nome AS Nome, i.Quantidade AS Quantidade, i.PrecoUnitario, i.Subtotal AS Subtotal
FROM ItensVenda i
JOIN Produtos p ON i.ProdutoID = p.ProdutoID;

-- Consultar Total de Vendas por Produto
SELECT p.Nome AS Nome, SUM(i.Quantidade) AS Total
FROM ItensVenda i
JOIN Produtos p ON i.ProdutoID = p.ProdutoID
GROUP BY p.Nome;

-- Consultar Total de Vendas por Cliente
SELECT c.Nome AS Nome, SUM(i.Quantidade) AS Total
FROM ItensVenda i
JOIN Vendas v ON i.VendaID = v.VendaID
JOIN Clientes c ON v.ClienteID = c.ClienteID
GROUP BY c.Nome;

-- Consultar Total de Vendas no Supermercado
SELECT SUM(v.total) AS ValorTotalVendas
FROM ItensVenda i 
JOIN Vendas v ON i.VendaID = v.VendaID;

-- Atualizar o preco de um produto específico 
UPDATE produtos SET Preco = 25.00 WHERE preco = 24.90;
SELECT * FROM Produtos;

-- Excluir um fornecedor e todos os produtos deles
DELETE i FROM itensvenda i
JOIN produtos p ON i.ProdutoID = p.ProdutoID
WHERE p.FornecedorID = 2;
DELETE FROM Produtos WHERE FornecedorID = 2;
DELETE FROM Fornecedores WHERE FornecedorID = 2;

-- Consulta legal 
SELECT c.nome AS Nome, v.DataVenda, SUM(i.quantidade) AS Quantidade, SUM(v.total) AS Total 
FROM ItensVenda i
JOIN Vendas v ON i.VendaID = v.VendaID
JOIN Clientes c ON v.ClienteID = c.ClienteID
GROUP BY c.nome;
