-- schema.sql

-- Table to store ingredients
CREATE TABLE Ingredients (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    price_per_unit REAL NOT NULL,
    unit TEXT NOT NULL
);

-- Table to store donuts
CREATE TABLE Donuts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    gluten_free BOOLEAN NOT NULL,
    price REAL NOT NULL
);

-- Table to store the relationship between donuts and ingredients
CREATE TABLE DonutIngredients (
    donut_id INTEGER,
    ingredient_id INTEGER,
    PRIMARY KEY (donut_id, ingredient_id),
    FOREIGN KEY (donut_id) REFERENCES Donuts(id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredients(id)
);

-- Table to store customers
CREATE TABLE Customers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

-- Table to store orders
CREATE TABLE Orders (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    customer_id INTEGER,
    order_number INTEGER NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(id)
);

-- Table to store the relationship between orders and donuts
CREATE TABLE OrderDonuts (
    order_id INTEGER,
    donut_id INTEGER,
    quantity INTEGER NOT NULL,
    PRIMARY KEY (order_id, donut_id),
    FOREIGN KEY (order_id) REFERENCES Orders(id),
    FOREIGN KEY (donut_id) REFERENCES Donuts(id)
);
