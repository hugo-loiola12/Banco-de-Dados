-- Criar Tabela Categoria
CREATE TABLE Categoria_Produtos
(
    id_categoria   INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL
);

-- Inserção de categorias iniciais
INSERT INTO Categoria_Produtos (nome_categoria)
VALUES ('Roupas Esportivas'),
       ('Equipamentos de Futebol'),
       ('Acessórios de Treino');

-- Criar Tabela Produtos
CREATE TABLE Produtos
(
    id_produto   INT AUTO_INCREMENT PRIMARY KEY,
    nome         VARCHAR(50) NOT NULL,
    preco        FLOAT       NOT NULL CHECK ( preco > 0 ),
    qtd_estoque  INT         NOT NULL CHECK ( qtd_estoque >= 0 ),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES Categoria_Produtos (id_categoria)
);
-- Inserção de produtos iniciais
INSERT INTO Produtos (nome, preco, qtd_estoque, id_categoria)
VALUES ('Camisa de Futebol', 89.90, 100, 2),
       ('Tênis de Corrida', 299.99, 50, 1),
       ('Faixa de Cabeça', 25.00, 200, 3);

-- TODO Consultas

-- Consultar todos os produtos com suas categorias
SELECT p.nome, c.nome_categoria
FROM Produtos p
         JOIN Categoria_Produtos c ON p.id_categoria = c.id_categoria;

-- Consultar todos os produtos de uma categoria específica
SELECT p.nome, c.nome_categoria
FROM Produtos p
         JOIN Categoria_Produtos c ON p.id_categoria = c.id_categoria
WHERE c.nome_categoria = 'Roupas Esportivas';

-- Consultar categorias que têm mais de 50 produtos em estoque
SELECT c.nome_categoria
FROM Produtos p
         JOIN Categoria_Produtos c on p.id_categoria = c.id_categoria
GROUP BY c.nome_categoria
HAVING SUM(p.qtd_estoque) > 50;

-- Alterar o preço de um produto específico para um novo valor
UPDATE Produtos
SET preco = 499.99
WHERE nome = 'Camisa de Futebol';

-- Adicionar uma nova categoria e atualizar um produto para essa nova categoria
INSERT INTO Categoria_Produtos (nome_categoria) VALUE ('Bolas Esportivas');

UPDATE Produtos
SET id_categoria = (SELECT id_categoria FROM Categoria_Produtos WHERE nome_categoria = 'Bolas Esportivas')
WHERE nome = 'Camisa de Futebol';

-- Excluir um produto específico
DELETE
FROM Produtos
WHERE nome = 'Faixa de Cabeça';

-- Mostrar o resultado final
SELECT p.nome, c.nome_categoria
FROM Produtos p
         JOIN Categoria_Produtos c ON p.id_categoria = c.id_categoria;