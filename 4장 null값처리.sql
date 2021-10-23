create table mybook (
bookid INTEGER,
price integer,
primary key(bookid)
);
insert into mybook values
	(1, 10000), (2, 20000), (3,null);
select * from mybook;
    
select price+100 from mybook;
select sum(price), avg(price), count(*), count(price) from mybook;
select sum(price), avg(price), count(*) from mybook where bookid >=4;
