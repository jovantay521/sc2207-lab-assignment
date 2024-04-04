CREATE TABLE DayPackageMall (
    DayPackageID VARCHAR(255) PRIMARY KEY,
    MallID VARCHAR(255),
    RecommendedShop TEXT,
    FOREIGN KEY (DayPackageID) REFERENCES DayPackaAge(DayPackageID),
    FOREIGN KEY (MallID) REFERENCES Mall(MallID)
);