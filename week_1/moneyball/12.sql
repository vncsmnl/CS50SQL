WITH hits AS (
    SELECT players.first_name, players.last_name, (salaries.salary / performances.H) AS "dollars per hit"
    FROM salaries
    JOIN performances ON salaries.player_id = performances.player_id AND salaries.year = performances.year
    JOIN players ON salaries.player_id = players.id
    WHERE salaries.year = 2001 AND performances.H > 0
    ORDER BY "dollars per hit" ASC
    LIMIT 10
),
rbis AS (
    SELECT players.first_name, players.last_name, (salaries.salary / performances.RBI) AS "dollars per RBI"
    FROM salaries
    JOIN performances ON salaries.player_id = performances.player_id AND salaries.year = performances.year
    JOIN players ON salaries.player_id = players.id
    WHERE salaries.year = 2001 AND performances.RBI > 0
    ORDER BY "dollars per RBI" ASC
    LIMIT 10
)
SELECT DISTINCT hits.first_name, hits.last_name
FROM hits
JOIN rbis ON hits.first_name = rbis.first_name AND hits.last_name = rbis.last_name
ORDER BY hits.last_name, hits.first_name;  -- Order by last name, then first name

