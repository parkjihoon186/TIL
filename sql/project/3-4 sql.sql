3-4

국가별 재구매율(Repeat Rate)

각 국가별로 전체 고객 수, 2회 이상 구매한 고객 수, 재구매율을 구하세요.
결과는 재구매율 내림차순 정렬.

-- 테이블 목록 확인
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- tracks 테이블 컬럼 확인
SELECT column_name FROM information_schema.columns WHERE table_name = 'invoices';

WITH 고객주문수 AS (
  SELECT
    c.customer_id,
    c.country,
    COUNT(i.invoice_id) AS 주문횟수
  FROM customers c
  LEFT JOIN invoices i ON c.customer_id = i.customer_id
  GROUP BY c.customer_id, c.country
)
SELECT
  country,
  COUNT(*) AS 전체고객수,
  COUNT(CASE WHEN 주문횟수 >= 2 THEN 1 END) AS 재구매고객수,
  ROUND(COUNT(CASE WHEN 주문횟수 >= 2 THEN 1 END) * 100.0 / COUNT(*), 2) AS 재구매율
FROM 고객주문수
GROUP BY country
ORDER BY 재구매율 DESC;
