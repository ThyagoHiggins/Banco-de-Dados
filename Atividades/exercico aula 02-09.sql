create database if not exists academico;
use ACADEMICO;

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
       ('MSI','Informatica','Rubens');

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
       
       select * from aluno where endereco is null;
       select * from disciplina;
       
 # Item 1 
 select nome from aluno;
 
 #item 2 
  select idcurso,nome from curso;
 
 #item 3
  select prontuario from aluno where prontuario <> 123456778;
  
  #item 4
  select nota from boletim where nota > 6;
  
  #item 5 
  insert  into ALUNO
  values ('232323', 'Marcos Santos', 'null', '66666', 'ADS');
	#ao colocar o Null dá erro, devendo deixar o espaço vazio
  insert  into ALUNO
  values ('232323', 'Marcos Santos', ' ', '66666', 'ADS');
  
   #item 6
  select nome  from aluno where nome like 'M%';
  
  #item 7
  insert  into boletim
  values (1,232323,8.5),
(2,23232,7.3);

#item 8 
select nota from boletim where nota>4 and nota<6; 

#item 9
select nome from aluno where nome not like 'M%'; 

#item 10
select nome from aluno where endereco like ' ';

#item 11
select format(avg(nota),1) as 'Média Notas' from boletim;

#item 12
select count(*) as 'Qtde de Alunos' from aluno;

#item 13
select idDisciplina as 'Cód da Disciplina', format(avg(nota),1) as Media from boletim
group by 1
order by 1;

#item14 
select prontuario, format(avg(nota),1) as Media from boletim
group by 1
order by 1;

#item 15
select nota, count(prontuario) from boletim
group by 1
having nota > 6;

#item 16
select iddisciplina, nota as 'média da nota' from boletim
group by 1
having avg(nota) > 6; 

#item 17
select prontuario, nota as 'média da nota' from boletim
group by 1
having avg(nota) > 7; 

#item 18
insert  into ALUNO
  values ('234', 'Ana Maria Braga','Av das Nações Unidas,100 ', '121212', 'Matemática'),
		('12345678', 'Leticia','Rua D. Aguirre,300 ', '123456', 'Matemática') ;
# aponta duplicidade de prontuário
