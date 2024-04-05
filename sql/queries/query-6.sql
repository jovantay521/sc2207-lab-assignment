-- What are the top 3 highest earning malls?
SELECT TOP 3 m.MallID, m.MallName, SUM(sr.AmountSpent) AS TotalEarnings
FROM Mall m
JOIN Shop s ON m.MallID = s.MallID
JOIN ShoppingRecord sr ON s.ShopID = sr.ShopID
GROUP BY m.MallID, m.MallName
ORDER BY TotalEarnings DESC;

-- What are the top 3 highest earning restaurants?
SELECT TOP 3 ro.RestaurantOutletID, ro.RestaurantName, SUM(dr.AmountSpent) AS TotalEarnings
FROM RestaurantOutlet ro
JOIN DiningRecord dr ON ro.RestaurantOutletID = dr.RestaurantOutletID
GROUP BY ro.RestaurantOutletID, ro.RestaurantName
ORDER BY TotalEarnings DESC;

