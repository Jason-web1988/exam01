select user from dual;
drop table member_tbl_01;
drop table money_tbl_01;

--멤버 테이블 생성
create table member_tbl_01(
	custno number(6) NOT NULL primary key,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(1),
	city char(2)
);

select * from member_tbl_01;
-------------------------------------


--매출 테이블
create table money_tbl_01(
	custno number(6) NOT NULL,
	salenol number(8) NOT NULL,
	pcost number(8),
	amount number(4),
	price number(8),
	pcode varchar2(4),
	sdate date,
	PRIMARY KEY(custno, salenol)
);

select * from money_tbl_01;
-------------------------------------

--시퀀스 생성
create sequence member_seq01
start with 100001
increment by 1
minvalue 100001;

--멤버dml
insert into  member_tbl_01 values(member_seq01.nextval, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A','01');
insert into  member_tbl_01 values(member_seq01.nextval, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B','01');
insert into  member_tbl_01 values(member_seq01.nextval, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'B','30');
insert into  member_tbl_01 values(member_seq01.nextval, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151113', 'A','30');
insert into  member_tbl_01 values(member_seq01.nextval, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B','60');
insert into  member_tbl_01 values(member_seq01.nextval, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C','60');

--매출dml
insert into  money_tbl_01 values(100001, 201601, 500, 5, 2500, 'A001', '20160101' );
insert into  money_tbl_01 values(100001, 201602, 1000, 4, 4000, 'A002', '20160101' );
insert into  money_tbl_01 values(100001, 201603, 500, 3, 1500, 'A008', '20160101' );
insert into  money_tbl_01 values(100002, 201604, 2000, 1, 2000, 'A004', '20160102' );
insert into  money_tbl_01 values(100002, 201605, 500, 1, 500, 'A001', '20160103' );
insert into  money_tbl_01 values(100003, 201606, 1500, 2, 3000, 'A003', '20160103' );

insert into  money_tbl_01 values(100004, 201607, 500, 2, 1000, 'A001', '20160104' );
insert into  money_tbl_01 values(100004, 201608, 300, 1, 300, 'A005', '20160104' );
insert into  money_tbl_01 values(100004, 201609, 600, 1, 600, 'A006', '20160104' );
insert into  money_tbl_01 values(100004, 201610, 3000, 1, 3000, 'A007', '20160106' );

-------------------------------------------------
select custno, custname, phone, address, joindate, grade, city from member_tbl_01;

select custno salenol, pcost, amount, price, pcode, sdate from money_tbl_01;

--join
select m.custno, custname, grade, total
from member_tbl_01 m join (select custno, sum(price) as total
							from money_tbl_01
							group by custno)n on m.custno = n.custno
							order by total desc;



