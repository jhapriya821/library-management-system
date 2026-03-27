use library_management;

CREATE TABLE authors (
    author_id   INT PRIMARY KEY AUTO_INCREMENT,
    first_name  VARCHAR(100) NOT NULL,
    last_name   VARCHAR(100) NOT NULL,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE books (
    book_id         INT PRIMARY KEY AUTO_INCREMENT,
    author_id       INT NOT NULL,
    title           VARCHAR(255) NOT NULL,
    published_at    DATE NOT NULL,
    rating          VARCHAR(5) DEFAULT 1,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (author_id) REFERENCES authors(author_id)
);

CREATE TABLE friends (
    friend_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);
INSERT INTO friends (name, email)
VALUES 
('Liane Reader', 'liane@example.com'),
('Sarah Connor', 'sarah@sky.net'),
('James Bond', '007@mi6.gov');