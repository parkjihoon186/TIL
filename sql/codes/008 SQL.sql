-- 08- Orderby.sql
USE lecture;
-- 특정 컬럼을 기준으로 정렬함 
-- ASC 오름차순 |DESC 내림차순

SELECT * FROM members;
-- 이름 ㄱㄴㄷ 순으로 정렬 
SELECT * FROM MEMBERS ORDER BY NAME ;
SELECT * FROM MEMBERS ORDER BY NAME ASC;
SELECT * FROM MEMBERS ORDER BY NAME DESC;
