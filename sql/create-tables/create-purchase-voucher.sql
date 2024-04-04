CREATE TABLE PurchaseVoucher (
    VoucherID VARCHAR(255) PRIMARY KEY,
    PurchaseDiscount DECIMAL(10,2),
    UserID INT,
    DateTime DATETIME,
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);