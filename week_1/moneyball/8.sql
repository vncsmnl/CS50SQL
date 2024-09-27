SELECT s.salary
FROM salaries s
JOIN (
  SELECT player_id
  FROM performances
  WHERE year = 2001 AND hr = (
    SELECT MAX(hr)
    FROM performances
    WHERE year = 2001
  )
) p ON s.player_id = p.player_id
WHERE s.year = 2001;
