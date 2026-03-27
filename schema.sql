CREATE DATABASE LianesLibrary;
USE LianesLibrary;

CREATE TABLE Books (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255),
    IsBorrowed TINYINT(1) DEFAULT 0
);

CREATE TABLE Friends (
    FriendID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE
);
INSERT INTO Friends (Name, Email)
VALUES 
('Liane Reader', 'liane@example.com'),
('Sarah Connor', 'sarah@sky.net'),
('James Bond', '007@mi6.gov');

ALTER TABLE Books ADD COLUMN Genre VARCHAR(50);
INSERT INTO Books (Title, Author, Genre)
VALUES 
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy'),
('1984', 'George Orwell', 'Dystopian'),
('Dune', 'Frank Herbert', 'Sci-Fi');

SELECT * FROM Friends;
SELECT * FROM Books;

CREATE TABLE Loans (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BookID INT,
    FriendID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (FriendID) REFERENCES Friends(FriendID)
);

-- 1. Record the loan
INSERT INTO Loans (BookID, FriendID, LoanDate)
VALUES (1, 2, CURDATE());

-- 2. Mark the book as "Borrowed" in the library
UPDATE Books 
SET IsBorrowed = 1 
WHERE BookID = 1;

SELECT 
    Friends.Name AS Borrower, 
    Books.Title AS Book_Borrowed, 
    Loans.LoanDate
FROM Loans
JOIN Friends ON Loans.FriendID = Friends.FriendID
JOIN Books ON Loans.BookID = Books.BookID;