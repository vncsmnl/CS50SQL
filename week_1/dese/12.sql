SELECT d.name, e.per_pupil_expenditure, se.exemplary
FROM districts d
JOIN expenditures e ON d.id = e.district_id
JOIN staff_evaluations se ON d.id = se.district_id
WHERE e.per_pupil_expenditure > (SELECT AVG(per_pupil_expenditure) FROM expenditures)
  AND se.exemplary > (SELECT AVG(exemplary) FROM staff_evaluations)
  AND d.type = 'Public School District'
ORDER BY se.exemplary DESC, e.per_pupil_expenditure DESC;
