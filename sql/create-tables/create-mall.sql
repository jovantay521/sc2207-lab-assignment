CREATE TABLE Mall (
    MallID INT PRIMARY KEY,
    Address VARCHAR(255),
    NumberOfShops INT,
    MallManagementCompanyID INT,
    MallName VARCHAR(255)
    FOREIGN KEY (MallManagementCompanyID) REFERENCES MallManagementCompany(MallManagementCompanyID)
);