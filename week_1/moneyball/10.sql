SELECT players.first_name, players.last_name, salaries.salary, performances.HR, salaries.year
FROM salaries
JOIN performances ON salaries.player_id = performances.player_id AND salaries.year = performances.year
JOIN players ON salaries.player_id = players.id
ORDER BY players.id, salaries.year DESC, performances.HR DESC, salaries.salary DESC;
