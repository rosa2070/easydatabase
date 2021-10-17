create table newbook (
bookid integer,
bookname varchar(20),
publisher varchar(20),
price integer);

create table newbook (
bookid integer,
bookname varchar(20),
publisher varchar(20),
price integer,
primary key (bookid));

create table newbook (
bookid integer primary key,
bookname varchar(20),
publisher varchar(20),
price integer);

create table newbook (
bookname varchar(20) not null,
publisher varchar(20) unique,
price integer default 10000 check (price>1000),
primary key (bookname, publisher));

create table NewOrders (
orderid integer,
custid integer not null,
bookid integer not null,
saleprice integer,
orderdate date,
primary key(orderid),
foreign key (custid) references newcustomer(custid) on delete cascade);

alter table newbook add isbn varchar(12);
alter table newbook modify isbn integer;
alter table newbook drop column isbn;
alter table newbook modify bookid integer not null;
alter table newbook add primary key(bookid);

drop table newbook;




