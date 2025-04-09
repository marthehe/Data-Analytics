-- Which weather conditions resulted in the most consistent decisions?
-- This question explores how consistent players were in their decisions under specific weather conditions.

SELECT Outlook, COUNT(DISTINCT PlayTennis) AS UniqueDecisions
FROM PlayTennis
GROUP BY Outlook
ORDER BY UniqueDecisions ASC;

-- Players were consistent on overcast days, always choosing to play. 
-- However, sunny and rainy days introduced variability, showing that additional factors might influence the decision.

-- Under which combination of weather conditions were matches most likely to occur?
-- This examines the combined effect of multiple factors (e.g., Outlook, Humidity, Wind).

SELECT Outlook, Humidity, Wind, COUNT(*) AS MatchCount
FROM PlayTennis
WHERE PlayTennis = 'Yes'
GROUP BY Outlook, Humidity, Wind
ORDER BY MatchCount DESC;

-- The ideal conditions for tennis were Rainy skies, Normal Humidity, and Weak Wind. 

-- Which factor (Outlook, Humidity, Wind) had the biggest impact on the decision to play?
-- This determines which single variable correlated most strongly with the decision.

SELECT
    'Outlook' AS Factor, Outlook AS Value, COUNT(*) AS Frequency
FROM PlayTennis
WHERE PlayTennis = 'Yes'
GROUP BY Outlook

UNION ALL

SELECT
    'Humidity' AS Factor, Humidity AS Value, COUNT(*) AS Frequency
FROM PlayTennis
WHERE PlayTennis = 'Yes'
GROUP BY Humidity

UNION ALL

SELECT
    'Wind' AS Factor, Wind AS Value, COUNT(*) AS Frequency
FROM PlayTennis
WHERE PlayTennis = 'Yes'
GROUP BY Wind
ORDER BY Frequency DESC;

-- Outlook emerged as the strongest predictor of match decisions, particularly when skies were overcast. 
-- This shows that players prioritize weather conditions over other factors like wind or humidity.

-- What percentage of matches were played under each condition?
-- This provides a breakdown of play frequency for each condition.

SELECT
    PlayTennis,
    COUNT(*) AS MatchCount,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM PlayTennis)), 2) AS Percentage
FROM PlayTennis
GROUP BY PlayTennis;

-- Out of all recorded matches, 64% were played, indicating that players are slightly more likely to play than cancel. 
-- This insight could guide scheduling decisions for future matches.

-- How often did strong winds lead to cancellations?
SELECT Wind, COUNT(*) AS TotalMatches,
    SUM(CASE WHEN PlayTennis = 'No' THEN 1 ELSE 0 END) AS CanceledMatches,
    ROUND((SUM(CASE WHEN PlayTennis = 'No' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 2) AS CancelPercentage
FROM PlayTennis
GROUP BY Wind;

-- Strong winds led to a 75% cancellation rate, emphasizing the impact of wind conditions on player decisions. 
-- Planners could use this insight to avoid scheduling matches during windy forecasts.

-- What is the distribution of temperature for played and canceled matches?
-- This question helps understand if temperature played a role in decisions.

SELECT Temperature, PlayTennis, COUNT(*) AS Frequency
FROM PlayTennis
GROUP BY Temperature, PlayTennis
ORDER BY Temperature, PlayTennis;

-- Interestingly, matches were played more frequently during mild temperatures, 
-- while extreme conditions (Hot or Cool) saw higher cancellation rates.

-- Were cancellations more common under a specific combination of conditions?

SELECT Outlook, Humidity, Wind, COUNT(*) AS CanceledMatches
FROM PlayTennis
WHERE PlayTennis = 'No'
GROUP BY Outlook, Humidity, Wind
ORDER BY CanceledMatches DESC;

-- The most common scenario for cancellations was Sunny weather combined with High Humidity and Strong Winds. 
-- This insight could help organizers adjust schedules to avoid these conditions.


