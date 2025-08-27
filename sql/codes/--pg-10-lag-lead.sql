-- pg-10-lag-lead.sql

-- LAG() - 이전 값을 가져온다.
-- 전월 대비 매출 분석
-- [1] 특정 고객의 다음 구매 예측
SELECT
	customer_id,
	order_date,
	amount,
	LEAD(order_date, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS 다음구매일,
	LEAD(amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS 다음구매금액
FROM orders
WHERE customer_id = 'CUST-000001'
ORDER BY customer_id, order_date;

-- [2] 고객별 구매 히스토리 분석 (세미콜론으로 위 쿼리 종료 후 진행)
WITH customer_orders AS (
	SELECT
		ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS 구매순서,
		customer_id,
		amount,
		LAG(amount, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS 이전구매금액,
		LAG(order_date, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS 이전구매일,
		order_date,
		LEAD(order_date, 1) OVER (PARTITION BY customer_id ORDER BY order_date) AS 다음구매일
	FROM orders
)
SELECT
	customer_id,
	order_date,
	amount,
	구매순서,
	-- 구매 간격
	order_date - 이전구매일 AS 이전구매간격,
	다음구매일 - order_date AS 다음구매간격,
	-- 구매 금액 변화
	amount - 이전구매금액 AS 금액변화,
	CASE
		WHEN 이전구매금액 IS NULL THEN NULL
		ELSE ROUND((amount - 이전구매금액) * 100.0 / 이전구매금액, 2)::TEXT || '%'
	END AS 금액변화율,
	-- 누적 구매 통계
	SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_date) AS 누적구매금액,
	AVG(amount) OVER (
		PARTITION BY customer_id
		ORDER BY order_date
		ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
	) AS 평균구매금액,
	-- 고객 단계 분류
	CASE
		WHEN 구매순서 = 1 THEN '첫구매'
		WHEN 구매순서 <= 3 THEN '초기고객'
		WHEN 구매순서 <= 10 THEN '일반고객'
		ELSE 'VIP고객'
	END AS 고객단계
FROM customer_orders
ORDER BY customer_id, order_date;
