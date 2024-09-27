SELECT first_name, last_name
FROM players
WHERE birth_country NOT IN ('United States', 'USA', 'United States of America')
ORDER BY first_name, last_name;

