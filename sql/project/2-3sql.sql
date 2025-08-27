
2-3sql

SELECT customer_id, first_name, last_name, invoice_date
FROM invoices
WHERE invoice_date < '2020-01-01';
.

-- 테이블 목록 확인
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- tracks 테이블 컬럼 확인
SELECT column_name FROM information_schema.columns WHERE table_name = 'invoices';

SELECT i.customer_id, c.first_name, c.last_name, i.invoice_date
FROM invoices i
JOIN customers c ON i.customer_id = c.customer_id
WHERE i.invoice_date < '2020-01-01';

