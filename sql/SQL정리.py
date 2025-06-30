# 📘 내가 배운 SQL & GitHub 요약 정리

---

## 🐬 SQL 정리 (MySQL 기준)

### ✅ 기본 명령어

```sql
USE practice;                    -- 데이터베이스 선택
SELECT * FROM userinfo;          -- 전체 데이터 보기
DESC userinfo;                   -- 테이블 구조 확인

### 칼럼추가 (email,기본값 포함 )
ALTER TABLE userinfo
ADD COLUMN email VARCHAR(40) DEFAULT 'ex@gmail.com';
## 칼럼 수정 (nick name 길이 100자로 변경 )
ALTER TABLE userinfo
MODIFY COLUMN nickname VARCHAR(100);
### 칼럼삭제(email 칼럼 삭제)
ALTER TABLE userinfo
DROP COLUMN email;
### 데이터 삽입 
INSERT INTO userinfo(nickname, phone)
VALUES ('p', '0104567890');
### 데이터 수정 (id가 3인 사람의 email 변경)
UPDATE userinfo
SET email = 'newemail@example.com'
WHERE id = 3;
조건부조회 
SELECT * FROM userinfo WHERE id = 3;
SELECT * FROM userinfo WHERE nickname = 'p';