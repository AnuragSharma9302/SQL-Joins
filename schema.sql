-- Database Schema (PostgreSQL)

-- Create Products table
CREATE TABLE Products (
ProductID SERIAL PRIMARY KEY,
ProductName VARCHAR(100) NOT NULL,
Price NUMERIC(10,2) NOT NULL
);

-- Create Orders table
CREATE TABLE Orders (
OrderID SERIAL PRIMARY KEY,
ProductID INT REFERENCES Products(ProductID),
Quantity INT NOT NULL,
OrderDate DATE
);
