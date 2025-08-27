# 📘 SQL JOIN 학습 요약

---

## 🔹 1. 기본 JOIN 구조

```sql
FROM 테이블1 A
JOIN 테이블2 B ON A.기준컬럼 = B.기준컬럼
JOIN은 두 테이블을 기준 컬럼으로 연결하는 문법

AS는 써도 되고 안 써도 됨. 보통 orders o 처럼 별칭(alias)을 사용함

🔹 2. 실전 JOIN 예시
sql
복사
편집
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id
orders → 주문 정보 (고객 ID 포함)

order_details → 어떤 상품을 몇 개 샀는지

products → 상품명, 가격, 카테고리

customers → 고객 ID로 고객 이름 확인

🔹 3. SELECT로 컬럼 추출 예시
sql
복사
편집
SELECT
  c.customer_name,
  p.category,
  p.price,
  od.quantity
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id;
고객 이름, 상품 카테고리, 상품 가격, 수량을 출력함

🔹 4. JOIN customers c ON o.customer_id = c.customer_id 해석
orders에는 고객 ID만 있음 → 이름을 알 수 없음

customers는 고객 ID와 이름이 있음

customer_id를 기준으로 JOIN해서 이름을 가져옴

📦 비유:

orders = 택배 상자 (고객 ID만 적혀 있음)

customers = 주소록 (고객 ID → 이름 연결)

JOIN = 상자에 "누가 주문했는지" 붙이는 작업

🔹 5. 전체 JOIN 결과 예시
customer_name	category	price	quantity
홍길동	전자기기	10000	2
홍길동	전자기기	20000	1
김철수	전자기기	10000	1
이영희	식품	5000	5

🔹 핵심 요약
✅ JOIN은 테이블끼리 연결

✅ ON은 어떤 기준(컬럼)으로 연결할지를 지정

✅ SELECT는 보고 싶은 컬럼을 뽑아오는 곳

✅ AS는 별칭 (생략 가능하지만 자주 사용함)