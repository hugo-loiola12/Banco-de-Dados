-- Criação da tabela Categorias
CREATE TABLE Categorias
(
    id_categoria   INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(100) NOT NULL
);

-- Inserção de categorias iniciais
INSERT INTO Categorias (nome_categoria)
VALUES ('Roupas Esportivas'),
       ('Equipamentos de Futebol'),
       ('Acessórios de Treino');

-- Criação da tabela Produtos
CREATE TABLE Produtos
(
    id_produto         INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto       VARCHAR(100) NOT NULL,
    preco              DECIMAL(10, 2) CHECK (preco > 0),            -- CHECK para garantir que o preço seja positivo
    quantidade_estoque INT CHECK (quantidade_estoque >= 0),         -- CHECK para garantir que a quantidade não seja negativa
    id_categoria       INT,
    FOREIGN KEY (id_categoria) REFERENCES Categorias (id_categoria) -- Chave estrangeira ligando à tabela Categorias
);

-- Inserção de produtos iniciais
INSERT INTO Produtos (nome_produto, preco, quantidade_estoque, id_categoria)
VALUES ('Camisa de Futebol', 89.90, 100, 2),
       ('Tênis de Corrida', 299.99, 50, 1),
       ('Faixa de Cabeça', 25.00, 200, 3);


SELECT p.nome_produto, p.preco, p.quantidade_estoque
FROM Produtos p
         JOIN Categorias c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Equipamentos de Futebol';


SELECT c.nome_categoria
FROM Produtos p
         JOIN Categorias c ON p.id_categoria = c.id_categoria
GROUP BY c.nome_categoria
HAVING SUM(p.quantidade_estoque) > 50;


UPDATE Produtos
SET preco = 279.99
WHERE nome_produto = 'Tênis de Corrida';

-- Adicionar uma nova categoria
INSERT INTO Categorias (nome_categoria)
VALUES ('Bolas Esportivas');

-- Atualizar um produto para essa nova categoria
UPDATE Produtos
SET id_categoria = (SELECT id_categoria FROM Categorias WHERE nome_categoria = 'Bolas Esportivas')
WHERE nome_produto = 'Camisa de Futebol';

DELETE
FROM Produtos
WHERE nome_produto = 'Faixa de Cabeça';
