-- *** The Lost Letter ***
-- Check if both addresses exist and what type of address they are.
WITH address_check AS (
    SELECT *
    FROM addresses
    WHERE address IN ('900 Somerville Avenue', '2 Finnegan Street')
),
package_info AS (
    SELECT *
    FROM packages
    WHERE from_address_id = (SELECT id FROM address_check WHERE address = '900 Somerville Avenue')
),
destination_address AS (
    SELECT *
    FROM addresses
    WHERE id IN (SELECT to_address_id FROM package_info WHERE contents = 'Congratulatory letter')
),
scans_info AS (
    SELECT *
    FROM scans
    WHERE package_id = (SELECT id FROM package_info WHERE contents = 'Congratulatory letter')
)

SELECT * FROM address_check;
SELECT * FROM package_info;
SELECT * FROM destination_address;
SELECT * FROM scans_info;

-- *** The Devious Delivery ***
-- Check for packages with no "From" address.
WITH missing_from_address AS (
    SELECT *
    FROM packages
    WHERE from_address_id IS NULL
),
destination_info AS (
    SELECT *
    FROM addresses
    WHERE id IN (SELECT to_address_id FROM missing_from_address)
),
scans_missing AS (
    SELECT *
    FROM scans
    WHERE package_id = (SELECT id FROM missing_from_address)
)

SELECT * FROM missing_from_address;
SELECT * FROM destination_info;
SELECT * FROM scans_missing;

-- *** The Forgotten Gift ***
-- Track down the mystery gift sent to the granddaughter.
WITH gift_addresses AS (
    SELECT *
    FROM addresses
    WHERE address IN ('728 Maple Place', '109 Tileston Street')
),
gift_package AS (
    SELECT *
    FROM packages
    WHERE from_address_id = (SELECT id FROM gift_addresses WHERE address = '109 Tileston Street')
      AND to_address_id = (SELECT id FROM gift_addresses WHERE address = '728 Maple Place')
),
gift_scans AS (
    SELECT *
    FROM scans
    WHERE package_id = (SELECT id FROM gift_package)
),
driver_info AS (
    SELECT *
    FROM drivers
    WHERE id IN (SELECT DISTINCT driver_id FROM gift_scans)
)

SELECT * FROM gift_addresses;
SELECT * FROM gift_package;
SELECT * FROM gift_scans;
SELECT * FROM driver_info;
