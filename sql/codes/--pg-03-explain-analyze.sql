--pg-03-explain-analyze.sql
-- 실행계획을 보자
EXPLAIN
SELECT * FROM large_customers WHERE customer_type='vip';

-- seq scan on large_customers (cost=0.00 . . 3746.00 row=10013 width )

EXPLAIN ANALYZE
SELECT
    c.customer_name,
    COUNT(o.order_id)
FROM large_customers c
LEFT JOIN large_orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name;













