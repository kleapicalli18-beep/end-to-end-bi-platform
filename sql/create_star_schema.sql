CREATE TABLE DimCustomer (
    CustomerKey INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Gender VARCHAR(10),
    Income VARCHAR(50),
    Education VARCHAR(100),
    Occupation VARCHAR(100),
    MaritalStatus VARCHAR(20)
);

CREATE TABLE DimProduct (
    ProductKey INT PRIMARY KEY,
    ProductName VARCHAR(200),
    CategoryName VARCHAR(100),
    SubcategoryName VARCHAR(100),
    ProductCost FLOAT,
    ProductPrice FLOAT,
    Profit FLOAT,
    ProductColor VARCHAR(50),
    ProductSize VARCHAR(20),
    ProductStyle VARCHAR(20)
);

CREATE TABLE DimDate (
    Date DATE PRIMARY KEY,
    Year INT,
    Month INT,
    MonthName VARCHAR(20),
    Quarter INT,
    Week INT,
    DayName VARCHAR(20)
);

CREATE TABLE DimTerritory (
    TerritoryKey INT PRIMARY KEY,
    Region VARCHAR(100),
    Country VARCHAR(100),
    [Group] VARCHAR(100)
);

CREATE TABLE FactSales (
    SalesKey VARCHAR(50) PRIMARY KEY,
    OrderDate DATE,
    OrderNumber VARCHAR(50),
    OrderLineItem INT,
    ProductKey INT FOREIGN KEY REFERENCES DimProduct(ProductKey),
    CustomerKey INT FOREIGN KEY REFERENCES DimCustomer(CustomerKey),
    TerritoryKey INT FOREIGN KEY REFERENCES DimTerritory(TerritoryKey),
    OrderQuantity INT
);

CREATE TABLE FactReturns (
    ReturnDate DATE,
    TerritoryKey INT FOREIGN KEY REFERENCES DimTerritory(TerritoryKey),
    ProductKey INT FOREIGN KEY REFERENCES DimProduct(ProductKey),
    ReturnQuantity INT
);