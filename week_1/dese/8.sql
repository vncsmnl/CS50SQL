SELECT d.name, e.pupils
FROM districts d
JOIN expenditures e ON d.id = e.district_id;
