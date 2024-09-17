# Atividade – Constraints

Você foi contratado para criar um banco de dados para uma nova loja de artigos esportivos. A loja precisa gerenciar as informações sobre os produtos e as categorias de produtos. Considere as seguintes informações:

## Categorias de Produtos
- **Roupas Esportivas**
- **Equipamentos de Futebol**
- **Acessórios de Treino**

## Produtos
| Nome             | Preço  | Quantidade em Estoque | Categoria             |
|------------------|--------|-----------------------|-----------------------|
| Camisa de Futebol| 89.90  | 100                   | Equipamentos de Futebol|
| Tênis de Corrida | 299.99 | 50                    | Roupas Esportivas      |
| Faixa de Cabeça  | 25.00  | 200                   | Acessórios de Treino   |

## Descrição da Atividade

Seu trabalho é criar o modelo físico do banco de dados, utilizando **constraints** para garantir a integridade e a consistência dos dados:

- `AUTO_INCREMENT`
- `PRIMARY KEY`
- `NOT NULL`
- `CHECK`
- `FOREIGN KEY`

## Consultas a Serem Realizadas

Após a construção da base de dados, realize as seguintes consultas:

1. Consultar **todos os produtos com suas categorias**;
2. Consultar **todos os produtos de uma categoria específica** (por exemplo, 'Equipamentos de Futebol');
3. Consultar **categorias que têm mais de 50 produtos em estoque**;
4. **Alterar o preço de um produto específico** (por exemplo, 'Tênis de Corrida') para um novo valor (por exemplo, 279.99);
5. **Adicionar uma nova categoria** e **atualizar um produto** para essa nova categoria;
6. **Excluir um produto específico** (por exemplo, 'Faixa de Cabeça').
