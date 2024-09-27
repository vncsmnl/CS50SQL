SELECT title
FROM episodes
WHERE air_date < '2005-01-01' AND topic IS NOT NULL;
