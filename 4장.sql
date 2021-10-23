select * from book;
select abs(-78),abs(+78);
select round(4.875, 1);
select custid '고객번호', round(sum(saleprice)/count(*), -2) '평균금액'
from Orders
group by custid;
select bookid, replace(bookname, '야구', '농구'), bookname, publisher, price
from book;
select bookname '제목', char_length(bookname) '문자수',
length(bookname) '바이트수'
from book
where publisher='굿스포츠';
select substr(name, 1, 1) '성', count(*) '인원'
from customer
group by substr(name, 1, 1);
select orderid '주문번호', orderdate '주문일',
adddate(orderdate, interval 10 day) '확정'
from orders;
select orderid '주문번호', date_format(orderdate, '%Y-%m-%d') '주문일',
	   custid '고객번호', bookid '도서번호'
from orders
where orderdate=str_to_date('20140707', '%Y%m%d');
select sysdate(), date_format(sysdate(), '%Y/%m/%d %M %h:%s') 'SYSDATE_1';
select name '이름', ifnull(phone, '연락처없음') '전화번호' from customer;
set @seq:=0;
select (@seq:=@seq+1) '순번', custid, name, phone
from customer
where @seq<2;
select (select name from customer cs where cs.custid=od.custid) 'name', sum(saleprice) 'total' from orders od group by od.custid;
update orders set bname=(select bookname from book where book.bookid=orders.bookid);
select cs.name, sum(od.saleprice) 'total'
from (select custid, name from customer where custid<=2) cs, orders od 
where cs.custid=od.custid
group by cs.name;
select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice) from orders);
select orderid, custid, saleprice from orders od where saleprice > (select avg(saleprice) from orders so where od.custid=so.custid);
select sum(saleprice) 'total'
from orders
where custid in (select custid from customer where address like '%대한민국%');
select orderid, saleprice from orders where saleprice > all(select saleprice from orders where custid='3');
select sum(saleprice) 'total'
from orders od
where exists(select * from customer cs where address like '%대한민국%' and cs.custid=od.custid);
select * from book where bookname like '%축구%';
create view vw_book as select *
from book where bookname like '%축구%';
create view vw_customer as select * from customer where address like '%대한민국%';
select * from vw_customer;
create view vw_orders (orderid, custid, name, bookid, bookname, saleprice, orderdate)
as select od.orderid, od.custid, cs.name,
		  od.bookid, bk.bookname, od.saleprice, od.orderdate
from orders od, customer cs, book bk
where od.custid=cs.custid and od.bookid=bk.bookid;
select orderid, bookname, saleprice from vw_orders where name='김연아';
create or replace view vw_customer (custid, name, address)
as select custid, name, address from customer where address like '%영국%';
select * from vw_customer;
create index ix_book on book (bookname);
create index ix_book2 on book(publisher, price);
select * from book where publisher='대한미디어' and price >= 30000;
analyze table book;
drop index ix_book on Bppk;







































