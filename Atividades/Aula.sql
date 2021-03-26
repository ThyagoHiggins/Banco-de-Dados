/*Criar banco de dados*/
create database if not exists aula19agosto;
use aula19agosto;
/*para mostrar os bancos existentes*/
show databases;
/*criar tabela*/

create table if not exists fornecedor(
idfornecedor int auto_increment not null,
nome varchar(45) not null,
endereco varchar(45),
telefone int,
cidade varchar(20) default	'São Paulo',
email varchar(25) unique,
primary key (idfornecedor)
);

create table if not exists produto(
idproduto int auto_increment not null,
descrição varchar(45),
preco decimal(7,2),
unidade varchar(10),
idfornecedor int not null,
primary key(idproduto),
foreign key(idfornecedor) references fornecedor(idfornecedor)
);
show tables;
/*inserir dados na tabela*/
insert into fornecedor values
(1,'Papel Reciclado', 'Rua Brasil,1000',4441212,'Bragança Paulista','reci@gmail.com');

insert into fornecedor values
(idfornecedor,'Casa Bahia', 'Rua do Mercado,200', 40338787, 'Bragança Paulista', 'casabahia@gmail.com'),
(idfornecedor,'Loja Cem', 'Rua do Comércio,9000', 40334455, 'Bragança Paulista', 'lojacem@gmail.com'),
(idfornecedor,'Magazine Luiza', 'Rua Antonio Pires Pimentel,500', 40331212, 'Bragança Paulista', 'luiza@gmail.com');

select * from fornecedor;

insert into produto values
(100,'fogão','800.50','pc',2),
(110,'Geladeira','2000.70','pc',2),
(150,'Fogão CookTop','1300.40','pc',3),
(160,'Ar Condicionado','1800','pc',4);

select * from produto;
