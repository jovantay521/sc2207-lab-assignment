-- Find users who have dined in all the restaurants in some malls, but have never dined in any restaurants
-- in some other malls.
WITH UsersDinedAll AS (
   SELECT d.UserID, COUNT(DISTINCT ro.RestaurantOutletID) AS NumRestaurantsDined
   FROM DiningRecord d
   JOIN RESTAURANTOUTLET ro ON d.RestaurantOutletID = ro.RestaurantOutletID
   GROUP BY
       d.UserID
),
UsersDinedSome AS (
   SELECT d.UserID, COUNT(DISTINCT ro.MallID) AS NumMallsDined
   FROM DiningRecord d
   JOIN RESTAURANTOUTLET ro ON d.RestaurantOutletID = ro.RestaurantOutletID
   GROUP BY d.UserID
),
UsersDinedAllInSomeMalls AS (
   SELECT UDA.UserID
   FROM UsersDinedAll UDA
   JOIN MALL M ON UDA.NumRestaurantsDined = (SELECT COUNT(*) FROM RESTAURANTOUTLET WHERE MallID = M.MallID)
),
UsersDinedSomeInOtherMalls AS (
   SELECT UDS.UserID
   FROM UsersDinedSome UDS
   JOIN MALL M ON UDS.NumMallsDined > 0
   WHERE UDS.UserID NOT IN (SELECT UserID FROM UsersDinedAllInSomeMalls)
)
SELECT UA.UserID, UA.Name,UA.Gender,UA.DateOfBirth
FROM UserAccount UA
WHERE UA.UserID IN (SELECT UserID FROM UsersDinedAllInSomeMalls) AND UA.UserID NOT IN (SELECT UserID FROM UsersDinedSomeInOtherMalls);
    