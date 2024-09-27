SELECT players.first_name, players.last_name
FROM salaries
JOIN players ON salaries.player_id = players.id
ORDER BY salaries.salary DESC
LIMIT 1;
