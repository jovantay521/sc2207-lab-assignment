CREATE TABLE RestaurantOutlet (
    OutletID INT PRIMARY KEY,
    MallID INT,
    RestaurantID INT,
    FOREIGN KEY (MallID) REFERENCES Mall(MallID),
    FOREIGN KEY (RestaurantID) REFERENCES RestaurantChain(RestaurantID)
);