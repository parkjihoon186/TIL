-- ✅ 전체 테이블 조회
SELECT * 
FROM datatype_demo;

-- ✅ 배열(tags) 다루기
SELECT 
    name,
    tags,
    tags[1] AS first_tag,
    'postgreSQL' = ANY(tags) AS pg_dev
FROM datatype_demo;

-- ✅ JSONB(metadata) 조회
SELECT
    name,
    metadata,
    metadata->>'department' AS 부서,
    metadata->>'skills' AS 능력
FROM datatype_demo;

-- ✅ JSONB(metadata) 조건 검색
SELECT 
    name,
    metadata->>'department' AS 부서
FROM datatype_demo
WHERE metadata @> '{"level":"senior"}';

-- ✅ 범위(salary_range) 사용
SELECT
    name,
    salary,
    salary_range,
    salary::INT <@ salary_range AS in_range
FROM datatype_demo;

CREATE TABLE large_orders AS
SELECT
    generate_series(1, 1000000) AS order_id,
    -- 고객 ID (랜덤)
    'CUST-' || LPAD((floor(random() * 50000) + 1)::text, 6, '0') AS customer_id,
    -- 제품 ID (랜덤)
    'PROD-' || LPAD((floor(random() * 10000) + 1)::text, 5, '0') AS product_id,
    -- 주문 금액 (랜덤)
    (random() * 1000000 + 1000)::NUMERIC(12,2) AS amount,
    -- 주문 날짜 (2023-2024년 랜덤)
    (DATE '2023-01-01' + (floor(random() * 730))::int) AS order_date,
    -- 지역 (배열에서 랜덤 선택)
    (ARRAY['서울', '부산', '대구', '인천', '광주', '대전', '울산'])[
        CEIL(random() * 7)::int
    ] AS region,
    -- 카테고리 태그 (배열)
    CASE
        WHEN random() < 0.3 THEN ARRAY['전자제품', '인기상품']
        WHEN random() < 0.6 THEN ARRAY['의류', '패션']
        WHEN random() < 0.8 THEN ARRAY['생활용품', '필수품']
        ELSE ARRAY['식품', '신선식품']
    END AS category_tags,
    -- 주문 세부 정보 (JSONB)
    jsonb_build_object(
        'payment_method',
        (ARRAY['카드', '현금', '계좌이체', '포인트'])[CEIL(random() * 4)::int],
        'delivery_fee',
        CASE WHEN random() < 0.5 THEN 0 ELSE 3000 END,
        'is_express',
        random() < 0.3,
        'discount_rate',
        (random() * 20)::int
    ) AS order_details,
    -- 생성 시간
    NOW() AS created_at;


-- 생성된 데이터 확인
SELECT COUNT(*) FROM large_orders;

-- 데이터 샘플 확인
SELECT * FROM large_orders LIMIT 5;

-- 고객 데이터 생성
CREATE TABLE large_customers AS
SELECT 
    'CUST-' || LPAD(generate_series(1, 100000)::text, 6, '0') AS customer_id,
    -- 랜덤 이름 생성
    (ARRAY['김', '이', '박', '최', '정', '강', '조', '윤', '장', '임'])[CEIL(random() * 10)::int] ||
    (ARRAY['철수', '영희', '민수', '지은', '우진', '소영', '현우', '예은', '도윤', '서연'])[CEIL(random() * 10)::int] 
    AS customer_name,
    -- 나이 (20-80세)
    (20 + random() * 60)::int AS age,
    -- 고객 타입
    CASE 
        WHEN random() < 0.1 THEN 'VIP'
        WHEN random() < 0.3 THEN '골드'
        WHEN random() < 0.6 THEN '실버'
        ELSE '일반'
    END AS customer_type,
    -- 가입일
    (DATE '2020-01-01' + (random() * 1460)::int) AS join_date,
    -- 선호 카테고리 (배열로 간단하게)
    CASE 
        WHEN random() < 0.2 THEN ARRAY['전자제품']
        WHEN random() < 0.4 THEN ARRAY['의류']
        WHEN random() < 0.6 THEN ARRAY['생활용품']
        WHEN random() < 0.8 THEN ARRAY['식품']
        WHEN random() < 0.9 THEN ARRAY['전자제품', '의류']
        ELSE ARRAY['생활용품', '식품']
    END AS preferred_categories,
    -- 연락 방식
    (ARRAY['email', 'sms', 'push', 'none'])[CEIL(random() * 4)::int] AS communication_preference,
    -- 적립 포인트
    (random() * 10000)::int AS loyalty_points,
    -- 추가 정보 (JSONB)
    jsonb_build_object(
        'last_login', (now() - (random() * interval '365 days'))::date,
        'total_orders', (random() * 100)::int,
        'is_premium', random() < 0.3
    ) AS additional_info;

-- 생성 확인
SELECT COUNT(*) FROM large_customers;

-- 데이터 샘플 확인
SELECT 
    customer_id,
    customer_name,
    customer_type,
    preferred_categories,
    communication_preference,
    loyalty_points,
    additional_info
FROM large_customers 
LIMIT 10;

-- 배열 검색 테스트
SELECT COUNT(*) 
FROM large_customers 
WHERE '전자제품' = ANY(preferred_categories);

-- JSONB 검색 테스트
SELECT COUNT(*) 
FROM large_customers 
WHERE additional_info @> '{"is_premium": true}'; 



	