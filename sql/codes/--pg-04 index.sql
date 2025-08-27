-- ✅ 인덱스 조회
SELECT 
    tablename,
    indexname,
    indexdef
FROM pg_indexes
WHERE tablename IN ('large_orders', 'large_customers');

-- ✅ 통계 수집 (쿼리 플래너에게 힌트 제공)
ANALYZE large_orders;
ANALYZE large_customers;

-- ✅ 캐시 초기화 (세션 초기화 수준)
DISCARD ALL;

-- ✅ 인덱스 테스트 1
EXPLAIN ANALYZE
SELECT * 
FROM large_orders
WHERE region = '서울' 
  AND amount > 500000 
  AND order_date >= '2024-07-08';

-- ✅ 인덱스 테스트 2
EXPLAIN ANALYZE
SELECT * 
FROM large_orders
WHERE region = '서울'
ORDER BY amount DESC
LIMIT 100;

-- ✅ 인덱스 생성
CREATE INDEX idx_orders_customer_id ON large_orders(customer_id);
CREATE INDEX idx_orders_amount ON large_orders(amount);
CREATE INDEX idx_orders_region ON large_orders(region);

-- ✅ 인덱스 테스트 3: 범위 조건
EXPLAIN ANALYZE 
SELECT * 
FROM large_orders 
WHERE amount BETWEEN 800000 AND 1000000;

-- ✅ 인덱스 테스트 4: count() 조건
EXPLAIN ANALYZE 
SELECT COUNT(*) 
FROM large_orders 
WHERE region = '서울';

order by amount desc -- 39823/157.941ms
limit 100;

create index idx_orders_customer_id on large_orders(customer_id);
create index idx_orders_amount  on large_orders(amount);
create index idx_orders_region on large_orders(region);


explain analyze
select * from large_orders
where amount between 800000 and 1000000; --46296/192.534ms

explain analyze 
select count(*) from large_orders where region='서울'; --37655/100ms
select count(*) from large_orders where region='서울'; -- 3574/11ms
--복합 인덱스 

create index idx_orders_region_amount on large_orders(customer_id,order_date);
explain analyse
SELECT *
FROM large_orders
WHERE region = '서울' AND amount > 800000;

-- 복합 인덱스 순서의 중요도
create index idx_orders_region_amount on large_orders(region,amount);
create index idx_orders_region_amount on large_orders(amount,region);
SELECT
  tablename,
  indexname,
  pg_size_pretty(pg_relation_size(indexname::regclass)) AS index_size
FROM pg_indexes;

-- Index 순서 가이드라인

-- 고유값 비율
SELECT
	COUNT(DISTINCT region) AS 고유지역수,
	COUNT(*) AS 전체행수,
	ROUND(COUNT(DISTINCT region) * 100 / COUNT(*), 2) AS 선택도
FROM large_orders;  -- 0.0007%

SELECT
	COUNT(DISTINCT amount) AS 고유금액수,
	COUNT(*) AS 전체행수
FROM large_orders;  -- 선택도 99%

SELECT
	COUNT(DISTINCT customer_id) AS 고유고객수,
	COUNT(*) AS 전체행수
FROM large_orders;  -- 선택도 13.6%


