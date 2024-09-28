-- Tabela Estado, o nome do estado é uma coluna única
CREATE TABLE Estado
(
    id_estado   INT PRIMARY KEY AUTO_INCREMENT,
    nome_estado VARCHAR(100) UNIQUE
);

-- Tabela Cidade, usa o id da cidade e do estado como chaves compostas
CREATE TABLE Cidade
(
    id_cidade   INT PRIMARY KEY AUTO_INCREMENT,
    nome_cidade VARCHAR(100),
    id_estado   INT,
    FOREIGN KEY (id_estado) REFERENCES Estado (id_estado)
);

-- Tabela Departamento
CREATE TABLE Departamento
(
    id_departamento     INT PRIMARY KEY AUTO_INCREMENT,
    nome_departamento   VARCHAR(100) NOT NULL,
    filial_departamento VARCHAR(50)  NOT NULL
);

-- Tabela FonteFinanciadora, o nome da fonte será único, mas a chave primária será o id_fonte_fornecedora
CREATE TABLE FonteFinanciadora
(
    id_fonte_fornecedora INT PRIMARY KEY AUTO_INCREMENT,
    nome_fonte           VARCHAR(100) NOT NULL,
    valor_investido      DECIMAL(10, 2) CHECK (valor_investido >= 0)
);

-- Tabela Projeto, o nome do projeto será único, mas a chave primária será o id_projeto
CREATE TABLE Projeto
(
    id_projeto      INT PRIMARY KEY AUTO_INCREMENT,
    nome_projeto    VARCHAR(100) UNIQUE,
    valor_projeto   DECIMAL(10, 2) CHECK (valor_projeto >= 0),
    id_fonte        INT,
    id_departamento INT,
    FOREIGN KEY (id_fonte) REFERENCES FonteFinanciadora (id_fonte_fornecedora),
    FOREIGN KEY (id_departamento) REFERENCES Departamento (id_departamento)
);

-- Tabela Pesquisador, usando id_cidade, id_estado, id_departamento e id_projeto como chaves estrangeiras
CREATE TABLE Pesquisador
(
    id_pesquisador  INT PRIMARY KEY AUTO_INCREMENT,
    nome_completo   VARCHAR(100),
    status          VARCHAR(20) DEFAULT 'Ativo',
    id_cidade       INT,
    id_estado       INT,
    id_departamento INT,
    id_projeto      INT,
    FOREIGN KEY (id_cidade) REFERENCES Cidade (id_cidade),
    FOREIGN KEY (id_estado) REFERENCES Estado (id_estado),
    FOREIGN KEY (id_departamento) REFERENCES Departamento (id_departamento),
    FOREIGN KEY (id_projeto) REFERENCES Projeto (id_projeto)
);

-- Inserção de dados
INSERT INTO Estado(nome_estado)
VALUES ('Acre'),
       ('Alagoas'),
       ('Amapá'),
       ('Amazonas'),
       ('Bahia'),
       ('Ceará'),
       ('Distrito Federal'),
       ('Espírito Santo'),
       ('Goiás'),
       ('Maranhão'),
       ('Mato Grosso'),
       ('Mato Grosso do Sul'),
       ('Minas Gerais'),
       ('Pará'),
       ('Paraíba'),
       ('Paraná'),
       ('Pernambuco'),
       ('Piauí'),
       ('Rio de Janeiro'),
       ('Rio Grande do Norte'),
       ('Rio Grande do Sul'),
       ('Rondônia'),
       ('Roraima'),
       ('Santa Catarina'),
       ('São Paulo'),
       ('Sergipe'),
       ('Tocantins');


-- Inserção das Cidades
-- Cidades do Acre
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Rio Branco', (SELECT id_estado FROM Estado WHERE nome_estado = 'Acre')),
       ('Cruzeiro do Sul', (SELECT id_estado FROM Estado WHERE nome_estado = 'Acre'));

-- Cidades de Alagoas
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Maceió', (SELECT id_estado FROM Estado WHERE nome_estado = 'Alagoas')),
       ('Arapiraca', (SELECT id_estado FROM Estado WHERE nome_estado = 'Alagoas'));

