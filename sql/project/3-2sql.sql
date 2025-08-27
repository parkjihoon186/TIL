3-2sql
장르별 상위 3개 아티스트 및 트랙 수

각 장르별로 트랙 수가 가장 많은 상위 3명의 아티스트(artist_id, name, track_count)를 구하세요.
동점일 경우 아티스트 이름 오름차순 정렬.

-- 테이블 목록 확인
SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';

-- tracks 테이블 컬럼 확인
SELECT column_name FROM information_schema.columns WHERE table_name = 'tracks';


  select artist_id, name, track_countfrom genres join artists artists_name asc limit3;

  SELECT a.artist_id, a.name, COUNT(t.track_id) AS track_count
FROM artists a
JOIN albums al ON a.artist_id = al.artist_id
JOIN tracks t ON al.album_id = t.album_id
GROUP BY a.artist_id, a.name
ORDER BY track_count DESC
LIMIT 3;
