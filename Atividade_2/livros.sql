CREATE TABLE livros (
    id_livro INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(50),
    autor VARCHAR(50),
    ano_publicacao YEAR,
    preco DECIMAL(10,2),
    quantidade_estoque INT
);
-- Livro 1
insert into livros (titulo, autor, ano_publicacao, preco, quantidade_estoque)
values ('Introdução ao SQL', 'João Silva', 2015, 50.00, 10);

-- Livro 2
insert into  livros (titulo, autor, ano_publicacao, preco, quantidade_estoque)
values ('Mastering SQL', 'Maria Souza', 2018, 120.00, 5);

-- Livro 3
insert into livros (titulo, autor, ano_publicacao, preco, quantidade_estoque)
values ('SQL para Iniciantes', 'Paulo Santos', 2020, 75.00, 8);

-- Listar todos os livros, mostrando o título, autor e preço.
SELECT titulo, autor, preco FROM livros;

-- Selecionar todos os livros publicados a partir de 2018, mostrando título e ano de publicação.
SELECT titulo, ano_publicacao FROM livros where ano_publicacao >= 2018;

-- Exibir os livros cujo preço esteja entre 60.00 e 100.00, mostrando o título e o preço.
SELECT titulo, preco FROM livros WHERE preco <= 100.00 AND preco >= 60.00;

-- Listar os livros com quantidade em estoque menor que 10, mostrando o título e a quantidade.
SELECT titulo, quantidade_estoque FROM livros where quantidade_estoque < 10;

-- O preço do livro "SQL para Iniciantes" aumentou para 80.00. Faça essa atualização.
UPDATE livros SET preco = 80.00 WHERE titulo = 'SQL para Iniciantes';

-- O estoque do livro "Introdução ao SQL" foi atualizado para 15. Atualize essa informação.
UPDATE livros SET quantidade_estoque = 15 WHERE titulo = 'Introdução ao SQL';

-- Um livro foi removido da livraria. Exclua o livro "Mastering SQL" da tabela.
DELETE FROM livros WHERE titulo = 'Mastering SQL';

-- Calcule o preço total dos livros disponíveis em estoque
SELECT SUM(preco * quantidade_estoque) AS preco_total_estoque
FROM livros;

-- Encontre o livro mais caro da tabela.
SELECT titulo, autor, preco
FROM livros
ORDER BY preco DESC
LIMIT 1;
