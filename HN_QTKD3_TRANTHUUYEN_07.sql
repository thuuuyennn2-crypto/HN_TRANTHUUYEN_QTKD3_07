CREATE DATABASE LibraryManagement;
USE LibraryManagement;
CREATE TABLE Books (
BookId VARCHAR(10)PRIMARY KEY,
Title VARCHAR(100) NOT NULL, 
Author VARCHAR(100),
Price DECIMAL(10, 2),
Quantity INT
);
CREATE TABLE Readers (
ReaderId VARCHAR(10) PRIMARY KEY, 
ReaderName VARCHAR(100) NOT NULL,
PhoneNumber VARCHAR(15) UNIQUE, 
Address VARCHAR(255)
);
CREATE TABLE BorrowRecords (
Readerid VARCHAR(10) , 
BookId VARCHAR(10), 
BorrowDate DATE,
ReturnDate DATE,
BorrowedQuantity INT NOT NULL,
    PRIMARY KEY (ReaderId, BookId),
    FOREIGN KEY (ReaderId) REFERENCES Readers(ReaderId),
    FOREIGN KEY (BookId) REFERENCES Books(BookId)
);

INSERT INTO  Books (BookId, Title, Author, Price, Quantity) VALUES
('S001', 'Dac Nhan Tam', 'Dale Carnegie', 80000, 20),
('S002', 'Nha Gia Kim', 'Paulo Coelho', 75000, 15),
('S003', 'De Men Phieu Luu Ky', 'To Hoai', 50000, 30);

INSERT INTO  Readers (ReaderId, ReaderName, PhoneNumber, Address) VALUES
('DG01', 'Nguyen Thi Hue', '0987654321', 'Ha Noi'),
('DG02', 'Tran Van Nam', '0981122334', 'Hai Duong'),
('DG03', 'Le Thi Lan', '0989988776', 'Ha Noi'),
('DG04', 'Pham Minh Khoi', '0912345678', 'Da Nang'),
('DG05', 'Hoang Van Dat', '0905123456', 'Ha Noi');

INSERT INTO BorrowRecords (ReaderId, BookId, BorrowDate, ReturnDate, BorrowedQuantity) VALUES
('DG01', 'S001', '2023-11-01', '2023-11-08', 1),
('DG01', 'S002', '2023-11-05', '2023-11-12', 2),
('DG02', 'S001', '2023-11-10', NULL, 1),
('DG03', 'S003', '2023-11-15', '2023-11-20', 3),
('DG04', 'S002', '2023-11-15', NULL, 1),
('DG04', 'S003', '2023-11-18', NULL, 2),
('DG05', 'S001', '2023-11-20', '2023-11-25', 1);
UPDATE Books
SET Price = 90000
WHERE BookId = 'S001';

UPDATE BorrowRecords
SET ReturnDate = '2023-11-17'
WHERE ReaderId = 'DG02' AND BookId = 'S001';

DELETE FROM BorrowRecords
WHERE ReaderId = 'DG05' AND BookId = 'S001';

SELECT BookId, Title, Author
FROM Books
WHERE Author = 'To Hoai';

SELECT ReaderId, ReaderName
FROM Readers
WHERE Address = 'Ha Noi';

SELECT ReaderId, BookId, BorrowDate
FROM BorrowRecords
WHERE ReturnDate IS NULL;

SELECT *
FROM Books
WHERE Title LIKE '%Nhan%';

SELECT ReaderId, BookId, BorrowDate, BorrowedQuantity
FROM BorrowRecords
ORDER BY BorrowedQuantity DESC;

SELECT * 
FROM Books
ORDER BY Price DESC;

SELECT BookId, SUM(BorrowedQuantity) AS TotalBorrowed
FROM BorrowRecords
GROUP BY BookId;

SELECT ReaderId, COUNT(*) AS BorrowedTimes
FROM BorrowRecords
GROUP BY ReaderId;

SELECT ReaderId, SUM(BorrowedQuantity) AS TotalBooksBorrowed
FROM BorrowRecords
GROUP BY ReaderId
HAVING SUM(BorrowedQuantity) >= 3;



