SELECT T1.friend_id
FROM friends AS T1
JOIN friends AS T2 ON T1.friend_id = T2.friend_id
WHERE T1.user_id = (SELECT id FROM users WHERE username = 'lovelytrust487')
AND T2.user_id = (SELECT id FROM users WHERE username = 'exceptionalinspiration482');