-- Cidades do Amapá
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Macapá', (SELECT id_estado FROM Estado WHERE nome_estado = 'Amapá')),
       ('Santana', (SELECT id_estado FROM Estado WHERE nome_estado = 'Amapá'));

-- Cidades do Amazonas
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Manaus', (SELECT id_estado FROM Estado WHERE nome_estado = 'Amazonas')),
       ('Parintins', (SELECT id_estado FROM Estado WHERE nome_estado = 'Amazonas'));

-- Cidades da Bahia
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Salvador', (SELECT id_estado FROM Estado WHERE nome_estado = 'Bahia')),
       ('Feira de Santana', (SELECT id_estado FROM Estado WHERE nome_estado = 'Bahia'));

-- Cidades do Ceará
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Fortaleza', (SELECT id_estado FROM Estado WHERE nome_estado = 'Ceará')),
       ('Juazeiro do Norte', (SELECT id_estado FROM Estado WHERE nome_estado = 'Ceará'));

-- Cidades do Distrito Federal
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Brasília', (SELECT id_estado FROM Estado WHERE nome_estado = 'Distrito Federal'));

-- Cidades do Espírito Santo
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Vitória', (SELECT id_estado FROM Estado WHERE nome_estado = 'Espírito Santo')),
       ('Vila Velha', (SELECT id_estado FROM Estado WHERE nome_estado = 'Espírito Santo'));

-- Cidades de Goiás
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Goiânia', (SELECT id_estado FROM Estado WHERE nome_estado = 'Goiás')),
       ('Anápolis', (SELECT id_estado FROM Estado WHERE nome_estado = 'Goiás'));

-- Cidades do Maranhão
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('São Luís', (SELECT id_estado FROM Estado WHERE nome_estado = 'Maranhão')),
       ('Imperatriz', (SELECT id_estado FROM Estado WHERE nome_estado = 'Maranhão'));

-- Cidades de Mato Grosso
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Cuiabá', (SELECT id_estado FROM Estado WHERE nome_estado = 'Mato Grosso')),
       ('Várzea Grande', (SELECT id_estado FROM Estado WHERE nome_estado = 'Mato Grosso'));

-- Cidades de Mato Grosso do Sul
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Campo Grande', (SELECT id_estado FROM Estado WHERE nome_estado = 'Mato Grosso do Sul')),
       ('Dourados', (SELECT id_estado FROM Estado WHERE nome_estado = 'Mato Grosso do Sul'));

-- Cidades de Minas Gerais
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Belo Horizonte', (SELECT id_estado FROM Estado WHERE nome_estado = 'Minas Gerais')),
       ('Uberlândia', (SELECT id_estado FROM Estado WHERE nome_estado = 'Minas Gerais'));

-- Cidades do Pará
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Belém', (SELECT id_estado FROM Estado WHERE nome_estado = 'Pará')),
       ('Ananindeua', (SELECT id_estado FROM Estado WHERE nome_estado = 'Pará'));

-- Cidades da Paraíba
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('João Pessoa', (SELECT id_estado FROM Estado WHERE nome_estado = 'Paraíba')),
       ('Campina Grande', (SELECT id_estado FROM Estado WHERE nome_estado = 'Paraíba'));

-- Cidades do Paraná
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Curitiba', (SELECT id_estado FROM Estado WHERE nome_estado = 'Paraná')),
       ('Londrina', (SELECT id_estado FROM Estado WHERE nome_estado = 'Paraná'));

-- Cidades de Pernambuco
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Recife', (SELECT id_estado FROM Estado WHERE nome_estado = 'Pernambuco')),
       ('Olinda', (SELECT id_estado FROM Estado WHERE nome_estado = 'Pernambuco'));

-- Cidades do Piauí
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Teresina', (SELECT id_estado FROM Estado WHERE nome_estado = 'Piauí')),
       ('Parnaíba', (SELECT id_estado FROM Estado WHERE nome_estado = 'Piauí'));

