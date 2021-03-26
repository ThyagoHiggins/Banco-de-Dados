create database if not exists exercicios19agosto;

create table if not exists cliente(
idcliente int auto_increment not null,
primary key (idcliente),
nome varchar(50),
endereco varchar(200),
sexo enum ('Feminino', 'Masculino'),
cidade varchar(30),
CNPJ varchar(11) unique
);
insert into cliente values
(idcliente,'Bianca','Rua XXX','Feminino', 'São Paulo','123456');
(idcliente,'Arnaldo','Rua ABC','Masculino','654321');
(idcliente,'Pablo','Av.Amora','Homem','','765432');


