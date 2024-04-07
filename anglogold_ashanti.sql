-- Create database for AngloGold Ashanti Mining Company
CREATE DATABASE AngloGoldAshantiDB;

-- Use the newly created database
USE AngloGoldAshantiDB;

-- Create table for employees
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Position VARCHAR(100),
    Department VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    HireDate DATE
);

-- Create table for mines
CREATE TABLE Mines (
    MineID INT PRIMARY KEY,
    MineName VARCHAR(100),
    Location VARCHAR(100),
    Capacity INT,
    ProductionStatus VARCHAR(50),
    OpenDate DATE,
    CloseDate DATE
);

-- Create table for production data
CREATE TABLE ProductionData (
    ProductionID INT PRIMARY KEY,
    MineID INT,
    EmployeeID INT,
    ProductionDate DATE,
    ProductionAmount DECIMAL(10, 2),
    FOREIGN KEY (MineID) REFERENCES Mines(MineID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- Create table for equipment
CREATE TABLE Equipment (
    EquipmentID INT PRIMARY KEY,
    EquipmentName VARCHAR(100),
    MineID INT,
    Status VARCHAR(50),
    FOREIGN KEY (MineID) REFERENCES Mines(MineID)
);

-- Create table for maintenance records
CREATE TABLE MaintenanceRecords (
    RecordID INT PRIMARY KEY,
    EquipmentID INT,
    MaintenanceDate DATE,
    Description VARCHAR(255),
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);

-- Create table for safety incidents
CREATE TABLE SafetyIncidents (
    IncidentID INT PRIMARY KEY,
    MineID INT,
    EmployeeID INT,
    IncidentDate DATE,
    Description VARCHAR(255),
    FOREIGN KEY (MineID) REFERENCES Mines(MineID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);