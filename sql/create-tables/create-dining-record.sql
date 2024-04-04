CREATE TABLE DiningRecord (
    ReceiptID VARCHAR(255) PRIMARY KEY,
    UserID INT,
    OutletID VARCHAR(255),
    DateTimeIn DATETIME,
    DateTimeOut DATETIME,
    AmountSpent DECIMAL(10,2),
    FoodOrdered TEXT,
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (OutletID) REFERENCES RestaurantOutlet(OutletID)
);