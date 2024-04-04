CREATE TABLE ComplaintOnRestaurant (
    ComplaintID VARCHAR(255) PRIMARY KEY,
    OutletID VARCHAR(255),
    FOREIGN KEY (ComplaintID) REFERENCES Complaint(ComplaintID),
    FOREIGN KEY (OutletID) REFERENCES RestaurantOutlet(OutletID)
);