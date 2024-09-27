-- Create the Passengers table
CREATE TABLE Passengers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    age INTEGER NOT NULL
);

-- Create the Airlines table
CREATE TABLE Airlines (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    concourse TEXT NOT NULL CHECK (concourse IN ('A', 'B', 'C', 'D', 'E', 'F', 'T'))
);

-- Create the Flights table
CREATE TABLE Flights (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    flight_number TEXT NOT NULL,
    airline_id INTEGER NOT NULL,
    departure_airport_code TEXT NOT NULL,
    arrival_airport_code TEXT NOT NULL,
    expected_departure DATETIME NOT NULL,
    expected_arrival DATETIME NOT NULL,
    FOREIGN KEY (airline_id) REFERENCES Airlines(id)
);

-- Create the CheckIns table
CREATE TABLE CheckIns (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    check_in_time DATETIME NOT NULL,
    passenger_id INTEGER NOT NULL,
    flight_id INTEGER NOT NULL,
    FOREIGN KEY (passenger_id) REFERENCES Passengers(id),
    FOREIGN KEY (flight_id) REFERENCES Flights(id)
);
