-- Create authors table
CREATE TABLE authors (
  author_id INT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  birth_date DATE
);

-- Create books table
CREATE TABLE books (
  book_id INT PRIMARY KEY,
  title VARCHAR(200) NOT NULL,
  author_id INT NOT NULL,
  publication_year INT,
  FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

-- Create categories table
CREATE TABLE categories (
  category_id INT PRIMARY KEY,
  name VARCHAR(100) NOT NULL
);

-- Create books by category table
CREATE TABLE books_by_category (
  book_id INT NOT NULL,
  category_id INT NOT NULL,
  PRIMARY KEY (book_id, category_id),
  FOREIGN KEY (book_id) REFERENCES books(book_id),
  FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Create index on books.title
CREATE INDEX idx_title ON books (title);
