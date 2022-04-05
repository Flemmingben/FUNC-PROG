-- :name create-user! :! :n
-- :doc creates a new user record
INSERT INTO users
(first_name, last_name, email, pass)
VALUES (:first_name, :last_name, :email, :pass);

-- :name update-user! :! :n
-- :doc updates an existing user record
UPDATE users
SET first_name = :first_name, last_name = :last_name, email = :email
WHERE id = :id;

-- :name get-user :? :1
-- :doc retrieves a user record given the id
SELECT * FROM users
WHERE id = :id;

-- :name delete-user! :! :n
-- :doc deletes a user record given the id
DELETE FROM users
WHERE id = :id;

-- :name get-users :? :*
-- :doc retrieves all user records
SELECT * FROM users;

-- :name get-user-by-email :? :*
-- :doc finds a user record by email address
select * from users
where email = :email

-- :name create-book! :! :n
-- :doc creates a new book record
INSERT INTO books
(isbn, title, author)
VALUES (:isbn, :title, :author);

-- :name update-book! :! :n
-- :doc updates an existing book record
UPDATE books
SET isbn = :isbn, title = :title, author = :author
WHERE id = :id;

-- :name get-book :? :1
-- :doc retrieves a book record given the id
SELECT * FROM books
WHERE id = :id;

-- :name delete-book! :! :n
-- :doc deletes a book record given the id
DELETE FROM books
WHERE id = :id;

-- :name get-books :? :*
-- :doc retrieves all book records
SELECT * FROM books;

-- :name create-review! :! :n
-- :doc creates a new review record
INSERT INTO reviews
(book_id, reviewer, published, review)
VALUES (:book_id, :reviewer, :published, :review);

-- :name update-review! :! :n
-- :doc updates an existing review record
UPDATE reviews
SET book_id = :book_id, reviewer = :reviewer, published = :published, review = :review
WHERE id = :id;

-- :name get-review :? :1
-- :doc retrieves a review record given the id
SELECT * FROM reviews
WHERE id = :id;

-- :name delete-review! :! :n
-- :doc deletes a review record given the id
DELETE FROM reviews
WHERE id = :id;

-- :name get-reviews :? :*
-- :doc retrieves all review records
SELECT * FROM reviews;

-- :name get-reviews-with-title :? :*
-- :doc perform a join across these tables
select title, REVIEW, REVIEWER, PUBLISHED
from BOOKS
join REVIEWS
where BOOKS.ID = REVIEWS.BOOK_ID;