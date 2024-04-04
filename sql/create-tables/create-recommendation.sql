CREATE TABLE Recommendation (
    RecommendationID INT PRIMARY KEY,
    ValidPeriod DATE,
    DateIssued DATE,
    VoucherID INT,
    DayPackageID INT,
    OutletID INT,
    MallID INT,
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (DayPackageID) REFERENCES DayPackage(DayPackageID),
    FOREIGN KEY (OutletID) REFERENCES RestaurantOutlet(OutletID),
    FOREIGN KEY (MallID) REFERENCES Mall(MallID)
);
