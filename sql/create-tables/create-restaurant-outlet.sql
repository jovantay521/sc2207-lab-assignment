CREATE TABLE RestaurantOutlet (
    OutletID VARCHAR(255) PRIMARY KEY,
    MallID VARCHAR(255),
    RestaurantID VARCHAR(255),
    RestaurantName VARCHAR(255),
    FOREIGN KEY (MallID) REFERENCES Mall(MallID),
    FOREIGN KEY (RestaurantID) REFERENCES RestaurantChain(RestaurantID)
);