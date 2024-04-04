CREATE TABLE RecommendationReceived (
    UserID INT,
    RecommendationID INT,
    DateTime DATETIME,
    FOREIGN KEY (UserID) REFERENCES UserAccount(UserID),
    FOREIGN KEY (RecommendationID) REFERENCES Recommendation(RecommendationID),
    PRIMARY KEY (UserID, RecommendationID)
);