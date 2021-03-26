#manipulação de datas

select now();
select curdate();
select utc_timestamp;
select day(curdate());
select moth(curadate());
select year(now());
select adddate(now(), interval 24 day);
select adddate(now(), interval 60 day);
select datediff(curdate(), '2009-12-21');

select datediff(curdate(), '2020-12-31');