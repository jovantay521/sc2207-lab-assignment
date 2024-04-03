CREATE TABLE UserAccount (
    UserID INT PRIMARY KEY,
    Gender VARCHAR(10),
    DateOfBirth DATE,
    Name VARCHAR(100)
);

CREATE TABLE Related (
    Person1UserID INT,
    Person2UserID INT,
    Type VARCHAR(50),
    PRIMARY KEY (Person1UserID, Person2UserID),
    FOREIGN KEY (Person1UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (Person2UserID) REFERENCES UserAccount(UserID)
);

CREATE TABLE MallManagementCompany (
    MallManagementCompanyID INT PRIMARY KEY,
    Address VARCHAR(255)
);

CREATE TABLE Mall (
    MallID INT PRIMARY KEY,
    Address VARCHAR(255),
    NumberOfShops INT,
    MallManagementCompanyID INT,
    FOREIGN KEY (MallManagementCompanyID) REFERENCES MallManagementCompany(MallManagementCompanyID)
);

CREATE TABLE Shop (
    ShopID INT PRIMARY KEY,
    Type VARCHAR(100),
    MallID INT,
    FOREIGN KEY (MallID) REFERENCES Mall(MallID)
);

CREATE TABLE RestaurantChain (
    RestaurantID INT PRIMARY KEY,
    Address VARCHAR(255)
);

CREATE TABLE RestaurantOutlet (
    OutletID INT PRIMARY KEY,
    MallID INT,
    RestaurantID INT,
    FOREIGN KEY (MallID) REFERENCES Mall(MallID),
    FOREIGN KEY (RestaurantID) REFERENCES RestaurantChain(RestaurantID)
);

CREATE TABLE Complaint (
    ComplaintID INT PRIMARY KEY,
    FiledDateTime DATETIME,
    Text TEXT,
    Status VARCHAR(50),
    UserID INT,
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);

CREATE TABLE ComplaintOnShop (
    ComplaintID INT,
    ShopID INT,
    PRIMARY KEY (ComplaintID, ShopID),
    FOREIGN KEY (ComplaintID) REFERENCES Complaint(ComplaintID),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE ComplaintOnRestaurant (
    ComplaintID INT,
    OutletID INT,
    PRIMARY KEY (ComplaintID, OutletID),
    FOREIGN KEY (ComplaintID) REFERENCES Complaint(ComplaintID),
    FOREIGN KEY (OutletID) REFERENCES RestaurantOutlet(OutletID)
);

CREATE TABLE ShoppingRecord (
    UserID INT,
    ShopID INT,
    InvoiceID INT,
    DateTimeIn DATETIME,
    DateTimeOut DATETIME,
    AmountSpent DECIMAL(10,2),
    ItemPurchased TEXT,
    PRIMARY KEY (UserID, ShopID, InvoiceID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (ShopID) REFERENCES Shop(ShopID)
);

CREATE TABLE DiningRecord (
    UserID INT,
    OutletID INT,
    ReceiptID INT,
    DateTimeIn DATETIME,
    DateTimeOut DATETIME,
    AmountSpent DECIMAL(10,2),
    FoodOrdered TEXT,
    PRIMARY KEY (UserID, OutletID, ReceiptID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (OutletID) REFERENCES RestaurantOutlet(OutletID)
);

CREATE TABLE Voucher (
    VoucherID INT PRIMARY KEY,
    DateIssued DATE,
    Description TEXT,
    Status VARCHAR(50),
    ExpiryDates DATE
);

CREATE TABLE PurchaseVoucher (
    VoucherID INT,
    PurchaseDiscount DECIMAL(10,2),
    UserID INT,
    DateTime DATETIME,
    PRIMARY KEY (VoucherID, UserID),
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);

CREATE TABLE DiningVoucher (
    VoucherID INT,
    CashDiscount DECIMAL(10,2),
    UserID INT,
    DateTime DATETIME,
    PRIMARY KEY (VoucherID, UserID),
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);

CREATE TABLE GroupVoucher (
    VoucherID INT,
    GroupSize INT,
    GroupDiscount DECIMAL(10,2),
    UserID INT,
    DateTime DATETIME,
    PRIMARY KEY (VoucherID, UserID),
    FOREIGN KEY (VoucherID) REFERENCES Voucher(VoucherID),
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID)
);

CREATE TABLE PackageVoucher (
    VoucherID INT PRIMARY KEY,
    PackageDiscount DECIMAL(10,2)
);
