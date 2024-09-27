-- Create a staging table to hold the imported data
CREATE TABLE meteorites_staging (
    name TEXT,
    id INT,
    nametype TEXT,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year INT,
    lat REAL,
    long REAL,
    PRIMARY KEY(id)
);

-- Import the data from meteorites.csv into the staging table
.import --csv --skip 1 meteorites.csv meteorites_staging

-- Clean the data in the staging table
UPDATE meteorites_staging
SET mass = NULL
WHERE mass = '';

UPDATE meteorites_staging
SET year = NULL
WHERE year = '';

UPDATE meteorites_staging
SET lat = NULL
WHERE lat = '';

UPDATE meteorites_staging
SET long = NULL
WHERE long = '';

UPDATE meteorites_staging
SET mass = ROUND(mass, 2),
    lat = ROUND(lat, 2),
    long = ROUND(long, 2);

DELETE FROM meteorites_staging
WHERE nametype = 'Relict';

-- Create the final meteorites table
CREATE TABLE meteorites (
    id INT,
    name TEXT,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year INT,
    lat REAL,
    long REAL,
    PRIMARY KEY(id)
);

-- Insert the cleaned data into the meteorites table
INSERT INTO meteorites (id, name, class, mass, discovery, year, lat, long)
SELECT ROW_NUMBER() OVER (ORDER BY year, name),
       name,
       class,
       mass,
       discovery,
       year,
       lat,
       long
FROM meteorites_staging;

-- Drop the staging table
DROP TABLE meteorites_staging;
