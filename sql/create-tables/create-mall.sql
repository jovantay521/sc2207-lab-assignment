CREATE TABLE Mall (
    MallID VARCHAR(255) PRIMARY KEY,
    Address VARCHAR(255),
    NumberOfShops INT,
    MallManagementCompanyID VARCHAR(255),
    MallName VARCHAR(255),
    FOREIGN KEY (MallManagementCompanyID) REFERENCES MallManagementCompany(MallManagementCompanyID)
);