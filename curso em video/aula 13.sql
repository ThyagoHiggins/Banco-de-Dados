use cadastro;

select totaulas, count(*) from cursos
group by totaulas
order by totaulas;

select carga, count(nome) from cursos where totaulas = 30
group by carga;


select ano, count(*) from cursos
where totaulas > 30
group by ano
having ano > 2013
order by count(*) desc;

select avg(carga) from cursos;

select carga, count(*) from cursos
where ano > 2015
group by carga
having carga > (select avg(carga) from cursos);


#exercicios
#questão 1
select profissao, count(*) from gafanhotos
group by profissao
order by count(*) desc;

#questão 2
select sexo, count(*) from gafanhotos
where nascimento > '2005-01-01'
group by sexo
order by count(*); 

#questão3
select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(*) > 3
order by nacionalidade;

#questão4
select avg(altura) from gafanhotos;

select altura, count(*), peso from gafanhotos
where peso > 100
group by altura
having altura > (select avg(altura) from gafanhotos);








