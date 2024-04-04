CREATE TABLE ShoppingRecord (
    InvoiceID VARCHAR(255) PRIMARY KEY,
    UserID INT,
    ShopID VARCHAR(255),
    DateTimeIn DATETIME,
    DateTimeOut DATETIME,
    AmountSpent DECIMAL(10,2),
    ItemPurchased TEXT,
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);