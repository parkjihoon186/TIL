✅ 목적:
FROM 절에서 테이블을 어떻게 JOIN하는지

어떤 기준으로 연결하는지

순서에 따라 데이터가 어떻게 확장되는지를 중심으로

👇 아래를 .md 파일 또는 VS Code에 바로 붙여넣을 수 있게 정리해줄게.

markdown
복사
편집
# 🧱 SQL `FROM` 절 중심 JOIN 흐름 정리

---

## 🔹 기본 구조

```sql
FROM 테이블1 A
JOIN 테이블2 B ON A.기준컬럼 = B.기준컬럼
FROM은 가장 먼저 실행됨 (SQL 논리 실행 순서 1단계)

JOIN은 두 테이블을 조건에 따라 결합함

🔹 실전 예제: 4개 테이블 JOIN
sql
복사
편집
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
JOIN customers c ON o.customer_id = c.customer_id
설명:
orders o

기준 테이블. 주문 정보가 들어 있음.

JOIN order_details od ON o.order_id = od.order_id

하나의 주문에 어떤 상품들이 몇 개 들어갔는지 연결함.

JOIN products p ON od.product_id = p.product_id

상품 ID를 기준으로 상품 이름, 가격, 카테고리 정보 추가.

JOIN customers c ON o.customer_id = c.customer_id

고객 ID를 기준으로 주문한 사람의 이름 추가.

🔹 데이터 확장 흐름
단계	설명	추가되는 정보
1단계	FROM orders	주문 ID, 고객 ID, 주문일
2단계	JOIN order_details	상품 ID, 수량
3단계	JOIN products	상품명, 가격, 카테고리
4단계	JOIN customers	고객 이름

🔹 핵심 요약
FROM → 기준 테이블 시작 (ex: 주문)

JOIN → 다른 테이블을 논리적으로 이어붙임

ON → 어떤 기준(컬럼)으로 붙일지 정함

순서대로 JOIN하면 점점 데이터가 확장된다 (행은 늘어나고, 컬럼도 늘어남)

📌 실무 팁:
FROM ~ JOIN 구간은 SQL에서 가장 먼저 실행되며,
전체 쿼리의 데이터 범위를 결정하는 핵심 부분이다.