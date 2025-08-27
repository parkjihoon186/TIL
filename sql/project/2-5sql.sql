2-5sql 
각 고객의 최근 구매 내역

각 고객별로 가장 최근 인보이스(invoice_id, invoice_date, total) 정보를 출력하세요.


SELECT customer_id, invoice_id, invoice_date, total
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY invoice_date DESC) AS rn
    FROM invoices
) sub
WHERE rn = 1;
