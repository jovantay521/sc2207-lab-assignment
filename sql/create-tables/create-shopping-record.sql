CREATE TABLE ShoppingRecord (
    InvoiceID INT PRIMARY KEY,
    UserID INT,
    ShopID INT,
    DateTimeIn DATETIME,
    DateTimeOut DATETIME,
    AmountSpent DECIMAL(10,2),
    ItemPurchased TEXT,
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);