alter table 상영관 modify 가격 integer check (가격 >= 20000);
alter table 상영관 modify 상영관번호 integer check (상영관번호 between 1 and 10);
alter table 예약 modify 좌석번호 integer unique;
select 극장이름, 위치 from 극장;
select * from 극장 where 위치 = '잠실';
select 이름 from 고객 where 주소 = '잠실' order by 이름;
select 극장번호, 상영관번호, 영화제목 from 상영관 where 가격 <= 8000;
select 이름, 주소 from 고객 where 주소 in (select 위치 from 극장);
select count(*) from 극장;
select avg(가격) from 상영관;
select count(*) from 예약 where 날짜 = '2014-09-01';
select 영화제목 from 극장 inner join 상영관 on 극장.극장번호 = 상영관.극장번호 and 극장이름 = '대한';
select 이름 from 고객 where 고객번호 in (select 예약.고객번호 from 예약 inner join 극장 on 극장.극장번호 = 예약.극장번호 and 극장이름 = '대한');
select 예약.극장번호, sum(가격) from 예약 inner join 상영관 on 예약.극장번호 = 상영관.극장번호 and 예약.상영관번호 = 상영관.상영관번호 group by 예약.극장번호 
	having 예약.극장번호 = (select 극장.극장번호 from 극장 where 극장이름 = '대한');
select 극장번호, count(상영관번호) from 상영관 group by 극장번호;
select 극장이름, count(상영관번호) from 극장 left outer join 상영관 on 극장.극장번호 = 상영관.극장번호 group by 상영관.극장번호;
select * from 상영관 inner join 극장 on 상영관.극장번호 = 극장.극장번호 and 극장.위치= '잠실';
select 극장번호, count(예약.고객번호) from 예약 where 날짜 = '2014-09-01' group by 극장번호;
select 상영관.영화제목, count(*) from 상영관 inner join 예약
	on 상영관.극장번호 = 예약.극장번호 and 상영관.상영관번호 = 예약.상영관번호 and 예약.날짜 = '2014-09-01' group by 상영관.영화제목
    having count(*) = (select max(c) from (select count(*) c from 상영관 inner join 예약
    on 상영관.극장번호 = 예약.극장번호 and 상영관.상영관번호 = 예약.상영관번호 and 예약.날짜 = '2014-09-01' group by 상영관.영화제목) t);
update 상영관 set 가격 = 가격 * 1.1;    