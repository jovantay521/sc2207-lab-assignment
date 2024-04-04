CREATE TABLE UserRecommendation (
    UserID INT,
    DateIssued DATE,
    RecommendationID VARCHAR(255),
    PRIMARY KEY (UserID, RecommendationID),
    FOREIGN KEY (RecommendationID) REFERENCES Recommendation(RecommendationID)
);