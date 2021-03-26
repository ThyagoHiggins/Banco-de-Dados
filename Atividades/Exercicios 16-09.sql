#scrip ativiade aula 5 a ser executado para deenvolvimento da ativiade 5
create database if not exists academico5;
use ACADEMICO5;

create table if not exists curso
(idCurso        char(3)      not null,
 nome           varchar(30)  not null,
 coordenador    Varchar(20)  not null,
 primary key(idCurso));


create table if not exists aluno
(prontuario     char(8)      not null,
 nome           varchar(30)  not null,
 endereco       Varchar(30)  not null,
 RG             char(11)     not null,
 idCurso        char(3)      not null,
 primary key(prontuario),
 foreign key (idCurso) references curso(idCurso));


create table if not exists disciplina
(idDisciplina   integer      not null,
 idCurso        char(3)      not null,
 nomeDis        varchar(30)  not null,
 numCreditos    integer      not null,
 primary key(idDisciplina),
 foreign key (idCurso) references curso(idCurso));

create table if not exists boletim
(idDisciplina   integer      not null,
 prontuario     char(8)      not null,
 nota           decimal(4,2)  not null,
 primary key (idDisciplina,prontuario),
 foreign key(idDisciplina) references disciplina(idDisciplina),
 foreign key(prontuario) references aluno(prontuario));
 
insert into CURSO
values ('ADS', 'Analise de Sistemas','Letícia'),
       ('MSI','Informatica','Rubens'),
	   ('ECA','Engenharia','Adilson'),
       ('GET','Especialização','Cristina');

/* inserir dados na tabela aluno*/
insert into ALUNO
values ('12345678','Maria das Dores','Rua das Flores,100','010101','ADS'),
       ('12345677','Joao do Pulo','Rua das Flores,200','02020202','MSI'),
       ('12345688','Almerinda de Jesus','Rua das Orquideas,500','303030','ADS');

/* inserir dados na tabela disciplina*/
insert into DISCIPLINA
values (1,'ADS','Banco de Dados',5),
       (2,'ADS','Lógica de Programação',5),
       (3,'ADS','Informática',3),
       (4,'ADS','Engenharia de Software',5);

/* inserir dados na tabela boletim*/
insert into BOLETIM
values (1,'12345678',6.0),
       (1,'12345677',8.0),
       (1,'12345688',2.3),
       (2,'12345678',5.0),
       (2,'12345677',10.0),
       (3,'12345688',2.3);
       
#item 1 
alter table curso add dataCurso date;

#item 2 
update curso
set dataCurso = '2008-02-01'
where idcurso ='ADS';

update curso
set dataCurso = '2015-12-10'
where idcurso ='MSI';

update curso
set dataCurso = '2019-03-020'
where idcurso ='ECA';

update curso
set dataCurso = '2017-08-01'
where idcurso ='GET';

# item 3
alter table aluno add dataNasc date;

update aluno
set dataNasc = '1960-10-10'
where prontuario = '12345677';

update aluno
set dataNasc = '1991-05-22'
where prontuario = '12345678';

update aluno
set dataNasc = '1977-04-27'
where prontuario = '12345688';

# item 4

select nome,dataNasc from aluno where year(dataNasc) like 1991;

#item 5

select nome, dataNasc,
truncate(datediff(curdate(),dataNasc)/365,0) as 'idade' from aluno;

#item 6
select*from curso order by dataCurso asc limit 1;

#item 7
select a.prontuario, a.nome, date_format(a.datanasc,'%d/%M/%y') as 'aniversário',
c.nome as 'curso'
from aluno a inner join curso c
on c.idcurso = a.idcurso
group by a.prontuario;

#item 8
select a.prontuario, a.nome, date_format(a.datanasc,'%d/%M/%y') as 'aniversário',
c.nome as 'curso'
from aluno a right join curso c
on c.idCurso = a.idcurso
group by c.nome;

#item 9

select a.prontuario, a.nome, date_format(a.datanasc,'%d/%M/%y') as 'aniversário',
c.nome as 'curso'
from aluno a inner join curso c
on c.idcurso = a.idcurso
group by a.nome like '%j';



#item 11
select d.iddisciplina, d.nomeDis, a.prontuario,nome, truncate(avg(nota),1) as 'média notas'
from disciplina d inner join boletim b inner join aluno a
on d.idDisciplina = b.iddisciplina and a.prontuario = b.prontuario
group by d.idDisciplina;



select*from aluno;