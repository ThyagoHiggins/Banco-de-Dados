CREATE DATABASE IF NOT EXISTS projeto_inter;
USE projeto_inter;

#----------------------------------------------------------------------------------
#Criação de Tabelas



CREATE TABLE IF NOT EXISTS ESCOLARIDADE (
idEscolaridade int not null auto_increment,
nome_Escolaridade varchar(45),
primary key (idEscolaridade)
)default charset = utf8mb4; #permite usar qualquer praticamente a tabela ASCII



CREATE TABLE IF NOT EXISTS ACERVO(
idobra int not null auto_increment,
titulo VARCHAR(45),
criador VARCHAR(45),
localCriacao VARCHAR(45),
dataCriacao DATE,
tecnica VARCHAR(45),
curiosidade mediumtext,
primary key (idobra)
);


CREATE TABLE IF NOT EXISTS GRUPO_DOADOR (
idgrupo int not null auto_increment,
nomeCATEGORIA VARCHAR(45),
valorLIMITE DECIMAL(7,2),
primary key (idgrupo)
);


CREATE TABLE IF NOT EXISTS VISITANTE (
idVISITANTE int not null auto_increment,
nome VARCHAR(45),
idade int(3),
celular INT(9),
email VARCHAR(45),
cidade varchar(45),
estado char(2),
escolaridade int,
grupo int, 
pontos INT,
primary key (idVISITANTE),
foreign key(escolaridade) references ESCOLARIDADE(idescolaridade)
ON DELETE CASCADE ON UPDATE CASCADE, 
FOREIGN KEY (grupo) REFERENCES grupo_doador(idgrupo)
ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE IF NOT EXISTS DOACAO (
iddoacao int not null auto_increment,
valor decimal(7,2),
acervo int,
visitante int,
primary key (iddoacao),
FOREIGN KEY (acervo) REFERENCES acervo(idobras)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (visitante) REFERENCES visitante(idVISITANTE)
ON DELETE CASCADE ON UPDATE CASCADE
);

#-----------------------------------------------------------------------------------------------------
#inserindo dados

INSERT INTO ESCOLARIDADE VALUES
(default,'FUNDAMENTAL'),
(default,'MEDIO'),
(default, 'SUPERIOR');

insert into grupo_doador values
(default, 'Estudante', '100'),
(default,'Individual', '200'),
(default, 'Familia', '500'),
(default, 'Cultura', '700'),
(default, 'Incentiva', '1000'),
(default, 'Corporativo','3000');

insert into visitante values
(default,'Joao Carlos','25','11985259632','joao@ig.com.br', 'Tatui','SP','2','2','30'); #metodo utilizado diretamente na interface do banco
								#como pesquisa feita.

insert into acervo values
(default,'Mona Lisa','Vinci, Leonardo da','Italia','1517',' Oleo sobre madeira/sfumato','Mona deve ser entendido como a contração de "Madona", o equivalente italiano de "Senhora" ou "Madame" Lisa');

insert into acervo values
(default, 'A noite estrelada',' Gogh, Van de', 'França ', '1889 ', 'pintura a oleo ', 'Internado voluntariamente após decepar a sua própria orelha durante uma crise psicótica, o pintor escolheu a paisagem vista da janela do quarto do hospício'),
(default, 'Composição número 5 ','Pollock, Jackson ','Estados Unidos ', '1948 ', 'Pintura a oleo em fibra ', ' enquanto pintava, Pollock tinha o hábito de fumar, por isso foi possível encontrar rastros da cinza do cigarro espalhados por toda a tela. ' ),
(default, 'A traição das Imagens ','Magritte, René ','Bélgica ', '1929 ',' Oleo sobre tela', 'A traição das imagens procurava questionar os limites da representação. O trabalho do pintor fomentou uma série de discussões filosóficas ' ),
(default, 'Gótico Americano ','Wood, Grant de ','Estados Unidos ', '1930', 'Oleo sobre tela ', ' Na contramão da cultura europeizante, Wood quis retratar uma realidade tipicamente rural norte americana (o Midwest americano)' ),
(default, ' O beijo','Klimt,Gustav','Austria ', '1908 ', 'Oleao sobre folhas de ouro ', 'a criação do autor e é representada por sinais característicos biológicos e psicológicos do sexo' ),
(default, 'David','Bounarroti, Michelangelo ','Itala', '1504', 'Marmore ', 'Com os seus 4,10 metros o David pesa quase 6 toneladas, como 80 homens adultos. Tudo que o mármore de Carrara pesa, definitivamente.'),
(default, 'Pietá ','Bounarroti, Michelangelo','Italia', '1499', 'Marmore ', 'Michelangelo tinha 23 anos. Em função da pouca idade, muitos não acreditaram que fosse o autor. Assim, por isso teria inscrito o nome na faixa que atravessa o peito de Maria. ' ),
(default, 'O Pensador ','Rodin, Auguste ','França', '1904', 'Escultura em Broze ', 'Rodin originalmente chamou essa figura de “O Poeta” . Este nome suporta a teoria de que a estátua era uma representação de Dante.'),
(default, 'Baile Popular ','Di Cavalcanti ','Brasil', '1972', 'Oleo sobre tela ', 'Na pintura, os traços são modernos exagerados e arrojados, por influencia do expressionismo, do modernismo e do cubismo.'),
(default, 'Abaporu', 'Amaral, Tarsila do', 'Brasil', '1928', 'Oleo sobre tela', 'Nele, as mãos e pés têm um tamanho bem maior que a cabeça. A partir de figuras desproporcionais, a autora buscou relatar a supervalorização do trabalho braçal');

insert into doacao values
(default, '100', '1','1'),
(default, '100', '2','1'),
(default, '100', '3','2'),
(default, '200', '4','2'),
(default, '300', '5','2'),
(default, '100', '6','2'),
(default, '250', '7','3'),
(default, '250', '8','3'),
(default, '50', '9','4'),
(default, '50', '10','4'),
(default, '150', '11','5'),
(default, '150', '1','5'),
(default, '150', '2','5'),
(default, '150', '3','5'),
(default, '50', '4','5'),
(default, '50', '5','5'),
(default, '50', '6','6'),
(default, '50', '7','6');

insert into doacao values
(default, '50', '8','7'),
(default, '50', '9','7'),
(default, '50', '10','7'),
(default, '50', '11','7'),
(default, '250', '1','8'),
(default, '250', '2','8'),
(default, '250', '3','8'),
(default, '250', '4','8'),
(default, '250', '5','8'),
(default, '250', '6','8'),
(default, '250', '7','8'),
(default, '250', '8','8'),
(default, '250', '9','9'),
(default, '250', '10','9'),
(default, '250', '11','9'),
(default, '250', '1','9'),
(default, '250', '2','9'),
(default, '250', '3','9'),
(default, '100', '4','10'),
(default, '100', '5','10'),
(default, '100', '6','10'),
(default, '200', '7','10'),
(default, '50', '8','11'),
(default, '50', '9','11'),
(default, '50', '10','11'),
(default, '50', '11','11'),
(default, '10', '1','12'),
(default, '300', '2','12'),
(default, '500', '3','12'),
(default, '100', '4','12'),
(default, '1000', '5','12'),
(default, '500', '6','12'),
(default, '500', '7','12'),
(default, '150', '8','13'),
(default, '150', '9','13');




#------------------------------------------------------------------------------------------------------------------
#Query 1 - Correção do tipo de dados

#Ao realizar o preenchimento no banco percebemos que erramos ao configurar como date o atributo dada de criação
#considendo que os acervos nos museus em sua maioria são cadastrados somente ano de execução

#esse código acessa o acervo e modifica coluna
alter table acervo
modify column datacriacao year;

#comando para verificar as configurações do atriburto
describe acervo;
#inclusão do dados corretamente
update acervo
set datacriacao = '1506'
where idobra = 1;

#--------------------------------------------------------------------------------------------------------

#Query 2
#Pegamos três tabelas visitante, escolaridade e nome da catergoria e fazemos um relatório em que mostra
#a categoria e escolaridade dos visitantes.
select v.nome,g.nomecategoria, e.nome_escolaridade
from visitante v  left join grupo_doador g
on g.idgrupo = v.grupo
join escolaridade e
on e.idEscolaridade = v.escolaridade
order by v.nome,e.nome_escolaridade;

#--------------------------------------------------------------------------------------------------------
#Query 3
#Relatório no total de pessoas cadastradas por cada escolaridade
select e.nome_escolaridade as Escolaridade, count(*) as 'Total por Escolaridade'
from visitante v join escolaridade e
on e.idescolaridade = v.escolaridade
group by nome_escolaridade
order by count(*);

#------------------------------------------------------------------------------------------------------
# Query 4
# Saber quais valores foram doados e a quantidade que se repetiu o valor
select valor as 'Valores Doados', count(*) as 'qtd de doacao do Valor' from doacao
group by valor;

#------------------------------------------------------------------------------------------------------
#Query 5 
#Levanta quanto foi doado por visitante até o momento
select v.nome, sum(d.valor) as 'Valor Total Doado' 
from doacao d join visitante v
on d.visitante = v.idvisitante
group by v.nome;

#------------------------------------------------------------------------------------------------------
#Query 6
#Lista de pessoas que doaram um total acima da média de doações
select format(avg(valor),2) as 'Media de Doações' from doacao;

select v.nome, sum(d.valor) as 'Visitantes com doação acima da média' 
from doacao d join visitante v
on d.visitante = v.idvisitante
group by v.nome
having sum(d.valor) > (select format(avg(valor),2) from doacao);

#------------------------------------------------------------------------------------------------------
#Query 7
#Levantamento de quantidades de obras por pais
select localcriacao as Pais, count(*) as 'Qtde por pais' from acervo
group by localcriacao
order by localcriacao;

#------------------------------------------------------------------------------------------------------
# Query 8
#Pesquisa de obra e autor antes seculo 20
select titulo,criador,datacriacao from acervo 
where datacriacao < '1901'; 

#------------------------------------------------------------------------------------------------------
# Query 8
#Pesquisa nomes que tenha Silva e Oliveira em alguma posição no nome

select nome from visitante
where nome like '%Silva%';

select nome from visitante
where nome like '%Oliveira%';

#------------------------------------------------------------------------------------------------------
# Query 9

select a.titulo, sum(d.valor) as 'Valor total de Doacao recebida'
from acervo a join doacao d
on a.idobra = d.acervo
group by a.titulo
order by sum(d.valor) desc;

#------------------------------------------------------------------------------------------------------
# Query 10

select v.nome, max(d.valor) as 'Maior Doação'
from doacao d join visitante v
on v.idvisitante  = d.visitante;

#------------------------------------------------------------------------------------------------------
# Query 11
#Buscar de titulos e data de criação dentro de um intervalo indicado
select titulo, datacriacao  from acervo
where datacriacao between  1900 and 2000
order by datacriacao desc, titulo asc;

#------------------------------------------------------------------------------------------------------
#Query 12
#Busca dos visitantes que já podem mudar de categoria por ter passado os limites de categoria.
select v.nome, sum(d.valor) as 'Valor Total Doado', g.nomecategoria, g.valorlimite
from visitante v left join grupo_doador g
on g.idgrupo = v.grupo
join doacao d 
on v.idvisitante = d.visitante
group by v.nome
having sum(d.valor) > valorlimite;

