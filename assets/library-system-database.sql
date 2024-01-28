CREATE DATABASE libproject1;
USE libproject1;
CREATE TABLE Branch (
  branch_id INT PRIMARY KEY AUTO_INCREMENT,
  branch_name VARCHAR(255) NOT NULL,
  branch_address VARCHAR(255) NOT NULL,
  branch_phone VARCHAR(20) NOT NULL,
  branch_email VARCHAR(50)
);

CREATE TABLE Employee (
  employee_id INT PRIMARY KEY AUTO_INCREMENT,
  employee_name VARCHAR(255) NOT NULL,
  employee_email VARCHAR(255) NOT NULL,
  employee_phone VARCHAR(20) NOT NULL,
  employee_address VARCHAR(255) NOT NULL,
  branch_id INT,
  POSITION VARCHAR (100),
  FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE Customer (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(255) NOT NULL,
  customer_email VARCHAR(255) NOT NULL,
  customer_phone VARCHAR(20) NOT NULL,
  customer_address VARCHAR(255) NOT NULL
);

CREATE TABLE Books (
  book_id INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  publication_date DATE NOT NULL,
  genre VARCHAR(255) NOT NULL,
  branch_id INT,
  ISBN INT,
  FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

CREATE TABLE Issue_Status (
  issue_id INT PRIMARY KEY AUTO_INCREMENT,
  book_id INT NOT NULL,
  customer_id INT NOT NULL,
  employee_id INT NOT NULL,
  issue_date DATE NOT NULL,
  due_date DATE NOT NULL,
  FOREIGN KEY (book_id) REFERENCES Books(book_id),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);

CREATE TABLE Return_Status (
  return_id INT PRIMARY KEY AUTO_INCREMENT,
  issue_id INT NOT NULL,
  return_date DATE NOT NULL,
  late_fee DECIMAL(10, 2) NOT NULL,
  FOREIGN KEY (issue_id) REFERENCES Issue_Status(issue_id)
);
INSERT INTO Branch (branch_name, branch_address, branch_phone, branch_email)
VALUES ('Moon Library', 'Crater 1, Moon', '+1234567890', 'moonlibrary@email.com');
INSERT INTO Employee (employee_name, employee_email, employee_phone, employee_address, branch_id, POSITION)
VALUES ('John Doe', 'johndoe@email.com', '+1234567890', 'Moon Street 1, Moon', 1, 'Manager'),
       ('Jane Smith', 'janesmith@email.com', '+2345678901', 'Moon Street 2, Moon', 1, 'Librarian'),
       ('Alice Johnson', 'alicejohnson@email.com', '+3456789012', 'Moon Street 3, Moon', 1, 'Assistant'),
       ('Bob Brown', 'bobbrown@email.com', '+4567890123', 'Moon Street 4, Moon', 1, 'Manager'),
       ('Charlie Green', 'charliegreen@email.com', '+5678901234', 'Moon Street 5, Moon', 1, 'Librarian');
       INSERT INTO Customer (customer_name, customer_email, customer_phone, customer_address)
VALUES ('Michael Scott', 'michaelscott@email.com', '+1234567890', 'Moon Street 6, Moon'),
       ('Pam Beesly', 'pambeesly@email.com', '+2345678901', 'Moon Street 7, Moon'),
       ('Jim Halpert', 'jimhalpert@email.com', '+3456789012', 'Moon Street 8, Moon'),
       ('Dwight Schrute', 'dwightschrute@email.com', '+4567890123', 'Moon Street 9, Moon'),
       ('Angela Martin', 'angelamartin@email.com', '+5678901234', 'Moon Street 10, Moon');
       INSERT INTO Books (title, author, publication_date, genre, branch_id, ISBN)
VALUES ('Moon Adventures', 'Arthur Moon', '2023-01-01', 'Science Fiction', 1, 1000000001),
       ('Lunar Chronicles', 'Luna Star', '2023-02-01', 'Fantasy', 1, 1000000002),
       ('Cosmic Tales', 'Cosmo Galaxy', '2023-03-01', 'Adventure', 1, 1000000003),
       ('Galactic Odyssey', 'Galaxia Space', '2023-04-01', 'Mystery', 1, 1000000004),
       ('Stellar Stories', 'Stella Comet', '2023-05-01', 'Romance', 1, 1000000005);
       INSERT INTO Issue_Status (book_id, customer_id, employee_id, issue_date, due_date)
VALUES (1, 1, 1, '2023-06-01', '2023-06-15'),
       (2, 2, 2, '2023-06-02', '2023-06-16'),
       (3, 3, 3, '2023-06-03', '2023-06-17'),
       (4, 4, 4, '2023-06-04', '2023-06-18'),
       (5, 5, 5, '2023-06-05', '2023-06-19');
       INSERT INTO Return_Status (issue_id, return_date, late_fee)
VALUES (1, '2023-06-15', 0.00),
       (2, '2023-06-16', 0.00),
       (3, '2023-06-18', 5.00),
       (4, '2023-06-18', 0.00),
       (5, '2023-06-20', 10.00);