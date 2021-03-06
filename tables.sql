create DATABASE 1010992109_gsf_lokaverkefni

create table membership(
	MEM_NUM INT PRIMARY KEY,
	MEM_FNAME VARCHAR(50),
	MEM_LNAME VARCHAR(50),
	MEM_STREET VARCHAR(40),
	MEM_CITY VARCHAR(30),
	MEM_STATE CHAR(2),
	MEM_ZIP INTEGER(5),
	MEM_BALANCE INTEGER
);


create table Rental(
	RENT_NUM INT PRIMARY KEY,
	RENT_DATE DATE,
	MEM_NUM INT,
	FOREIGN KEY (MEM_NUM) REFERENCES membership(MEM_NUM)

);


create table detailrental(
	RENT_NUM INT,
	VID_NUM INT,
	DETAIL_FEE DECIMAL(2,1),
	DETAIL_DUEDATE DATE,
	DETAIL_RETURNDATE DATE,
	DETAIL_DALYLATEFEE int(1),
	FOREIGN KEY (RENT_NUM) REFERENCES Rental(RENT_NUM),
	FOREIGN KEY (VID_NUM) REFERENCES video(VID_NUM)
	
);

create table video(
	VID_NUM INT PRIMARY KEY,
	VID_INDATE DATE,
	MOVIE_NUM INT,
	FOREIGN KEY (MOVIE_NUM) REFERENCES movie(MOVIE_NUM)
);



create table movie(
	MOVIE_NUM INT PRIMARY KEY,
	MOVIE_NAME VARCHAR(50),
	MOVIE_YEAR varchar(10),
	MOVIE_COST DECIMAL(4,2),
	MOVIE_GENRE VARCHAR(10),
	PRICE_CODE INT
	FOREIGN KEY (PRICE_CODE) REFERENCES price(PRICE_CODE)
);
	

	
create table price(
	PRICE_CODE INT PRIMARY KEY
	PRICE_DESCRIPTION VARCHAR(25)
	PRICE_RENTFEE DECIMAL(2,1),
	PRICE_DAILYATEFEE DECIMAL(2,1)
	

	



);