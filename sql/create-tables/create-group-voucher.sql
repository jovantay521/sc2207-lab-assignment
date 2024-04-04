CREATE TABLE GroupVoucher (
    VoucherID VARCHAR(255) PRIMARY KEY,
    GroupSize INT,
    GroupDiscount DECIMAL(10,2),
    UserID INT,
    DateTime DATETIME,
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);