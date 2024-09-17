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