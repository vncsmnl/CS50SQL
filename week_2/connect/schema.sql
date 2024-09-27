-- Create Users table
CREATE TABLE Users (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    username TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL
);

-- Create Schools table
CREATE TABLE Schools (
    school_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    school_type TEXT NOT NULL,
    location TEXT NOT NULL,
    founded_year INTEGER NOT NULL
);

-- Create Companies table
CREATE TABLE Companies (
    company_id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    industry TEXT NOT NULL,
    location TEXT NOT NULL
);

-- Create User_School_Affiliations table
CREATE TABLE User_School_Affiliations (
    affiliation_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    school_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    degree_type TEXT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (school_id) REFERENCES Schools(school_id)
);

-- Create User_Company_Affiliations table
CREATE TABLE User_Company_Affiliations (
    affiliation_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER NOT NULL,
    company_id INTEGER NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    title TEXT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (company_id) REFERENCES Companies(company_id)
);

-- Sample Data Insertion
INSERT INTO Users (first_name, last_name, username, password) VALUES
('Alan', 'Garber', 'alan', 'password'),
('Reid', 'Hoffman', 'reid', 'password');

INSERT INTO Schools (name, school_type, location, founded_year) VALUES
('Harvard University', 'University', 'Cambridge, Massachusetts', 1636);

INSERT INTO Companies (name, industry, location) VALUES
('LinkedIn', 'Technology', 'Sunnyvale, California');

INSERT INTO User_School_Affiliations (user_id, school_id, start_date, end_date, degree_type) VALUES
(1, 1, '1973-09-01', '1976-06-01', 'BA');

INSERT INTO User_Company_Affiliations (user_id, company_id, start_date, end_date, title) VALUES
(2, 1, '2003-01-01', '2007-02-01', 'CEO and Chairman');
