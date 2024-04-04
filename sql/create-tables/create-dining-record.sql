CREATE TABLE DiningRecord (
    ReceiptID INT PRIMARY KEY,
    UserID INT,
    OutletID INT,
    DateTimeIn DATETIME,
    DateTimeOut DATETIME,
    AmountSpent DECIMAL(10,2),
    FoodOrdered TEXT,
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (OutletID) REFERENCES RestaurantOutlet(OutletID)
);