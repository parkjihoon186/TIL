-- 06 -alter.sql

use lecture;

-- members 테이블을 상세히 확인(Describe)
DESC members;

-- 테이블 스키마(컬럼구조) 변경
ALTER TABLE members ADD COLUMN age INT NOT NULL;
-- 칼럼 추가
ALTER TABLE members ADD COLUMN adress VARCHAR(100) DEFAULT '미입력';

-- 칼럼 이름 수정 + 데이터 타입 수정 
ALTER TABLE members CHANGE COLUMN address juso VARCHAR(100);
-- 칼럼 데이터 타입 수정
ALTER TABLE members MODIFY COLUMN juso VARCHAR(50);
-- 칼럼 삭제 

-- 칼럼 삭제
ALTER TABLE members drop column age;

SELECT * FROM members;