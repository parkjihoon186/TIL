-- SELECT 컬럼
-- FROM 테이블
-- WHERE 조건
-- ORDER BY 정렬기준
-- LIMIT 개수 

USE LECTURE;

DROP TABLE IF EXISTS students;

CREATE TABLE students(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(20),
  email VARCHAR(20),
  age INT
);

DESC students;


DESC STUDENTS;

INSERT INTO students(name, age) VALUES
('김 상 엽', 27),
('박 재 우', 57);  -- ← 여기서 끝!

SELECT * FROM students;

select * from students WHERE name='김 상 엽';
SELECT * FROM students WHERE age >= 20;

SELECT * FROM students WHERE age > 20;

SELECT * FROM students WHERE id <> 1;

SELECT * FROM students WHERE id = 1;

SELECT * FROM students WHERE age BETWEEN 20 AND 50;

SELECT * FROM students WHERE ID IN (1,3,5,7);

-- 문자얄 패턴(% -> 있을수도, 없을수도 있다. _-> 정확히 개수만큼 글자가있다.)
SELECT * FROM students WHERE NAME LIKE '이%';
-- '창' 글자가 들어가는 사람
SELECT * FROM students WHERE name LIKE '%창%';
-- '창'으로 시작만 하면됨 
SELECT * FROM STUDENTS WHERE name like (
SELECT * FROM students WHERE NAME like '%창%';
-- 이름이 정확히 3글자인 유씨
SELECT * FROM 


