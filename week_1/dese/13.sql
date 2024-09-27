SELECT d.name AS district_name, COUNT(s.id) AS public_school_count
FROM districts d
JOIN schools s ON d.id = s.district_id
WHERE s.type = 'Public School'
GROUP BY d.name
HAVING public_school_count > 5
ORDER BY public_school_count DESC;
