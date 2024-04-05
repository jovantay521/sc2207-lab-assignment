SELECT TOP 1
    S.MallID,
    COUNT(SR.UserID) AS NumberOfShoppers
FROM 
    ShoppingRecord SR
INNER JOIN 
    Shop S ON SR.ShopID = S.ShopID
WHERE 
    SR.DayOfWeek = 'Friday'
    AND CAST(SR.DateTimeIn AS TIME) >= '19:00:00'
    AND CAST(SR.DateTimeIn AS TIME) < '22:00:00'
GROUP BY 
    S.MallID
ORDER BY 
    NumberOfShoppers ASC;