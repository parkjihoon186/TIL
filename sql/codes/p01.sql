-- p01.sql

-- 1. practice db 사용
-- 2. userinfo 테이블 생성
-- id pk, auto inc, int
-- nickname: 글자 20 자까지. 중복방지
-- reg_date 날짜, 기본값(오늘날짜)

-- 3. desc 로 테이블 정보확인 

use practice;

CREATE TABLE userinfo (
	id INT AUTO_INCREMENT primary key,
	nickname VARCHAR(20) NOT NULL,
	phone VARCHAR(11) UNIQUE,
	reg_date DATE DEFAULT(current_date())
);
-- 2. user info 테이블 생성
	-- id PK, auto inc, int
	-- nickname: 글자 20자 까지, 필수입력
    -- phone 글자 11 글자까지, 중복 방지
	-- reg_date 날짜, 기본값(오늘 날짜) 
DESC userinfo;