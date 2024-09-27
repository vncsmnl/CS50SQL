# Design Document

By Vinicius Ribeiro

Video overview: [https://www.youtube.com/](https://www.youtube.com/)

## Scope

The purpose of this database is to manage a book catalog for a library or bookstore. The database will store information about books, authors, categories, and the relationships between them.

The scope of this database includes:

* Books: including title, author, publication year, and category
* Authors: including name and birth date
* Categories: including name
* Relationships between books, authors, and categories

The following are outside the scope of this database:

* Book publishers and ISBN numbers
* Book reviews and ratings
* User authentication and access control

## Functional Requirements

A user should be able to:

* Search for books by title, author, or category
* View information about a specific book, including its author and category
* Add, update, and delete books, authors, and categories
* View a list of all books, authors, and categories

Beyond the scope of what a user should be able to do with this database is:

* Manage user accounts and access control
* Track book borrowing and lending
* Generate reports on book sales or borrowing trends

## Representation

### Entities

The following entities will be represented in this database:

* **Books**: represents a book in the catalog
	+ Attributes:
		- `book_id` (primary key): unique identifier for the book
		- `title`: title of the book
		- `author_id` (foreign key): reference to the author of the book
		- `publication_year`: year the book was published
	+ Type: The `book_id` attribute is an integer, while the `title` and `author_id` attributes are strings. The `publication_year` attribute is an integer.
	+ Constraints: The `book_id` attribute is unique and not null, while the `title` and `author_id` attributes are not null.
* **Authors**: represents an author in the catalog
	+ Attributes:
		- `author_id` (primary key): unique identifier for the author
		- `first_name`: first name of the author
		- `last_name`: last name of the author
		- `birth_date`: birth date of the author
	+ Type: The `author_id` attribute is an integer, while the `first_name` and `last_name` attributes are strings. The `birth_date` attribute is a date.
	+ Constraints: The `author_id` attribute is unique and not null, while the `first_name` and `last_name` attributes are not null.
* **Categories**: represents a category in the catalog
	+ Attributes:
		- `category_id` (primary key): unique identifier for the category
		- `name`: name of the category
	+ Type: The `category_id` attribute is an integer, while the `name` attribute is a string.
	+ Constraints: The `category_id` attribute is unique and not null, while the `name` attribute is not null.

### Relationships

The relationships between entities are as follows:

* A book is written by one author (one-to-one).
* An author can write many books (one-to-many).
* A book can belong to many categories (many-to-many).
* A category can have many books (many-to-many).

Entity Relationship Diagram:

```
+---------------+
|     Books    |
+---------------+
|  book_id (PK) |
|  title        |
|  author_id (FK)|
|  publication_year|
+---------------+
       |
       |  one-to-one
       |
       v
+---------------+
|    Authors   |
+---------------+
|  author_id (PK)|
|  first_name    |
|  last_name     |
|  birth_date    |
+---------------+
       |
       |  one-to-many
       |
       v
+---------------+
|     Books    |
+---------------+
|  book_id (PK) |
|  title        |
|  author_id (FK)|
|  publication_year|
+---------------+
       |
       |  many-to-many
       |
       v
+---------------+
|  Categories  |
+---------------+
|  category_id (PK)|
|  name          |
+---------------+
       |
       |  many-to-many
       |
       v
+---------------+
|     Books    |
+---------------+
|  book_id (PK) |
|  title        |
|  author_id (FK)|
|  publication_year|
+---------------+
```

## Optimizations

The following optimizations were created:

* An index on `books.title` to improve query performance for searching by title.
* An index on `authors.first_name` and `authors.last_name` to improve query performance for searching by author name.
* An index on `categories.name` to improve query performance for searching by category name.

## Limitations

The limitations of this design are:

* The database does not store information about book publishers or ISBN numbers.
* The database does not store information about book reviews or ratings.
* The database does not support multiple authors for a single book.
* The database does not support user authentication and access control.
