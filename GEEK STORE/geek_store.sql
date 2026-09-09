PRAGMA foreign_keys = ON


--Cliente

CREATE TABLE IF NOT EXISTS cliente (

    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    nivel TEXT,
    descolto REAL,
);

--Conta do Cliente

CREATE Table IF NOT EXISTS conta_cleinte (

    id_conta INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL UNIQUE,
    nome TEXT NOT NULL,
    nivel_fidelidade TEXT,
    email TEXT NOT NULL UNIQUE,
    senha TEXT NOT NULL,
    data_criacao TEXT NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

--Endereço

CREATE TABLE IF NOT EXISTS endereco (

    id_endereco INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    rua TEXT NOT NULL,
    numero TEXT NOT NULL,
    cidade TEXT NOT NULL,
    estado TEXT NOT NULL,
    cep TEXT NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);

--Vendedor

CREATE Table if NOT EXISTS vendedor (

    id_vendedor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    carga_horaria INTEGER,
    salario REAL,
);

--Categoria

CREATE TABLE if NOT EXISTS categoria (

    id_categoria INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    descricao TEXT,
);

--Produto

CREATE Table IF NOT EXISTS produto (

    id_produto INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco REAL NOT NULL,
    id_categoria INTEGER NOT NULL,

    FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria)
);

--Venda

CREATE TABLE if NOT EXISTS venda (

    id_venda INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    id_vendedor INTEGER NOT NULL,
    data_venda TEXT NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),

    Foreign Key (id_vendedor) REFERENCES vendedor (id_vendedor)
);

--Item Da Venda (Relacionamento N:N entre Venda e Produto)

CREATE Table if NOT EXISTS item_venda (

    id_venda INTEGER NO NULL,
    id_produto INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,

    PRIMARY KEY (id_venda, id_produto),

    PRIMARY KEY (id_venda) REFERENCES venda(id_venda),

    PRIMARY KEY (id_produto) REFERENCES produto(id_produto)
);

--Pagamento 

CREATE TABLE if NOT EXISTS pagamento (

    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    id_venda INTEGER NOT NULL UNIQUE,
    forma_de_pagamento TEXT NOT NULL,
    valor REAL NOT NULL,
    data_pagamento TEXT NOT NULL,
    status TEXT NOT NULL,

    FOREIGN KEY (id_venda) REFERENCES venda (id_venda)
);

--Avaliação

CREATE TABLE if NOT EXISTS avaliacao (

    id_avaliacao INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER NOT NULL,
    id_produto INTEGER NOT NULL,
    nota INTEGER NOT NULL,
    comentario TEXT,
    data_avaliacao TEXT NOT NULL,

    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),

    FOREIGN KEY (id_produto) REFERENCES produto (id_produto)
);

--Dados

INSERT INTO cliente (nome, nivel_fidelidade, desoconto) VALUES
('Pedro', 'Ouro', 10.0),
('Italo', 'Prata', 5.0),
('Levi', 'Bronze', 2.0);

--Contas dos Clientes 

INSERT INTO conta_cliente (id_cliente, nome, nivel_fidelidade, email, senha, data_criacao)
VALUES 
(1, 'Pedro', 'ouro', 'pedro@gmail.com', 'senha123', '01/09/2026'),
(2, 'Italo', 'prata', 'italo@gmail.com', 'senha456', '13/10/2026'),
(3, 'Levi', 'bronze', 'levi@gmail.com', 'senha789', '22/11/2026');

--Enderecos 

INSERT INTO endereco (id_cliente, rua, estado, cep);
VALUES
(1, 'Rua Grande', 'Fortim', 'CE', '62800-000'),
(2, 'Rodoviaria', 'Fortim', 'CE', '78900-000'),
(1, 'Cabreiro', 'Aracati', 'CE', '98400-000');

--Vendedores

INSERT INTO vendedor (nome, carga_horaria, salario) VALUES
('João', 40, 2000.00),
('Maria', 30, 1500.00),
('Carlos', 20, 1000.00);

--Categorias

INSERT INTO categoria (nome, preco, id_categoria) 
VALUES
('Camisa One Piece', 79.90, 1),
('Canena Fira Force', 39.90, 2),
('Cartas raras de Pokemon TCG 1999', 999.90, 3),
('Action Figure Joker Persona 5 Royal', 299,90, 4),
('HQ a ultima caçada de Kraven', 59.90, 4);

--Vendas 

INSERT INTO venda (id_cliente, id_vendedor, data_venda)
VALUES
(1, 1, '01/09/2026'),
(2, 2, '13/10/2026'),
(3, 1, '22/11/2026');

--Itens das vendas

INSERT INTO item_venda (id_venda, id_produto, quantidade)
VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 1),
(2, 5, 2),
(3, 4, 1);

--Pagamentos

INSERT INTO pagamento (id_venda, forma_de_pagamento, valor, data_pagamento, status)
VALUES
(1, 'Pix', 199.70, '01/09/2026', 'Pago'),
(2, 'Cartao', 1119.70, '13/10/2026', 'Pago'),
(3, 'Pix', 299.90, '22/11/2026', 'Pago');

--Avaliações 

INSERT INTO avaliacao (id_cliente, id_produto, nota, comentario, data_avaliacao)
VALUES
(1, 1, 5, 'Produto excelente', '02/09/2026'),
(2, 3, 5, 'Produto muito bom', '14/10/2026'),
(3, 4, 4, 'Gostei bastante', '23/11/2026');

-- Mostrar clientes
SELECT * FROM cliente;


-- Mostrar produtos
SELECT * FROM produto;


-- Mostrar categorias
SELECT * FROM categoria;


-- Mostrar vendas
SELECT * FROM venda;


-- Mostrar itens das vendas
SELECT * FROM item_venda;


-- Mostrar pagamentos
SELECT * FROM pagamento;

SELECT
    cliente.nome AS cliente,
    venda.id_venda,
    venda.data_venda
FROM cliente
JOIN venda
    ON cliente.id_cliente = venda.id_cliente;

SELECT
    venda.id_venda,
    cliente.nome AS cliente,
    vendedor.nome AS vendedor,
    venda.data_venda
FROM venda
JOIN cliente
    ON venda.id_cliente = cliente.id_cliente
JOIN vendedor
    ON venda.id_vendedor = vendedor.id_vendedor;

SELECT
    produto.nome AS produto,
    produto.preco,
    categoria.nome AS categoria
FROM produto
JOIN categoria
    ON produto.id_categoria = categoria.id_categoria;

SELECT
    venda.id_venda,
    produto.nome AS produto,
    item_venda.quantidade,
    produto.preco
FROM item_venda
JOIN venda
    ON item_venda.id_venda = venda.id_venda
JOIN produto
    ON item_venda.id_produto = produto.id_produto;

SELECT
    cliente.nome AS cliente,
    produto.nome AS produto,
    avaliacao.nota,
    avaliacao.comentario
FROM avaliacao
JOIN cliente
    ON avaliacao.id_cliente = cliente.id_cliente
JOIN produto
    ON avaliacao.id_produto = produto.id_produto;

SELECT
    categoria.nome AS categoria,
    COUNT(produto.id_produto) AS quantidade_produtos
FROM categoria
JOIN produto
    ON categoria.id_categoria = produto.id_categoria
GROUP BY categoria.id_categoria, categoria.nome
ORDER BY quantidade_produtos DESC;