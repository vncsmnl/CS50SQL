SELECT s.name
FROM schools s
JOIN graduation_rates g ON s.id = g.school_id
WHERE g.graduated = 100;
