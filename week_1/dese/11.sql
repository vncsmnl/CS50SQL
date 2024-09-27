SELECT s.name, e.per_pupil_expenditure, g.graduated
FROM schools s
JOIN expenditures e ON s.district_id = e.district_id
JOIN graduation_rates g ON s.id = g.school_id
ORDER BY e.per_pupil_expenditure DESC, s.name ASC;
