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
         WHERE nome_fonte = 'BID - Banco Interamericano de Desenvolvimento'),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIDES' AND filial_departamento = 'NORTE')),

       ('Brasil em Desenvolvimento', 19000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social'),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIRUR' AND filial_departamento = 'SUL')),

       ('Emprego no Turismo', 35000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BID - Banco Interamericano de Desenvolvimento'),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIMAC' AND filial_departamento = 'NORTE')),

       ('Mapa das Organizações da Sociedade Civil', 55000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social'),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIMAC' AND filial_departamento = 'SUL')),

       ('Observatório de Gestão do Conhecimento', 20000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BNDES - Banco Nacional de Desenvolvimento Econômico e Social'),
        (SELECT id_departamento FROM Departamento WHERE nome_departamento = 'DIDES' AND filial_departamento = 'SUL')),

       ('Atlas da Violência', 45000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BANERJ - Banco do Estado do Rio de Janeiro'),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DINTE' AND filial_departamento = 'SUDESTE')),

       ('Centro de Pesquisa em Ciência, Tecnologia e Sociedade', 25000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BANESPA - Banco do Estado de São Paulo'),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DISOC' AND filial_departamento = 'SUDESTE')),

       ('Retrato das Desigualdades de Gênero e Raça', 32000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BANESPA - Banco do Estado de São Paulo'),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DISOC' AND filial_departamento = 'SUDESTE')),

       ('Índice de Vulnerabilidade Social', 60000.00,
        (SELECT id_fonte_fornecedora
         FROM FonteFinanciadora
         WHERE nome_fonte = 'BDMG - Banco de Desenvolvimento de Minas Gerais'),
        (SELECT id_departamento
         FROM Departamento
         WHERE nome_departamento = 'DISOC' AND filial_departamento = 'SUDESTE'));
