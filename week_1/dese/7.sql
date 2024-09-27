SELECT s.name
FROM schools s
JOIN districts d ON s.district_id = d.id
WHERE d.name = 'Cambridge';
