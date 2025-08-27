1-5sql

각 장르별 트랙 수 집계

각 장르(genres.name)별로 트랙 수를 집계하고, 트랙 수 내림차순으로 정렬하세요.

SELECT 
  g.name         AS genre, 
  COUNT(t.track_id) AS track_count
FROM genres AS g
JOIN tracks AS t 
  ON g.genre_id = t.genre_id
GROUP BY g.name
ORDER BY track_count DESC;
