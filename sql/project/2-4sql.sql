국가별 총 매출 집계 (상위 10개 국가)

국가(billing_country)별 총 매출을 집계해, 매출이 많은 상위 10개 국가의 국가명과 총 매출을 출력하세요.

-- 모든 테이블 목록 보기 (현재 스키마 기준)
\dt

-- 또는 스키마 포함해서 보기
SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_name ILIKE '%country%';

SELECT table_schema, table_name
FROM information_schema.tables
WHERE table_type = 'BASE TABLE'
AND table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY table_schema, table_name;



-- 모든 테이블과 컬럼 이름 확인
SELECT table_schema, table_name, column_name
FROM information_schema.columns
WHERE table_schema NOT IN ('pg_catalog', 'information_schema')
ORDER BY table_name, ordinal_position;







-- 테이블 목록 확인
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- tracks 테이블 컬럼 확인
SELECT column_name FROM information_schema.columns WHERE table_name = 'city';


SELECT billing_country, SUM(total) AS total_sales
FROM invoices
GROUP BY billing_country
ORDER BY total_sales DESC
LIMIT 10;

