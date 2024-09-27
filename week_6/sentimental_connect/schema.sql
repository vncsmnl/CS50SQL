CREATE TABLE Users (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(128) NOT NULL
);

CREATE TABLE Schools (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    location VARCHAR(100) NOT NULL,
    founded_year INT UNSIGNED NOT NULL
);

CREATE TABLE Companies (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    industry ENUM('Technology', 'Education', 'Business') NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE Connections (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    connected_user_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (connected_user_id) REFERENCES Users(id)
);

CREATE TABLE SchoolAffiliations (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    school_id INT UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    degree VARCHAR(10) NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (school_id) REFERENCES Schools(id)
);

CREATE TABLE CompanyAffiliations (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id INT UNSIGNED NOT NULL,
    company_id INT UNSIGNED NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NULL,
    title VARCHAR(50) NULL,
    FOREIGN KEY (user_id) REFERENCES Users(id),
    FOREIGN KEY (company_id) REFERENCES Companies(id)
);
