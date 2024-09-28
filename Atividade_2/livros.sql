CREATE TABLE Livros
(
    ID_Livro           INT AUTO_INCREMENT PRIMARY KEY,
    Titulo             VARCHAR(50),
    Autor              VARCHAR(50),
    Ano_Publicacao     YEAR,
    Preco              DECIMAL(10, 2),
    Quantidade_Estoque INT
);
-- Livro 1
insert into Livros (Titulo, Autor, ano_publicacao, Preco, Quantidade_Estoque)
values ('Introdução ao SQL', 'João Silva', 2015, 50.00, 10);

-- Livro 2
insert into Livros (Titulo, Autor, Ano_Publicacao, Preco, Quantidade_Estoque)
values ('Mastering SQL', 'Maria Souza', 2018, 120.00, 5);

-- Livro 3
insert into Livros (Titulo, Autor, Ano_Publicacao, Preco, Quantidade_Estoque)
values ('SQL para Iniciantes', 'Paulo Santos', 2020, 75.00, 8);

-- Listar todos os livros, mostrando o título, autor e preço.
SELECT Titulo, Autor, Preco
FROM Livros;

-- Selecionar todos os livros publicados a partir de 2018, mostrando título e ano de publicação.
SELECT Titulo, Ano_Publicacao
FROM Livros
where Ano_Publicacao >= 2018;

-- Exibir os livros cujo preço esteja entre 60.00 e 100.00, mostrando o título e o preço.
SELECT Titulo, Preco
FROM Livros
WHERE Preco <= 100.00
  AND Preco >= 60.00;

-- Listar os livros com quantidade em estoque menor que 10, mostrando o título e a quantidade.
SELECT Titulo, Quantidade_Estoque
FROM Livros
where Quantidade_Estoque < 10;

-- O preço do livro "SQL para Iniciantes" aumentou para 80.00. Faça essa atualização.
UPDATE Livros
SET Preco = 80.00
WHERE Titulo = 'SQL para Iniciantes';

-- O estoque do livro "Introdução ao SQL" foi atualizado para 15. Atualize essa informação.
UPDATE Livros
SET Quantidade_Estoque = 15
WHERE Titulo = 'Introdução ao SQL';

-- Um livro foi removido da livraria. Exclua o livro "Mastering SQL" da tabela.
DELETE
FROM Livros
WHERE Titulo = 'Mastering SQL';

-- Calcule o preço total dos livros disponíveis em estoque
SELECT SUM(Preco * Quantidade_Estoque) AS Preco_Total_Estoque
FROM Livros;

-- Encontre o livro mais caro da tabela.
SELECT Titulo, Autor, Preco
FROM Livros
ORDER BY Preco DESC
LIMIT 1;
