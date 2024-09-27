SELECT DISTINCT teams.name
FROM teams
JOIN performances ON teams.id = performances.team_id
JOIN players ON performances.player_id = players.id
WHERE players.first_name = 'Satchel' AND players.last_name = 'Paige';
