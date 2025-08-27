-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들


-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역
select
*
from customers c
INNER JOIN sales s on c.customer_id
WHERE S.Category='전자제품'AND s.order_date BETWEEN '2024-07-01','2024-12-31'
-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]
select
from custommer c 
LEFT JOIN sales om c.customer_id=s.customer_id = s.customer_id
group by 
문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함
select
-- 문제 연ㄹ -- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석-- p09.sql
USE practice;

DROP TABLE sales;
DROP TABLE products;
DROP TABLE customers;

CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;
CREATE TABLE customers AS SELECT * FROM lecture.customers;

SELECT COUNT(*) FROM sales
UNION
SELECT COUNT(*) FROM customers;

-- 주문 거래액이 가장 높은 10건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자.
SELECT
  c.customer_name AS 고객명,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;
-- 고객 유형별 [고객유형, 주문건수, 평균주문금액] 을 평균주문금액 높은순으로 정렬해서 보여주자.
SELECT
  c.customer_type AS 고객유형,
  COUNT(*) AS 주문건수,
  AVG(s.total_amount) AS 평균주문금액
FROM customers c
-- INNER JOIN 은 구매자들끼리 평균 / customers LEFT JOIN 는 모든 고객을 분석
INNER JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_type;

-- 문제 1: 모든 고객의 이름과 구매한 상품명 조회
SELECT
  c.customer_name AS 고객명,
  coalesce(s.product_name, '🙀') AS 상품명
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
ORDER BY c.customer_name;

-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  c.join_date AS 가입일,
  s.product_name AS 상품명,
  s.category AS 카테고리,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
ORDER BY 주문일 DESC;

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
  c.customer_name AS 고객명,
  c.customer_type AS 고객유형,
  s.product_name AS 상품명,
  s.total_amount AS 주문금액,
  s.order_date AS 주문일
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id
WHERE c.customer_type = 'VIP'
ORDER BY s.total_amount DESC;

-- 문제 4: 건당 50만원 이상 주문한 기업 고객들

-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함

-- 문제 8: 카테고리별 고객 유형 분석

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금  

-- 문제 9: 고객별 등급 분류 
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]


-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석

select
 