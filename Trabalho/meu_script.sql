insert into Jogo (nome_jogo) values
("Game A"),
("Game B"),
("Game C");
select * from Jogo;

insert into Plataforma (nome_plataforma) values
("Playstation"),
("Xbox"),
("PC");	
select * from Plataforma;


insert into Jogo_Plataforma (Jogos_idJogos, Plataforma_idPlataforma, Preco) values
(1,1,30) -- Jogo A
-- Jogo B
-- Jogo C
;
