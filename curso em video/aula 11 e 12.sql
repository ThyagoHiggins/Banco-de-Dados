use cadastro;

#comando para ordenar com mais de um parametro
select ano, nome, carga from cursos
order by ano,nome;

#comando para selecionar por linha
select * from cursos
where ano ='2016'
order by nome;
# outra forma
select nome, carga from cursos
where ano ='2016'
order by nome;

#outra forma no where posso usar todos os parametros logicos ( <, >, !
select nome, carga from cursos
where ano <= 2015
order by nome;

#aqui indico que quero ver em um determinado intervalo
select nome, ano from cursos
where ano between  2014 and 2016
order by ano desc, nome asc;

#aqui indico explicito aqueles que quero ver
select nome, descricao, ano from cursos
where ano in (2014,2016,2020)
order by ano, nome;

#podemos usar and ou or de acordo com nossa lógica
select*from cursos
where carga > 35 and totaulas <30;

#podemos colocar o % antes ou depois
select*from cursos
where nome like 'P%';

select*from cursos
where nome not like '%A%';

select*from cursos
where nome like 'ph%p%';

select*from cursos
where nome like 'ph%p_';

select * from gafanhotos
where nome like '%silva';

#comando para saber quantos são de "algo" / tira os dados iguais na pesquisa
select distinct nacionalidade from gafanhotos
order by nacionalidade;

# soma quanto tem sobre algo
select count(*)  from cursos where ano = 2020;

#maior valor entre os dados
select max(carga) from cursos;
select max(totaulas) from cursos where ano ='2016';

#somar
select sum(totaulas) from cursos where ano = '2016';

#media
select avg(totaulas) from cursos where ano ='2016';

select *from cursos;

#exercicios
#questão 1 - Selecionar todas gafanhotas
select * from gafanhotos where sexo = 'F';

#questão2 - Selecionar dados entre datas 
select*from gafanhotos
where nascimento between '2000-01-01' and '2015-12-31'
order by nome;

#questão 3 - todos programadores
select*from gafanhotos 
where profissao like 'programador%' and sexo ='M';

#questão 4 - 
select * from gafanhotos
where  nome like 'J%' and nacionalidade like 'Brasil'
order by nome;

#questão 5
select nome, nacionalidade, peso from gafanhotos
where nome like '%Silva' and nacionalidade != 'Brasil' and peso < '100';

#questão 6 
select max(altura) from gafanhotos
where sexo = 'M' and nacionalidade ='Brasil';

#questão 7 
select avg(peso) from gafanhotos;

#questão 8 
select min(peso) from gafanhotos
where sexo ='F' and nacionalidade != 'Brasil' and nascimento between '1990-01-01' and '2000-12-31';

#questão 9
select count(id) from gafanhotos
where sexo ='F' and altura > '1.90';