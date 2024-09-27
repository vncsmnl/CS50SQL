-- Insert authors
INSERT INTO authors (author_id, first_name, last_name, birth_date)
VALUES
  (1, 'John', 'Doe', '1990-01-01'),
  (2, 'Jane', 'Smith', '1985-06-15'),
  (3, 'Bob', 'Johnson', '1992-03-20');

-- Insert books
INSERT INTO books (book_id, title, author_id, publication_year)
VALUES
  (1, 'The Lord of the Rings', 1, 2001),
  (2, 'The Origin of Species', 2, 1859),
  (3, 'The Little Prince', 3, 1943);

-- Insert categories
INSERT INTO categories (category_id, name)
VALUES
  (1, 'Fiction'),
  (2, 'Non-Fiction'),
  (3, 'Children');

-- Insert books by category
INSERT INTO books_by_category (book_id, category_id)
VALUES
  (1, 1),
  (2, 2),
  (3, 3);

-- Select all books by an author
SELECT * FROM books WHERE author_id = 1;

-- Select all books in a category
SELECT * FROM books
JOIN books_by_category ON books.book_id = books_by_category.book_id
WHERE books_by_category.category_id = 1;

-- Update the title of a book
UPDATE books SET title = 'The Lord of the Rings - Special Edition' WHERE book_id = 1;

-- Delete a book
DELETE FROM books WHERE book_id = 2;
