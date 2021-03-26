create database cadastro
default character set utf8mb4
default collate utf8mb4_general_ci;

create table pessoas(
id int not null auto_increment,
nome varchar(30) not null,
nascimento date,
sexo enum('F', 'M'),
peso decimal(5,2),
altura decimal(3,2),
nacionalidade varchar(20) default 'Brasil',
primary key(id)
)default charset = utf8mb4;


insert into pessoas
(nome, nascimento, sexo, peso, altura, nacionalidade)
values 
('Maria', '1999-12-30','f', '55.2', '1.65', 'Portugal');
select*from pessoas;

# com id 
insert into pessoas
(id,nome, nascimento, sexo, peso, altura, nacionalidade)
values 
(default,'Creuza', '1920-12-30','f', '50.2', '1.65', Default);

#Valores na mesma seguencia das linhas e com mais de um dado
insert into pessoas values
(default, 'Adalgiza', '1930-11-2','F','63.2','1.75','Irlanda'),
(default, 'Ana', '1975-12-22','F','52.3','1.45','EUA'),
(default, 'Pedro', '2000-07-15','M','52.3','1.45','Brasil'),
(default, 'Maria', '1999-05-30','F','75.9','1.70','Portugal');

select*from pessoas;