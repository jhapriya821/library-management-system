use library_management;

CREATE TABLE authors (
    author_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(100) NOT NULL,
    last_name   VARCHAR(100) NOT NULL,
    rating      VARCHAR(5) DEFAULT 1,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE books (
    book_id         INT PRIMARY KEY AUTO_INCREMENT,
    author_id       INT NOT NULL,
    title           VARCHAR(255) NOT NULL,
    published_at    DATE NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);