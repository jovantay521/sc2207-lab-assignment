-- Find the most popular day packages where all participants are related to one another as either family
-- members or members of the same club.
SELECT dp.DayPackageID, COUNT(DISTINCT dp.UserID) as Participants
FROM DayPackage dp
INNER JOIN Related r ON (dp.UserID = r.Person1UserID OR dp.UserID = r.Person2UserID)
AND r.Type IN ('Family', 'Club Member')
GROUP BY dp.DayPackageID
ORDER BY Participants DESC
