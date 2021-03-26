#scrip ativiade aula 4 a ser executado para deenvolvimento da ativiade 4
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
       
       select * from aluno where endereco is null;
       select * from disciplina;
       
       #item 1 
       select a.*, c.nome
       from aluno a inner join curso c
       on a.idcurso = c.idcurso;
       
       #item 2
       select a.prontuario, a.nome, d.nomeDis
       from aluno a inner join disciplina d
       on a.idcurso = d.idcurso;
       
       #item 3 
	   select a.prontuario, a.nome, d.nomeDis
       from aluno a inner join disciplina d
       on a.idcurso = d.idcurso
       order by d.nomeDis;
	  
      #item 4
       select c.nome, d.nomeDis
       from curso c inner join disciplina d
       on c.idcurso = d.idcurso
       order by c.nome;
       
       #item 5 
       select c.nome, d.nomeDis
       from curso c left join disciplina d
       on c.idcurso = d.idcurso
       order by c.nome;
       
       #item 6 
       select a.prontuario, a.nome, b.idDisciplina, b.nota
       from aluno a inner join boletim b
       on a.prontuario = b.prontuario;
       
       #item 7 
       select a.prontuario, a.nome,b.idDisciplina, b.nota
       from aluno a inner join boletim b
       on a.prontuario = b.prontuario
       where b.nota > 6;
       
       #item 8 
       select a.prontuario, a.nome,b.idDisciplina, b.nota
       from aluno a inner join boletim b
       on a.prontuario = b.prontuario
       where a.nome like 'M%';
       