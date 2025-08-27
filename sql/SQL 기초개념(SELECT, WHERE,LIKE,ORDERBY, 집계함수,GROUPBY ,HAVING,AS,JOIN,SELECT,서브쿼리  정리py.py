<<<<<<< HEAD
### SQL 기초개념 정리 (마크다운)

1.SELECT/FORM 
##개념: 데이터를 조회할때 사용하는 기본구문

#형식 SELECT 열1, 열2, ... FROM 테이블명;

예제 1:
SELECT name, age FROM userinfo;

### WHERE
##개념: 특정 조건을 만족하는 행만 조회.

#형식: SELECT ... FROM ... WHERE 조건;

예제 2:
SELECT name, age FROM userinfo WHERE age > 30;


### LIKE/와일드카드(%)

##개념: 특정 패턴과 일치하는 데이터를 조회할 때 사용.
형식: LIKE '%값%' (%는 0개 이상의 문자를 의미)

예제 3:
SELECT name FROM userinfo WHERE email LIKE '%@gmail.com';

###ORDER BY

##결과 정렬

#형식: ORDER BY 컬럼명 ASC|DESC
sql
복사
편집
예제 4:
SELECT name, age FROM userinfo ORDER BY age DESC;

###COUNT, SUM, AVG, MIN, MAX (집계 함수)

##개념: 값을 세거나, 평균/합계 등을 구할 때 사용

#형식:

COUNT(*): 행 개수

SUM(컬럼명): 총합

AVG(컬럼명): 평균

MIN(), MAX(): 최소/최대값

예제 5:
SELECT AVG(age) AS 평균나이 FROM userinfo;

### GROUP BY 

##개념: 특정 열을 기준으로 데이터를 그룹화할 때 사용.
#형식: GROUP BY 컬럼명

예제 6:
SELECT age, COUNT(*) AS 인원수
FROM userinfo
GROUP BY age;

###HAVING
##개념: GROUP BY로 집계한 결과에 조건을 줄 때 사용 (WHERE과 다름!)

#형식: HAVING 조건

예제 7:
SELECT age, COUNT(*) AS 인원수
FROM userinfo
GROUP BY age
HAVING COUNT(*) > 1;

### AS(별칭)
##개념 칼럼이나 테이블에 새로운 이름을 붙여서 보기 좋게 만드는 기능 

예제 8:
SELECT AVG(age) AS 평균나이 FROM userinfo;

###JOIN 
##두 개 이상의 테이블을 연결해서 조회 

INNER JOIN: 공통된 데이터만

LEFT JOIN: 왼쪽 테이블 기준 전체 + 오른쪽 일치

형식: FROM A JOIN B ON A.key = B.key

예제 9:
SELECT c.customer_name, s.total_amount
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id;


###  INNER JOIN

SELECT *
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id;
##두 테이블에서 공통된 값이 있는 행만 결합 

### LEFT JOIN 

##왼쪽 테이블 기준 전체 +오른쪽 일치

예제 9:
SELECT c.customer_name, s.total_amount
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id;

### 서브쿼리

##개념 쿼리 안에 또다른 쿼리를 넣어 조건으로 사용하는것 

예제 10:
SELECT * FROM sales
WHERE total_amount > (SELECT AVG(total_amount) FROM sales);
=======
### SQL 기초개념 정리 (마크다운)

1.SELECT/FORM 
##개념: 데이터를 조회할때 사용하는 기본구문

#형식 SELECT 열1, 열2, ... FROM 테이블명;

예제 1:
SELECT name, age FROM userinfo;

### WHERE
##개념: 특정 조건을 만족하는 행만 조회.

#형식: SELECT ... FROM ... WHERE 조건;

예제 2:
SELECT name, age FROM userinfo WHERE age > 30;


### LIKE/와일드카드(%)

##개념: 특정 패턴과 일치하는 데이터를 조회할 때 사용.
형식: LIKE '%값%' (%는 0개 이상의 문자를 의미)

예제 3:
SELECT name FROM userinfo WHERE email LIKE '%@gmail.com';

###ORDER BY

##결과 정렬

#형식: ORDER BY 컬럼명 ASC|DESC
sql
복사
편집
예제 4:
SELECT name, age FROM userinfo ORDER BY age DESC;

###COUNT, SUM, AVG, MIN, MAX (집계 함수)

##개념: 값을 세거나, 평균/합계 등을 구할 때 사용

#형식:

COUNT(*): 행 개수

SUM(컬럼명): 총합

AVG(컬럼명): 평균

MIN(), MAX(): 최소/최대값

예제 5:
SELECT AVG(age) AS 평균나이 FROM userinfo;

### GROUP BY 

##개념: 특정 열을 기준으로 데이터를 그룹화할 때 사용.
#형식: GROUP BY 컬럼명

예제 6:
SELECT age, COUNT(*) AS 인원수
FROM userinfo
GROUP BY age;

###HAVING
##개념: GROUP BY로 집계한 결과에 조건을 줄 때 사용 (WHERE과 다름!)

#형식: HAVING 조건

예제 7:
SELECT age, COUNT(*) AS 인원수
FROM userinfo
GROUP BY age
HAVING COUNT(*) > 1;

### AS(별칭)
##개념 칼럼이나 테이블에 새로운 이름을 붙여서 보기 좋게 만드는 기능 

예제 8:
SELECT AVG(age) AS 평균나이 FROM userinfo;

###JOIN 
##두 개 이상의 테이블을 연결해서 조회 

INNER JOIN: 공통된 데이터만

LEFT JOIN: 왼쪽 테이블 기준 전체 + 오른쪽 일치

형식: FROM A JOIN B ON A.key = B.key

예제 9:
SELECT c.customer_name, s.total_amount
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id;


###  INNER JOIN

SELECT *
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id;
##두 테이블에서 공통된 값이 있는 행만 결합 

### LEFT JOIN 

##왼쪽 테이블 기준 전체 +오른쪽 일치

예제 9:
SELECT c.customer_name, s.total_amount
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id;

### 서브쿼리

##개념 쿼리 안에 또다른 쿼리를 넣어 조건으로 사용하는것 

예제 10:
SELECT * FROM sales
WHERE total_amount > (SELECT AVG(total_amount) FROM sales);
>>>>>>> 34620858a00bedd27b346e4c695103ea388174f9
