INSERT INTO membership(MEM_NUM,MEM_FNAME,MEM_LNAME,MEM_STREET,MEM_CITY,MEM_ZIP,MEM_BALANCE)

VALUES
(102,"Tami","Dawson","2632 Takli Circle","Norene","TN",37136,11)
(103,"Curt","Knight","4025 Cornell Court","Flatgap","KY",41219,6)
(104,"Jamal","Melendez","788 East 145th Avenue","Quebeck",38579,0)
(105,"Iva","Mcclain","6045 Musket Ball Circle","Summit","KY",42783,15)
(106,"Miranda","Parks","4469 Maxwell Place","germantown","TN",38183,0)
(107,"Rosario","Elliott","7578 Danner Avenue","Columbia","TN",38402,5)
(108,"Mattie","Guy","4390 Evergreen Street","Lily","KY",40740,0)
(109,"Clint","Ochoa","1711 Elm Street","Greenville","TN",37745,10)
(110,"Lewis","Rosales","4524 Southwind Circle","TN",38326,0)
(111,"Stacy","Mann","2789 East Cook Avenue","Murfreeboro","TN",37132,8)
(112,"Luis","Trujillo","7267 Melvin Avenue","Heiskell","TN",37754,3)
(113,"Minnie","Gonzales","6430 Vasili Drive","Williston","TN",38076,0)




insert into rental(RENT_NUM,RENT_DATE,MEM_NUM)

VALUES
(1001,"09-03-01",103)
(1002,"09-03-01",105)
(1003,"09-03-02",102)
(1004,"09-03-02",110)
(1005,"09-03-02",111)
(1006,"09-03-02",107)
(1007,"09-03-02",104)
(1008,"09-03-03",105)
(1009,"09-03-03",111)


insert into detailrental(RENT_NUM,VID_NUM,DETAIL_FEE,DETAIL_DUEDATE,DETAIL_RETURNDATE,DETAIL_DALYLATEFEE)

values
(1001,34342,2,"09-03-04","09-03-02",1)
(1001,61353,2,"09-03-04","09-03-03",1)
(1002,59237,3.5,"09-03-04","09-03-04",3)
(1003,54325,3.5,"09-03-04","09-03-09",3)
(1003,61369,2,"09-03-06","09-03-09",1)
(1003,61388,0,"09-03-06","09-03-09",1)
(1004,44392,3.5,"09-03-05","09-03-07",3)
(1004,34367,3.5,"09-03-05","09-03-07",3)
(1004,34341,2,"09-03-07","09-03-07",1)
(1005,34342,2,"09-03-07","09-03-07",1)
(1005,44397,3.5,"09-03-05","09-03-05",3)
(1006,34366,2,"09-03-05","09-03-04",3)
(1006,61367,2,"09-03-07","",1)
(1007,34368,3.5,"09-03-05","",3)
(1008,34369,3.5,"09-03-05","09-03-05",3)
(1009,54324,3.5,"09-03-05","",3)
(1001,34366,3.5,"09-03-04",3)



insert into video(VID_NUM,VID_INDATE,MOVIE_NUM)

VALUES
(54321,"08-06-18",1234)
(54324,"08-06-18",1234)
(54325,"08-06-18",1234)
(34341,"07-01-22",1235)
(34342,"07-01-22",1235)
(34366,"09-03-02",1236)
(34367,"09-03-02",1236)
(34368,"09-03-02",1236)
(34369,"09-03-02",1236)
(44392,"08-10-21",1237)
(44397,"08-10-21",1237)
(59237,"09-02-14",1237)
(61388,"07-01-25",1239)
(61353,"06-01-28",1245)
(61254,"06-01-28",1245)
(61367,"08-05-30",1246)
(61369,"08-05-30",1246)





INSERT INTO movie(MOVIE_NUM,MOVIE_NAME,MOVIE_COST,MOVIE_GENRE,PRICE_CODE)

VALUES
(1234,"The Cesar Family Christmas","2007",39.95,"Family",2)
(1235,"Smokey Mountain Wildlife","2004",59.95,"Action",1)
(1236,"Richard Goodhope","2008",59.95,"Drama",2)
(1237,"Beatnik Fever","2007",29.95,"Comedy",2)
(1238,"Constant Companion","2008",89.95,"Drama",2)
(1239,"Where Hope Dies","1998",25.49,"Drama",3)
(1245,"Time to Burn","2005",45.49,"Action",1)
(1246,"What He Dosent Know","2006",58.29,"Comedy",1)




insert into price(PRICE_CODE,PRICE_RENTFEE,PRICE_DAILYATEFEE)

VALUES
(1,"Standard",2,1)
(2,"New Release",3.5,3)
(3,"Discount",1.5,1)
(4,"Weekly Special",1,.5)
	