CREATE TABLE RestaurantOutlet (
    RestaurantOutletID VARCHAR(255) PRIMARY KEY,
    MallID VARCHAR(255),
    RestaurantChainID VARCHAR(255),
    RestaurantName VARCHAR(255),
    FOREIGN KEY (MallID) REFERENCES Mall(MallID),
    FOREIGN KEY (RestaurantChainID) REFERENCES RestaurantChain(RestaurantChainID)
);