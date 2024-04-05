-- Compulsive shoppers are those who have visited a certain mall more than 5 times within a certain
-- period of time. Find the youngest compulsive shoppers and the amount they spent in total during
-- December 2023.
WITH CompulsiveShoppers AS (
    SELECT sr.UserID, s.MallID, SUM(sr.AmountSpent) AS TotalAmountSpent
    FROM ShoppingRecord sr
    JOIN Shop s ON sr.ShopID = s.ShopID
    WHERE DateTimeIn >= '2023-12-01' AND DateTimeIn < '2024-01-01'
    GROUP BY sr.UserID, s.MallID
    HAVING COUNT(DISTINCT CONVERT(DATE, sr.DateTimeIn)) > 5
),


CompulsiveShoppersWithAge AS (
    SELECT cs.UserID, ua.Name, ua.DateOfBirth, DATEDIFF(YEAR, ua.DateOfBirth, GETDATE()) AS Age
    FROM CompulsiveShoppers cs
    JOIN UserAccount ua ON cs.UserID = ua.UserID
)


SELECT cs.UserID, cs.Name, cs.DateOfBirth, ISNULL(ts.TotalAmountSpent, 0) AS TotalAmountSpent
FROM CompulsiveShoppersWithAge cs
LEFT JOIN (
    SELECT sr.UserID, SUM(sr.AmountSpent) AS TotalAmountSpent
    FROM ShoppingRecord sr
    GROUP BY sr.UserID
) ts ON cs.UserID = ts.UserID
ORDER BY cs.Age ASC;
