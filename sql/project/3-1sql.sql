3-1
월별 매출 및 전월 대비 증감률

각 연월(YYYY-MM)별 총 매출과, 전월 대비 매출 증감률을 구하세요.
결과는 연월 오름차순 정렬하세요.

SELECT 
  TO_CHAR(invoice_date, 'YYYY-MM') AS ym,
  SUM(total) AS monthly_sales
FROM invoices
GROUP BY TO_CHAR(invoice_date, 'YYYY-MM')
ORDER BY ym asc;
