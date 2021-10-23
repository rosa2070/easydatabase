select abs(-15);
select ceil(15.7);
select cos(3.14159);
select floor(15.7);
select log(10, 100);
select mod(11, 4);
select power(3,2);
select round(15.7);
select sign(-15);
select char(67 using utf8);
select concat('happy', 'birthday');
select Lower('birthday');
select lpad('page 1', 15, '*');
select replace('jack', 'j', 'bl');
select rpad('page 1', '15', '*');
select substr('ABCDEFG', 3, 4);
select trim(leading 0 from '00AA00');
select upper('Birthday');
select ascii('A');
select length('birthday');
select adddate('2019-02-14', interval 10 day);
select last_day(sysdate());
select now();
select date_format(sysdate(), '%Y');
select concat(123);
select str_to_date('12 05 2014', '%d %m %Y');
select cast('12.3' as decimal(3,1));
select if(1=1, 'aa', 'bb');
select ifnull(123, 345);
select ifnull(null, 123);
create table Mybook (
bookid integer,
price integer
);
insert into mybook 
	values (1, 10000), (2, 20000), (3,30000);
update mybook set price = null where bookid = '3';
select * from mybook;
select bookid, ifnull(price, 0) from mybook;
select * from mybook where price is null;
select * from mybook where price='';
select bookid, price+100 from mybook;
select sum(price), avg(price), count(*) from mybook where bookid >= 4;
select count(*), count(price) from mybook;
select sum(price), avg(price) from mybook;
select * from book;











































