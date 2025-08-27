3-5 sql
각 고객의 최근 구매 내역

각 고객별로 가장 최근 인보이스(invoice_id, invoice_date, total) 정보를 출력하세요.
 
SELECT i.customer_id, i.invoice_date, i.total
FROM invoices i
JOIN (
  SELECT customer_id, MAX(invoice_date) AS 최근구매일자
  FROM invoices
  GROUP BY customer_id
) recent ON i.customer_id = recent.customer_id AND i.invoice_date = recent.최근구매일자;
