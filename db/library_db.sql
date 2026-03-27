use library_management;

CREATE TABLE authors (
    author_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(100) NOT NULL,
    last_name   VARCHAR(100) NOT NULL,
    rating      VARCHAR(5) DEFAULT 1
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title varchar(50) NOT NULL,

)