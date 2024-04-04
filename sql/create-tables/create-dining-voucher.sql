CREATE TABLE DiningVoucher (
    VoucherID INT,
    CashDiscount DECIMAL(10,2),
    UserID INT,
    DateTime DATETIME,
    PRIMARY KEY (VoucherID, UserID),
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);