CREATE TABLE Complaint (
    ComplaintID INT PRIMARY KEY,
    FiledDateTime DATETIME,
    Text TEXT,
    Status VARCHAR(255),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);