-- Cidades do Rio de Janeiro
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Rio de Janeiro', (SELECT id_estado FROM Estado WHERE nome_estado = 'Rio de Janeiro')),
       ('Niterói', (SELECT id_estado FROM Estado WHERE nome_estado = 'Rio de Janeiro'));

-- Cidades do Rio Grande do Norte
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Natal', (SELECT id_estado FROM Estado WHERE nome_estado = 'Rio Grande do Norte')),
       ('Mossoró', (SELECT id_estado FROM Estado WHERE nome_estado = 'Rio Grande do Norte'));

-- Cidades do Rio Grande do Sul
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Porto Alegre', (SELECT id_estado FROM Estado WHERE nome_estado = 'Rio Grande do Sul')),
       ('Caxias do Sul', (SELECT id_estado FROM Estado WHERE nome_estado = 'Rio Grande do Sul'));

-- Cidades de Rondônia
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Porto Velho', (SELECT id_estado FROM Estado WHERE nome_estado = 'Rondônia')),
       ('Ji-Paraná', (SELECT id_estado FROM Estado WHERE nome_estado = 'Rondônia'));

-- Cidades de Roraima
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Boa Vista', (SELECT id_estado FROM Estado WHERE nome_estado = 'Roraima'));

-- Cidades de Santa Catarina
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Florianópolis', (SELECT id_estado FROM Estado WHERE nome_estado = 'Santa Catarina')),
       ('Joinville', (SELECT id_estado FROM Estado WHERE nome_estado = 'Santa Catarina'));

-- Cidades de São Paulo
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('São Paulo', (SELECT id_estado FROM Estado WHERE nome_estado = 'São Paulo')),
       ('Campinas', (SELECT id_estado FROM Estado WHERE nome_estado = 'São Paulo'));

-- Cidades de Sergipe
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Aracaju', (SELECT id_estado FROM Estado WHERE nome_estado = 'Sergipe')),
       ('Nossa Senhora do Socorro', (SELECT id_estado FROM Estado WHERE nome_estado = 'Sergipe'));

-- Cidades de Tocantins
INSERT INTO Cidade(nome_cidade, id_estado)
VALUES ('Palmas', (SELECT id_estado FROM Estado WHERE nome_estado = 'Tocantins')),
       ('Araguaína', (SELECT id_estado FROM Estado WHERE nome_estado = 'Tocantins'));

-- Inserção de dados na tabela Departamento
INSERT INTO Departamento(nome_departamento, filial_departamento)
VALUES ('DIDES', 'NORTE'),
       ('DIRUR', 'SUL'),
       ('DIMAC', 'NORTE'),
       ('DIMAC', 'SUL'),
       ('DIDES', 'SUL'),
       ('DINTE', 'SUDESTE'),
       ('DISOC', 'SUDESTE'),
       ('DISOC', 'SUDESTE'),
       ('DISOC', 'SUDESTE');

-- Inserção de dados na tabela FonteFinanciadora
INSERT INTO FonteFinanciadora(nome_fonte, valor_investido)
VALUES ('BID - Banco Interamericano de Desenvolvimento', 100000.00),
       ('BNDES - Banco Nacional de Desenvolvimento Econômico e Social', 30000.00),
       ('BID - Banco Interamericano de Desenvolvimento', 100000.00),
       ('BNDES - Banco Nacional de Desenvolvimento Econômico e Social', 200000.00),
       ('BNDES - Banco Nacional de Desenvolvimento Econômico e Social', 50000.00),
       ('BANERJ - Banco do Estado do Rio de Janeiro', 70000.00),
       ('BANESPA - Banco do Estado de São Paulo', 45000.00),
       ('BANESPA - Banco do Estado de São Paulo', 85000.00),
       ('BDMG - Banco de Desenvolvimento de Minas Gerais', 120000.00);


