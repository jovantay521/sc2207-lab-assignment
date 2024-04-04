CREATE TABLE ComplaintOnRestaurant (
    ComplaintID INT,
    OutletID INT,
    PRIMARY KEY (ComplaintID, OutletID),
    FOREIGN KEY (ComplaintID) REFERENCES Complaint(ComplaintID),
    FOREIGN KEY (OutletID) REFERENCES RestaurantOutlet(OutletID)
);