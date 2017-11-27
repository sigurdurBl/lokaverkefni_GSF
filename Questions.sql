3
SELECT MOVIE_NAME, MOVIE_YEAR, MOVIE_COST
FROM movie
WHERE MOVIE_NAME LIKE  "%hope%"
4

SELECT MOVIE_NAME, MOVIE_YEAR,MOVIE_GENRE
FROM movie
WHERE MOVIE_GENRE = "Action"
5
select MOVIE_NUM,MOVIE_NAME,MOVIE_COST
from movie
where MOVIE_COST > 40
6
select MOVIE_NUM,MOVIE_NAME,MOVIE_COST,MOVIE_GENRE
from movie
where MOVIE_COST < 50 and `MOVIE_GENRE` = "Comedy" or `MOVIE_GENRE` = "Action"
order by MOVIE_GENRE
7
SELECT `MOVIE_NUM`, Concat(`MOVIE_NAME` ,`MOVIE_YEAR`,`MOVIE_GENRE`) AS column3
from movie
8
select `MOVIE_GENRE`,count(`PRICE_CODE`)
from movie
group by `MOVIE_GENRE`
order by `PRICE_CODE`
9
select avg(`MOVIE_COST`)
from movie
10
select avg(`MOVIE_COST`) as average_cost
from movie
order by `MOVIE_COST`
11
select  `MOVIE_NAME`,`MOVIE_GENRE`,`PRICE_DESCRIPTION`,`PRICE_RENTFEE`
  from movie join price
    on movie.PRICE_CODE = price.PRICE_CODE
12
select `MOVIE_GENRE`,round(avg(`PRICE_RENTFEE`))
  from movie join price
    on movie.PRICE_CODE = price.PRICE_CODE
group by `MOVIE_GENRE`
order by `PRICE_RENTFEE`
13
select `MOVIE_NAME`,`MOVIE_YEAR`,round(`MOVIE_COST`/PRICE_RENTFEE,2) as breakeven_rentals
from movie join price
 on movie.PRICE_CODE = price.PRICE_CODE
 14
 select `MOVIE_NAME`,`MOVIE_YEAR`
from movie
15
SELECT `MOVIE_NAME`,`MOVIE_YEAR`,`MOVIE_COST`
from movie
where `MOVIE_COST` > 44.99 and `MOVIE_COST` < 49.99
16
SELECT `MOVIE_NAME`,`MOVIE_YEAR`PRICE_DESCRIPTION,PRICE_RENTFEE,`MOVIE_GENRE`
from movie join price
on movie.PRICE_CODE = price.PRICE_CODE 
where `MOVIE_GENRE`="Family" or `MOVIE_GENRE`="Comedy" or`MOVIE_GENRE` ="Drama"
17
select min(`MEM_BALANCE`),max(`MEM_BALANCE`),round(avg(`MEM_BALANCE`))
from membership
18
select  Concat(MEM_FNAME," ",MEM_LNAME),Concat(`MEM_STREET`," ",`MEM_CITY`," ",`MEM_STATE`," ",`MEM_ZIP`)
from membership
19



