-- 13-aggr-func.sql

use lecture;
select * from sales;
select count(*) AS 매출건수
FROM sales;

select count(customer_id)
from sales;

select 

	count(*)AS 총주문건수,
    COUNT(customer_id)AS 고객수,
    COUNT(Product_name)AS 제품수
FROM sales;