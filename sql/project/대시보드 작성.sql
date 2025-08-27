--대시보드 작성 

-- 월별 총 매출액
SELECT
  DATE_TRUNC('month', invoice_date) AS 월,
  SUM(total) AS 월매출
FROM invoices
GROUP BY 월
ORDER BY 월;

-- 제품별 판매량 Top 5
SELECT
  p.product_name,
  SUM(oi.quantity) AS 총판매량
FROM invoice_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name
ORDER BY 총판매량 DESC
LIMIT 5;

-- 국가별 고객 수 및 총 매출
SELECT
  c.country,
  COUNT(DISTINCT c.customer_id) AS 고객수,
  SUM(i.total) AS 총매출
FROM customers c
JOIN invoices i ON c.customer_id = i.customer_id
GROUP BY c.country
ORDER BY 총매출 DESC;
