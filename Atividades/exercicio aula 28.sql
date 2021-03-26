CREATE DATABASE exercicio26Agosto2;
use exercicio26Agosto2;

CREATE TABLE IF NOT EXISTS FORNECEDOR (
IDFORNECEDOR INT  auto_increment NOT NULL,
NOME VARCHAR(45),
ENDERECO VARCHAR(45),
TELEFONE INT,
CIDADE VARCHAR(20) DEFAULT 'SÃO PAULO',
EMAIL VARCHAR(25) UNIQUE,
PRIMARY KEY (IDFORNECEDOR)
);

CREATE TABLE IF NOT EXISTS FAMILIA (
IDFAMILIA INT NOT NULL,
DESCRICAO VARCHAR(45)
);

CREATE TABLE IF NOT EXISTS PRODUTO (
IDPRODUTO INT NOT NULL,
DESCRICAO VARCHAR(45),
PRECO DECIMAL(7,2),
UNIDADE VARCHAR(10),
IDFORNECEDOR INT NOT NULL,
IDFAMILIA INT NOT NULL,
QTDE INT,
PRIMARY KEY (IDPRODUTO),
foreign key (IDFORNECEDOR) references FORNECEDOR(IDFORNECEDOR),
foreign key (IDFAMILIA) references FAMILIA (IDFAMILIA)
);

insert into fornecedor values
(1,'Papel Reciclado', 'Rua Brasil,1000',4441212,'Bragança Paulista','reci@gmail.com');
insert into fornecedor values
(idfornecedor,'Casa Bahia', 'Rua do Mercado,200', 40338787, 'Bragança Paulista', 'casabahia@gmail.com'),
(idfornecedor,'Loja Cem', 'Rua do Comércio,9000', 40334455, 'Bragança Paulista', 'lojacem@gmail.com'),
(idfornecedor,'Magazine Luiza', 'Rua Antonio Pires Pimentel,500', 40331212, 'Bragança Paulista', 'luiza@gmail.com');

insert into produto values
(100,'fogão','800.50','pc',2),
(110,'Geladeira','2000.70','pc',2),
(150,'Fogão CookTop','1300.40','pc',3),
(160,'Ar Condicionado','1800','pc',4),
(161,'notebook','3400','pc',2),
(170,'Impressora','2800','pc',2),
(180,'Aspirador de po','256','pc',1),
(181,'Tv','3800','pc',1),
(190,'Tv','3900','pc',2);

