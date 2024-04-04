CREATE TABLE DayPackage (
    DayPackageID VARCHAR(255),
    UserID INT,
    Description TEXT,
    VoucherID VARCHAR(255),
    PRIMARY KEY (DayPackageID, UserID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID)
);