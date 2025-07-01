-- 03-insert.sql

USE lecture;
DESC members;

-- 데이터 입력
INSERT INTO members (name,email) VALUES('박지훈', 'PARK@A.COM');
INSERT INTO members (name,email) VALUES('박지성', 'Pjs@A.COM');

INSERT INTO members(email,Name) VALUES
('KIM@A.COM', '김상엽'),
('PARK@A.COM',  '박성우');

 -- 데이터 전체 조회 (read)
SELECT * FROM members;
--  단일 데이터 조회 (* -> 모든 칼럼 )
select * FROM members WHERE id=1;




