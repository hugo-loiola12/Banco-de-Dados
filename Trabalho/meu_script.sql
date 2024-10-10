-- Aula 07/10/2024
-- Inserção de dados

-- tabela jogo
insert into Jogo (nome_jogo) values
('Game A'), -- 1
('Game B'), -- 2
('Game C'); -- 3
select * from Jogo;

-- tabela plataforma
insert into Plataforma (nome_plataforma) values
('PlayStation'), -- 1
('Xbox'), -- 2
('PC'); -- 3
select * from Plataforma;


-- tabela jogo_plataforma
insert into Jogo_Plataforma (Jogos_idJogos, Plataforma_idPlataforma, Preco) values
(1, 1, 30.00), (1, 2, 40.00), (1, 3, 50.00), -- game a
(2, 1, 20.00), (2, 2, 35.00), -- game b
(3, 3, 25.00); -- game c
select * from Jogo_Plataforma;

-- select para visualizar os dados entre jogo e plataforma
select
    j.nome_jogo as Nome,
    p.nome_plataforma as Plataforma,
    jp.Preco as Preço
from Jogo j
         inner join Jogo_Plataforma jp on j.idJogos = jp.Jogos_idJogos
         inner join Plataforma p on jp.Plataforma_idPlataforma = p.idPlataforma;

-- agregação
select count(*) as qtd
from Plataforma;

select
    p.nome_plataforma,
    count(jp.Jogos_idJogos) as qtd_jogos
from Plataforma p
         inner join Jogo_Plataforma jp on p.idPlataforma = jp.Plataforma_idPlataforma
group by p.nome_plataforma;


select max(jp.Preco) as maior_preco
from Jogo_Plataforma jp;

