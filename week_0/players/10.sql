SELECT first_name, last_name, birth_year AS "Year of Birth"
FROM players
WHERE weight > 200
ORDER BY birth_year DESC;
