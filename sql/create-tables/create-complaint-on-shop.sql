CREATE TABLE ComplaintOnShop (
    ComplaintID VARCHAR(255) PRIMARY KEY,
    ShopID VARCHAR(255),
    FOREIGN KEY (ComplaintID) REFERENCES Complaint(ComplaintID),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);