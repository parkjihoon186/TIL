-- 05- select.sql
USE lecture;

SELECT * FROM members;

-- 모든칼럼, id 3
SELECT *FROM members WHERE id=3;
-- 이름 |이메일, 모든 레코드 
SELECT NAME, EMAIL FROM MEMBERS;

-- 칼럼 이름, 이름= 홍길동 
SELECT NAME FROM MEMBERS WHERE NAME= '박지성';
