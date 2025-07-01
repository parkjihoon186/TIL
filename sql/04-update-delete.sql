-- 04- update-delete.sql

SELECT * FROM members;

-- UPdata<데이터수정>
UPDATE members SET name='필드',email= bat@a.com', WHERE ID=6;
-- 원치 않는 케이스 (name이 같으면 동시 수정)
UPDATA members SET name='NO NAME',WHERE NAME='박지훈';
-- DELETE(데이터 삭제 )
DELETE FROM members WHERE ID=7;
-- 테이블 모든 데이터 삭제(위험)
DELETE FROM members WHERE id=7;
--테이블 모든 데이터 삭제(위험)
DELETE FROM members;