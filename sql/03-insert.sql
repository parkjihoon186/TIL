-- 03-insert.sql

USE lecture;
DESC members;

-- 데이터 입력
INSERT INTO members (name,email) VALUES('박지훈', 'PARK@A.COM');
INSERT INTO members (name,email) VALUES('박지성', 'Pjs@A.COM');
-- 데이터 확인
SELECT * FROM members;


