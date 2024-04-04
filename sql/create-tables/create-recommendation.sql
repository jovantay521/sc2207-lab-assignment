CREATE TABLE Recommendation (
    RecommendationID VARCHAR(255) PRIMARY KEY,
    ValidPeriod VARCHAR(255),
    DiningVoucherID VARCHAR(255),
    PurchaseVoucherID VARCHAR(255),
    DayPackageID VARCHAR(255),
    RestaurantOutletID VARCHAR(255),
    MallID VARCHAR(255),
    FOREIGN KEY (DiningVoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (PurchaseVoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (DayPackageID) REFERENCES DayPackage(DayPackageID),
    FOREIGN KEY (RestaurantOutletID) REFERENCES RestaurantOutlet(OutletID),
    FOREIGN KEY (MallID) REFERENCES Mall(MallID)
);