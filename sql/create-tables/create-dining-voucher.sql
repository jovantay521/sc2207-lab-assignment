CREATE TABLE DiningVoucher (
    VoucherID VARCHAR(255) PRIMARY KEY,
    CashDiscount DECIMAL(10,2),
    UserID INT,
    DateTime DATETIME,
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);