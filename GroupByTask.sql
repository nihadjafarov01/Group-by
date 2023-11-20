CREATE TABLE Positions
(
    Id int identity primary key,
    Name nvarchar(30)
)

CREATE TABLE Employees
(
    Id int identity primary key,
    Name nvarchar(30),
    Surname nvarchar(30),
    FatherName nvarchar(30),
    PositionId int REFERENCES Positions(Id),
    Salary decimal
)

CREATE TABLE Branches
(
    Id int identity primary key,
    Name nvarchar(30)
)

CREATE TABLE Products
(
    Id int identity primary key,
    Name nvarchar(255),
    BuyingPrice decimal,
    SellingPrice decimal,
)

CREATE TABLE Selling
(
    ProductId int REFERENCES Products(Id),
    EmployeeId int REFERENCES Employees(Id),
    SellingDate datetime DEFAULT getutcdate()
)

INSERT INTO Positions(Name)
VALUES ('Manager'), ('Engineer'), ('Analyst'), ('HR Specialist'), ('Developer'), ('Designer'), ('Accountant'), ('Sales Representative')

INSERT INTO Employees(name, surname, fathername, positionid, salary)
VALUES ('John','Doe','Michael',1,75000),
       ('Alice','Smith','Robert',2,60000),
       ('James','Johnson','David',3,55000),
       ('Emily','Williams','Andrew',4,65000),
       ('Sarah','Brown','Christopher',5,70000),
       ('Michael','Jones','Richard',6,60000),
       ('Emma','Miller','William',7,58000),
       ('Matthew','Davis','Thomas',8,62000)

INSERT INTO Branches (Name)
VALUES ('Main Branch'), ('North Branch'), ('East Branch'), ('West Branch'), ('South Branch'), ('Central Branch'), ('Regional Branch'), ('Regional Branch')

INSERT INTO Products (Name, BuyingPrice, SellingPrice)
VALUES
    ('Laptop',800,1200),
    ('Printer',200,350),
    ('Smartphone',300,500),
    ('Tablet',150,250),
    ('Desktop',1000,1500),
    ('Headphones',50,80),
    ('Monitor',250,400),
    ('Mouse',10,20)

INSERT INTO Employees (Name, Surname, FatherName, PositionId, Salary)
VALUES
    ('Matthew','Davis','Thomas',8,62000),
    ('Olivia','Anderson','Joseph',8,60000),
    ('Nathan','White','Benjamin',8,65000),
    ('Grace','Clark','Edward',8,63000),
    ('Logan','Hall','Charles',8,61000)

INSERT INTO Selling (ProductId, EmployeeId)
VALUES (1,8),
       (2,9),
       (3,10),
       (4,11),
       (5,12),
       (6,13)

ALTER TABLE Selling
ADD Branchİd int REFERENCES Branches(Id)
SELECT * FROM Branches

UPDATE Selling
SET Selling.Branchİd = 6
WHERE Selling.ProductId = 6
SELECT * FROM Selling
---------------------------------- 1)
SELECT concat(A.Name,' ',A.Surname) AS Employee, c.Name, d.Name, c.BuyingPrice, c.SellingPrice FROM Employees AS A
JOIN Selling AS B ON A.Id = B.EmployeeId
JOIN Products AS C ON B.ProductId = C.Id
JOIN Branches AS D ON D.Id = B.Branchİd
---------------------------------- 2)
SELECT SUM(B.SellingPrice) AS TotalSelling FROM Selling AS A
JOIN Products AS B ON B.Id = A.ProductId
---------------------------------- 3)
SELECT SUM(B.SellingPrice - B.BuyingPrice) AS TotalProfit
FROM Selling AS A
JOIN Products AS B ON B.Id = A.ProductId
WHERE A.SellingDate > DATEADD(MONTH , -1, GETUTCDATE())
--Tarixi bele yazmagi kecmediyimizin ferqindeyem, basqa yolla yaza bilmedim (