-- Inserção de projetos na tabela Projeto
INSERT INTO Projeto (nome_projeto, valor_projeto, id_fonte, id_departamento)
VALUES ('Acesso a Oportunidades', 15000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BID - Banco Interamericano de Desenvolvimento'
         LIMIT 1),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DIDES'
           AND filial_departamento = 'NORTE'
         LIMIT 1)),

       ('Brasil em Desenvolvimento', 19000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social'
         LIMIT 1),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DIRUR'
           AND filial_departamento = 'SUL'
         LIMIT 1)),

       ('Emprego no Turismo', 35000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BID - Banco Interamericano de Desenvolvimento'
         LIMIT 1),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DIMAC'
           AND filial_departamento = 'NORTE'
         LIMIT 1)),

       ('Mapa das Organizações da Sociedade Civil', 55000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social'
         LIMIT 1),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DIMAC'
           AND filial_departamento = 'SUL'
         LIMIT 1)),

       ('Observatório de Gestão do Conhecimento', 20000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social'
         LIMIT 1),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DIDES'
           AND filial_departamento = 'SUL'
         LIMIT 1)),

       ('Atlas da Violência', 45000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BANERJ - Banco do Estado do Rio de Janeiro'
         LIMIT 1),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DINTE'
           AND filial_departamento = 'SUDESTE'
         LIMIT 1)),

       ('Centro de Pesquisa em Ciência, Tecnologia e Sociedade', 25000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BANESPA - Banco do Estado de São Paulo'
         LIMIT 1),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DISOC'
           AND filial_departamento = 'SUDESTE'
         LIMIT 1)),

       ('Retrato das Desigualdades de Gênero e Raça', 32000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BANESPA - Banco do Estado de São Paulo'
         LIMIT 1),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DISOC'
           AND filial_departamento = 'SUDESTE'
         LIMIT 1)),

       ('Índice de Vulnerabilidade Social', 60000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BDMG - Banco de Desenvolvimento de Minas Gerais'
         LIMIT 1),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DISOC'
           AND filial_departamento = 'SUDESTE'
         LIMIT 1));


-- Inserir Pesquisadores
INSERT INTO Pesquisador (nome_completo, status, id_cidade, id_estado, id_departamento, id_projeto)
VALUES ('Miguel Silva', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Boa Vista' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Roraima' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIDES' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Acesso a Oportunidades' LIMIT 1)),

       ('Arthur Carvalho', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Palmas' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Tocantins' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIMAC' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Emprego no Turismo' LIMIT 1)),

       ('Helena Sousa', 'Inativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Porto Alegre' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Rio Grande do Sul' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIRUR' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Brasil em Desenvolvimento' LIMIT 1)),

       ('Laura Pereira', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Macapa' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Amapá' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIMAC' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Mapa das Organizações da Sociedade Civil' LIMIT 1)),

       ('Gabriel Luz', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Belem' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Pará' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIDES' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Observatório de Gestão do Conhecimento' LIMIT 1)),

       ('Samuel Santos', 'Inativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Palmas' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Tocantins' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIDES' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Acesso a Oportunidades' LIMIT 1)),

       ('Maria Oliveira', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Boa Vista' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Roraima' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIDES' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Acesso a Oportunidades' LIMIT 1)),

       ('Alice Rodrigues', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Florianopolis' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Santa Catarina' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIRUR' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Brasil em Desenvolvimento' LIMIT 1)),

       ('Bernardo Alves', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Porto Velho' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Rondônia' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIMAC' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Mapa das Organizações da Sociedade Civil' LIMIT 1)),

       ('Theo Gomes', 'Inativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Rio Branco' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Acre' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIDES' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Observatório de Gestão do Conhecimento' LIMIT 1)),

       ('Ailton Santos', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Cabo Frio' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Rio de Janeiro' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DINTE' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Atlas da Violência' LIMIT 1)),

       ('Ana Beatriz', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Campinas' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'São Paulo' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DISOC' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Retrato das Desigualdades de Gênero e Raça' LIMIT 1)),

       ('Bruno Gomes', 'Inativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Guarulhos' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'São Paulo' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DISOC' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Retrato das Desigualdades de Gênero e Raça' LIMIT 1)),

       ('Leticia Rodrigues', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'Belo Horizonte' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'Minas Gerais' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DISOC' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Índice de Vulnerabilidade Social' LIMIT 1)),

       ('Vinicius Silva', 'Ativo',
        (SELECT id_cidade FROM Cidade WHERE nome_cidade = 'São Paulo' LIMIT 1),
        (SELECT id_estado FROM Estado WHERE nome_estado = 'São Paulo' LIMIT 1),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DINTE' LIMIT 1),
        (SELECT id_projeto FROM Projeto WHERE nome_projeto = 'Atlas da Violência' LIMIT 1));


