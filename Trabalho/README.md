# Descrição do Projeto

Para este projeto, considere que a sua equipe foi contratada pela **empresa XPTO-Pesquisas** para desenvolver um banco de dados para o registro de pesquisadores e projetos de pesquisa. A empresa tem por finalidade realizar pesquisas e estudos sociais e econômicos, além de dar apoio técnico e institucional ao Estado brasileiro na avaliação, formulação e acompanhamento de políticas públicas e programas de desenvolvimento.

## Requisitos para a Construção do Modelo de Dados

- **Cadastro de Pesquisadores e Projetos:** 
  - Cada pesquisador pode participar de apenas um projeto.
  - Um projeto pode ter vários pesquisadores e ser financiado por uma fonte específica.

- **Cadastro do Pesquisador:**
  - Inclui dados pessoais como **nome completo** e **status**.
  - Informações de localização: **cidade** e **estado**.
  - Cada pesquisador deve estar vinculado a um único endereço registrado no sistema, que deve conter uma lista completa de todas as cidades e estados do Brasil para permitir novos cadastros.
  - O pesquisador precisa estar vinculado a um único departamento da empresa XPTO-Pesquisas, que pode gerenciar vários projetos.

- **Entradas de Dados:**
  - As entradas de dados a serem utilizadas estão no arquivo anexado (Laboratório de Banco de dados - N1-AT2.xlsx). Você deverá preencher os dados conforme o arquivo.

## Consultas SQL a Realizar

Após o cadastro dos dados, realize as seguintes consultas SQL:

1. Liste os projetos e suas fontes financiadoras, incluindo o nome do projeto e o nome da fonte financiadora.
2. Liste os projetos gerenciados pelos departamentos, incluindo o nome do projeto e o nome do departamento.
3. Liste os pesquisadores presentes na filial **"NORTE"**, incluindo o nome do pesquisador e a filial do departamento.
4. Liste os pesquisadores presentes na filial **"SUL"**, incluindo o nome do pesquisador e a filial do departamento.
5. Liste o nome e a cidade dos pesquisadores presentes no projeto **"Acesso a Oportunidades"**, incluindo o nome do pesquisador, a cidade e o nome do projeto.
6. Liste o nome do pesquisador, valor da bolsa, nome do projeto e departamento dos pesquisadores que moram em **“Roraima”**.
7. Liste todos os pesquisadores (pesquisador, valor da bolsa, nome do projeto, nome do departamento) e sua localização (cidade e estado).
8. Liste o estado que mais possui pesquisadores, apresentando a quantidade de pesquisadores.
9. Liste todos os projetos (nome do projeto, departamento, filial departamento, fonte financiadora, valor a investir da fonte financiadora e valor do projeto), considerando a ordem de maior valor a ser investido.

## Resultados Esperados da Equipe

A equipe deverá produzir os seguintes resultados:

- Desenvolver o **modelo conceitual**, **modelo lógico** e **modelo físico** para o projeto em questão.
- Utilizar a **linguagem SQL** para construir o modelo físico e definir as consultas ao banco de dados.
- Disponibilizar o **script desenvolvido** para fins de testes e validação.
- Fazer o uso de **Constraints**:
  - Definir o **status padrão** como **“Ativo”**.
  - Definir quais campos serão **obrigatórios**.
  - Impedir que sejam cadastrados **valores negativos**.
- Defender o modelo construído perante o **professor avaliador**:
  - **Tempo:** até 10 minutos.
