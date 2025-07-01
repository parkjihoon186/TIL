-- P03.SQL

-- Practice db 사용

-- 스키마 확인 & 데이터 확인ALTER

-- userinfo 에 email 컬럼 추가 40글자 제한, 기본값은 ex@gmail.com
-- nickname 길이제한 100자로 늘리기
-- reg_data 컬럼 삭제
-- 실제 한명의 email 을 수정하기 

use practice;
ALTER TABLE userinfo
ADD COLUMN email VARCHAR(40) DEFAULT 'ex@gmail.com';

-- nickname 길이 제한 100자로 늘리기 
ALTER TABLE userinfo
MODIFY COLUMN nickname VARCHAR(100);
ALTER TABLE USERINFO 
DROP COLUMN EMAIL 