-- 1 Liste os projetos e suas fontes financiadoras:
SELECT P.nome_projeto, F.nome_fonte
FROM Projeto P
         JOIN FonteFinanciadora F ON P.id_fonte = F.id_fonte_fornecedora;

-- 2 Liste os projetos gerenciados pelos departamentos:
SELECT P.nome_projeto, D.nome_departamento
FROM Projeto P
         JOIN Departamento D ON P.id_departamento = D.id_departamento;

-- 3 Liste os pesquisadores presentes na filial "NORTE":
SELECT Pes.nome_completo, D.filial_departamento
FROM Pesquisador Pes
         JOIN Departamento D ON Pes.id_departamento = D.id_departamento
WHERE D.filial_departamento = 'NORTE';

-- 4 Liste os pesquisadores presentes na filial "SUL":
SELECT Pes.nome_completo, D.filial_departamento
FROM Pesquisador Pes
         JOIN Departamento D ON Pes.id_departamento = D.id_departamento
WHERE D.filial_departamento = 'SUL';

-- 5 Liste o nome e a cidade dos pesquisadores presentes no projeto "Acesso a Oportunidades"
SELECT Pes.nome_completo, E.nome_cidade, P.nome_projeto
FROM Pesquisador Pes
         JOIN Projeto P ON Pes.id_departamento = P.id_departamento
         JOIN Cidade E ON Pes.id_cidade = E.id_cidade
WHERE P.Nome_Projeto = 'Acesso a Oportunidades';

-- 6 Liste o nome do pesquisador, valor da bolsa, nome do projeto e departamento dos pesquisadores que moram em “Roraima”
SELECT Pes.nome_completo, Pr.valor_projeto, Pr.nome_projeto, D.nome_departamento
FROM Pesquisador Pes
         JOIN Projeto Pr ON Pes.id_departamento = Pr.id_departamento
         JOIN Departamento D ON Pes.id_departamento = D.id_departamento
         JOIN Estado E ON Pes.id_estado = E.id_estado
WHERE E.nome_estado = 'Roraima';

-- 7 Liste todos os pesquisadores (pesquisador, valor da bolsa, nome do projeto, nome do departamento) e sua localização (cidade e estado)
SELECT Pes.nome_completo, Pr.valor_projeto, Pr.nome_projeto, D.nome_departamento, C.nome_cidade, E.nome_estado
FROM Pesquisador Pes
         JOIN Projeto Pr ON Pes.id_departamento = Pr.id_departamento
         JOIN Departamento D ON Pes.id_departamento = D.id_departamento
         JOIN Cidade C on C.id_cidade = Pes.id_cidade
         JOIN Estado E ON Pes.id_estado = E.id_estado;

-- 8 Liste o estado que mais possui pesquisadores
SELECT E.nome_estado, COUNT(*) AS Quantidade_Pesquisadores
FROM Pesquisador Pes
         JOIN Estado E ON Pes.id_estado = E.id_estado
GROUP BY E.id_estado
ORDER BY Quantidade_Pesquisadores DESC
LIMIT 1;

-- 9 Liste todos os projetos (nome do projeto, departamento, filial departamento, fonte financiadora, valor a investir da fonte financiadora e valor do projeto)
SELECT Pr.nome_projeto,
       D.nome_departamento,
       D.filial_departamento,
       F.nome_fonte,
       F.valor_investido,
       Pr.valor_projeto
FROM Projeto Pr
         JOIN Departamento D ON Pr.id_departamento = D.id_departamento
         JOIN FonteFinanciadora F ON Pr.id_fonte = F.id_fonte_fornecedora
ORDER BY F.valor_investido DESC;
