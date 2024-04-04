CREATE TABLE ComplaintOnShop (
    ComplaintID INT,
    ShopID INT,
    PRIMARY KEY (ComplaintID, ShopID),
    FOREIGN KEY (ComplaintID) REFERENCES Complaint(ComplaintID),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);