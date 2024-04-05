-- Find families who frequently shopped and dined together, with or without day packages. As part of
-- your output, indicate whether these families use day packages or not. “frequently” means at least 50%
-- of the time.
-- Step 1: Identify family members
WITH
    FamilyPairs
    AS
    (
        SELECT
            r.Person1UserID, r.Person2UserID
        FROM
            dbo.Related r
        WHERE
    r.Type = 'Family'
    ),

    -- Step 2: Aggregate shopping and dining records
    ActivityRecords
    AS
    (
                    SELECT
                sr.UserID, 'Shopping' AS ActivityType, sr.DateTimeIn
            FROM
                dbo.ShoppingRecord sr
        UNION ALL
            SELECT
                dr.UserID, 'Dining' AS ActivityType, dr.DateTimeIn
            FROM
                dbo.DiningRecord dr
    ),

    -- Step 3: Determine family activities together
    FamilyActivities
    AS
    (
        SELECT
            fp.Person1UserID, fp.Person2UserID, ar.ActivityType, COUNT(*) AS TotalActivities
        FROM
            FamilyPairs fp
            INNER JOIN ActivityRecords ar ON ar.UserID = fp.Person1UserID OR ar.UserID = fp.Person2UserID
        GROUP BY
    fp.Person1UserID, fp.Person2UserID, ar.ActivityType
        HAVING
    COUNT(*) >= 0.5 * (
      SELECT COUNT(*)
        FROM ActivityRecords
        WHERE UserID = fp.Person1UserID OR UserID = fp.Person2UserID
    )
    ),

    -- Step 4: Check day package usage
    DayPackageUsage
    AS
    (
        SELECT
            UserID, COUNT(DISTINCT DayPackageID) AS PackagesUsed
        FROM
            dbo.DayPackage
        GROUP BY
    UserID
    ),

    -- Final Step: Merge data and calculate frequency
    FamilyActivitySummary
    AS
    (
        SELECT
            fa.Person1UserID, fa.Person2UserID, fa.ActivityType, fa.TotalActivities,
            COALESCE(dpu1.PackagesUsed, 0) AS Person1PackagesUsed,
            COALESCE(dpu2.PackagesUsed, 0) AS Person2PackagesUsed
        FROM
            FamilyActivities fa
            LEFT JOIN DayPackageUsage dpu1 ON fa.Person1UserID = dpu1.UserID
            LEFT JOIN DayPackageUsage dpu2 ON fa.Person2UserID = dpu2.UserID
    )

SELECT
    fas.Person1UserID, fas.Person2UserID, fas.ActivityType, fas.TotalActivities,
    fas.Person1PackagesUsed, fas.Person2PackagesUsed,
    CASE
    WHEN fas.Person1PackagesUsed > 0 OR fas.Person2PackagesUsed > 0 THEN 'Yes'
    ELSE 'No'
  END AS UseDayPackages
FROM
    FamilyActivitySummary fas;
