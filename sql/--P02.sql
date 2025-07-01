-- P02.SQL

-- practice db 이동
-- user info 테이블에

-- 데이터 5건 넣기 (별명,핸드폰)-> 별명 bob 을 포함하세요 C
-- 전체 조회 (중간중간 계속 실행하면서 모니터링)R
-- ID가 3인 사람 조회 R
-- 별명이 bob 인 사람을 조회 R
--  별명이 bob 인 사람의 핸드폰 번호를 010 1234 56789 로 수정 (id로 수정) U
-- 별명이 bob 인 사람 삭제 (id로 수정) D

USE practice;
DESC userinfo;
insert into userinfo(nickname,phone)values
('p', '0104567890'),
('b','01012345678'),
('s' ,'02322132132'),
('r' ,'03445454545');
select * from userinfo;

select * from user info where id=3;

select * from userinfo where nickname='bob';

update userinfo set phone='010555456687', id=3;

delete from userinfo where id==3;

select* from members;