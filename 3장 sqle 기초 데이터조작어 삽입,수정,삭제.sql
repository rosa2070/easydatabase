show tables;
select * from book;
insert into book values (11, '스포츠 의학', '한솔의학서적', 90000);
insert into book(bookid, bookname, publisher) values (12, '스포츠 의학', '한솔의학서적');
select * from customer;
select * from imported_book;
insert into book(bookid, bookname, price, publisher)
	select bookid, bookname, price, publisher
	from imported_book; 
    
select * from customer;
update customer set address='대한민국 부산' where custid=5;
update book set publisher = (select publisher from imported_book where bookid=21) where bookid = 12;
delete from book where bookid = 11;
delete from customer;