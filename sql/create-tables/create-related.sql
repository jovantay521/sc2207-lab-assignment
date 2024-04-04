CREATE TABLE Related (
    Person1UserID INT,
    Person2UserID INT,
    Type VARCHAR(255),
    PRIMARY KEY (Person1UserID, Person2UserID),
    FOREIGN KEY (Person1UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (Person2UserID) REFERENCES UserAccount(UserID)
);