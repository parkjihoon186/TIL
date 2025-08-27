-- 모든 앨범과 해당 아티스트 이름 출력

각 앨범의 title과 해당 아티스트의 name을 출력하고, 앨범 제목 기준 오름차순 정렬하세요.

-- albums 테이블 구조 확인
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'albums';

-- artists 테이블 구조 확인
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'artists';

SELECT a.title,
       ar.name AS artist_name
FROM albums AS a
JOIN artists AS ar
  ON a.artist_id = ar.artist_id
ORDER BY a.title ASC;

