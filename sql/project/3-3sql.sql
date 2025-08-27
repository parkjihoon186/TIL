3-3 sql
고객별 누적 구매액 및 등급 산출

각 고객의 누적 구매액을 구하고,
상위 20%는 'VIP', 하위 20%는 'Low', 나머지는 'Normal' 등급을 부여하세요.

-- 테이블 목록 확인
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- tracks 테이블 컬럼 확인
SELECT column_name FROM information_schema.columns WHERE table_name = 'invoices';

WITH customer_totals AS (
  SELECT
    customer_id,
    SUM(total) AS total_spent
  FROM invoices
  GROUP BY customer_id
),
ranked AS (
  SELECT
    customer_id,
    total_spent,
    PERCENT_RANK() OVER (ORDER BY total_spent DESC) AS pr
  FROM customer_totals
)
SELECT
  customer_id,
  total_spent,
  CASE
    WHEN pr <= 0.2 THEN 'VIP'       -- 상위 20%
    WHEN pr >= 0.8 THEN 'Low'       -- 하위 20%
    ELSE 'Normal'
  END AS customer_grade
FROM ranked
ORDER BY total_spent DESC;
