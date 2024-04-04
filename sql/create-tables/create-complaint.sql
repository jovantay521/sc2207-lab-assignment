CREATE TABLE Complaint (
    ComplaintID VARCHAR(255) PRIMARY KEY,
    FiledDateTime DATETIME,
    Text TEXT,
    Status VARCHAR(255),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);