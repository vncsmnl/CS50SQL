CREATE VIEW message AS
SELECT substr(s.sentence, t.start, t.length) AS phrase
FROM sentences s
JOIN (
  SELECT 14 AS id, 98 AS start, 4 AS length UNION
  SELECT 114, 3, 5 UNION
  SELECT 618, 72, 9 UNION
  SELECT 630, 7, 3 UNION
  SELECT 932, 12, 5 UNION
  SELECT 2230, 50, 7 UNION
  SELECT 2346, 44, 10 UNION
  SELECT 3041, 14, 5
) t
ON s.id = t.id;
