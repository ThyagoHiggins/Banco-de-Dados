use cadastro;
desc pessoas;
create table if not exists cursos(
nome varchar(30) not null unique, #com unique não vou permitir colocar dois cursos com mesmo nome
descricao text,
carga int unsigned, #vai economizar byte, como também não permite sinais( impede número negativo)
totaulas int,
ano year default '2020'
);

alter table cursos
add column idcurso int first;

alter table cursos
add primary key(idcurso);

alter table pessoas
add column profissao varchar(20) after nome;

desc cursos;

select*from  cursos;

insert into cursos values
('1', 'HTML4','Curso de HTML5','40','37','2014'),
('2', 'Algoritmos','Lógica de Programação','20','15','2014'),
('3', 'Photoshop','Dicas de Photoshop CC','10','8','2014'),
('4', 'PGP','Curso de PHP para iniciantes','40','20','2010'),
('5', 'Jarva','Introdução à Linguagem Java','10','29','2000'),
('6', 'MySQL','Banco de Dados MySQL','30','15','2016'),
('7', 'Word','Curso Completo de Word','40','30','2018'),
('8', 'Sapateado','Danças Ritmicas','40','30','2018'),
('9', 'Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'),
('10', 'Youtuber','Gerar polemica e ganhar inscritos','5','2','2018');

select*from cursos;
#alterar um dado de um linha
update cursos
set nome = 'HTML5'
where idcurso =1;

#alterando vários dados de um linha
update cursos
set nome = 'PHP', ano ='2015'
where idcurso = '4';

#alterando vários dados em um linha e colocando limite para não alterar tabela toda
update cursos
set nome='Java', carga='40', ano = '2015'
where idcurso = '5'
limit 1;

#veja o erro se não limitar caso não coloque ID da coluna:
update cursos
set ano = '2018', carga = '0'
where ano = '2050'
limit 1;

# apagando linhas que não quero
delete from cursos
where idcurso ='10';

delete from cursos
where ano ='2050'
limit 2;

#treino
update cursos
set ano = '2016'
where idcurso = '7';
use cadastro;
select*from pessoas;

