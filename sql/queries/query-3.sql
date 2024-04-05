-- What are the most popular recommendations from the app regarding malls?
SELECT TOP 3 MallID, COUNT(RecommendationID) as NumberOfRecommendations
FROM Recommendation
GROUP BY MallID
ORDER BY NumberOfRecommendations DESC;
