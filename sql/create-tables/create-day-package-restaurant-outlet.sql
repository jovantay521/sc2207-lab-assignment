CREATE TABLE DayPackageRestaurantOutlet (
    DayPackageID VARCHAR(255) PRIMARY KEY,
    RestaurantOutletID VARCHAR(255),
    RecommendedFood TEXT,
    FOREIGN KEY (DayPackageID) REFERENCES DayPackage(DayPackageID),
    FOREIGN KEY (RestaurantOutletID) REFERENCES RestaurantOutlet(OutletID)
);