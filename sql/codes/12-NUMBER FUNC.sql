-- 12- number-func.sql 
use lecture;

-- 실수(소수점) 함수들 
select 
	name, 
    score AS 원점수, 
    ROUND(score)AS 반올림, 
    ROUND(scor,1) AS 소수1반올림,
    CEIL(score) AS 올림,
    FLOOR(score) AS 내림,
    TRUNCATE(score,1) AS 소수1버림
FROM dt_demo;

-- 사칙연산 
select 
	10 + 5 AS Plus
    10 - 5 AS minus,
    10 * 5 AS multiply,
    10 / 5 AS divide
    10 DIV 3 AS 몫,
    10 % 3 AS 나머지,
    MOD(10,3) AS 나머지2, -- modulo 나머지 
    POWER(10,3) AS 거듭제곱, -- 거듭제곱 
    SQRT (16) AS 루트;
    ABS(-10) AS 절댓값;
    
SELECT
	id,name 
    id % 2 AS 나머지
    case 
		when id % 2=0 THEN '짝수'
        ELSE '홀수'
	END AS 홀짝 
    
FROM dt_demo; 



-- 조건문 IF, CASE 
SELECT 
	name,score,
    IF(score>= 80,'우수', '보통') AS 평가
FROM dt_demo;

SELECT 
	name,
    IFNULL (score,0) AS 점수,
    CASE
		WHEN score >=90 THEN 'A' -- 제일 좁은 조건이 위 -- 
        WHEN score >=80 THEN 'B'
        WHEN SCORE >=70 THEN 'C'
	END AS 학점
FROM dt_demo;

select * from dt_demo;

-- INSERT INTO dt_demo(name) VALUES ('이상한');



    