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
SELECT RENTAL.RENT_NUM, RENTAL.RENT_DATE, DETAILRENTAL.VID_NUM, movie.MOVIE_NAME, DETAILRENTAL.DETAIL_DUEDATE, DETAILRENTAL.DETAIL_RETURNDATE
FROM RENTAL
INNER JOIN DETAILRENTAL
ON RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM
INNER JOIN VIDEO
ON DETAILRENTAL.VID_NUM = VIDEO.VID_NUM
INNER JOIN MOVIE
ON VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM
WHERE DETAILRENTAL.DETAIL_DUEDATE < DETAILRENTAL.DETAIL_RETURNDATE
ORDER BY RENTAL.RENT_NUM, MOVIE.MOVIE_NAME;
20
SELECT RENTAL.RENT_NUM, RENTAL.RENT_DATE, DETAILRENTAL.VID_NUM, MOVIE.MOVIE_TITLE, DETAILRENTAL.DETAIL_DUEDATE, DETAILRENTAL.DETAIL_RETURNDATE, DETAILRENTAL.DETAIL_RETURNDATE - DETAILRENTAL.DETAIL_DUEDATE AS 'Days Past Due'
FROM RENTAL
INNER JOIN DETAILRENTAL
ON RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM
INNER JOIN VIDEO
ON DETAILRENTAL.VID_NUM = VIDEO.VID_NUM
INNER JOIN MOVIE
ON VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM
WHERE DETAILRENTAL.DETAIL_DUEDATE < DETAILRENTAL.DETAIL_RETURNDATE
ORDER BY RENTAL.RENT_NUM, MOVIE.MOVIE_TITLE;
21
SELECT RENTAL.RENT_NUM, RENTAL.RENT_DATE, DETAILRENTAL.VID_NUM, MOVIE.MOVIE_NAME, DETAILRENTAL.DETAIL_FEE
FROM RENTAL
INNER JOIN DETAILRENTAL
ON RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM
INNER JOIN VIDEO
ON DETAILRENTAL.VID_NUM = VIDEO.VID_NUM
INNER JOIN MOVIE
ON VIDEO.MOVIE_NUM = MOVIE.MOVIE_NUM
WHERE DETAILRENTAL.DETAIL_DUEDATE >= DETAILRENTAL.DETAIL_RETURNDATE
ORDER BY RENTAL.RENT_NUM, MOVIE.MOVIE_NAME;
22
SELECT MEMBERSHIP.MEM_NUM, MEMBERSHIP.MEM_LNAME, MEMBERSHIP.MEM_FNAME, SUM(DETAILRENTAL.DETAIL_FEE)
FROM MEMBERSHIP
INNER JOIN RENTAL
ON MEMBERSHIP.MEM_NUM = RENTAL.MEM_NUM
INNER JOIN DETAILRENTAL
ON RENTAL.RENT_NUM = DETAILRENTAL.RENT_NUM
GROUP BY MEMBERSHIP.MEM_NUM;
23
select `MOVIE_NUM`,`MOVIE_GENRE`,round(avg(`MOVIE_COST`),2),`MOVIE_COST`,(MOVIE_COST-(avg(`MOVIE_COST`))/avg(`MOVIE_COST`)*100) as 'presents defients'
from movie
group by `MOVIE_NUM`
24
alter table detailrental
add DETAIL_DAYSLATE int(3) null;
25
ALTER TABLE VIDEO
ADD VID_STATUS CHAR(4) NOT NULL DEFAULT 'IN' CHECK(VID_STATUS IN ('IN', 'OUT', 'LOST'));
26
UPDATE VIDEO
SET VID_STATUS = 'OUT'
WHERE VID_NUM IN 
	(SELECT VID_NUM 
		FROM DETAILRENTAL
        WHERE DETAIL_RETURNDATE IS NULL);

27
ALTER TABLE PRICE
ADD PRICE_RENTDAYS INT(2) NOT NULL DEFAULT 3;
28
UPDATE PRICE
SET PRICE_RENTDAYS = 5
WHERE PRICE_CODE IN (1, 3);
29
DROP TRIGGER IF EXISTS trg_late_return;
DELIMITER //
CREATE TRIGGER trg_late_return BEFORE UPDATE 
ON DETAILRENTAL
FOR EACH ROW
BEGIN
	IF (NEW.DETAIL_RETURNDATE IS NULL) THEN 
		SET NEW.DETAIL_DAYSLATE := NULL;
	ELSEIF (NEW.DETAIL_RETURNDATE - NEW.DETAIL_DUEDATE > 0) THEN
		SET NEW.DETAIL_DAYSLATE := NEW.DETAIL_RETURNDATE - NEW.DETAIL_DUEDATE;
	ELSE
		SET NEW.DETAIL_DAYSLATE := 0;
    END IF;
END//
DELIMITER ;

