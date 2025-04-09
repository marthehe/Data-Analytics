SELECT * FROM PlayTennis;

-- How many matches were recorded?
SELECT COUNT(*) AS TotalMatches
FROM PlayTennis;
-- The dataset helds 14 matches

-- How did the weather influence decisions?
SELECT Outlook, PlayTennis, COUNT(*) AS Frequency
FROM PlayTennis
GROUP BY Outlook, PlayTennis;
-- Matches played on overcast days were almost always a "Yes." Perhaps the players were more optimistic on those days?

-- Did high humidity stop players from hitting the court?
SELECT Humidity, PlayTennis, COUNT(*) AS Frequency
FROM PlayTennis
GROUP BY Humidity, PlayTennis;
-- Indeed, high humidity discouraged players. Matches were far more likely to be canceled when the air was heavy.

-- What role did wind conditions play?
SELECT Wind, PlayTennis, COUNT(*) AS Frequency
FROM PlayTennis
GROUP BY Wind, PlayTennis;
-- Weak winds seemed to favor gameplay. Perhaps calm conditions allowed for smoother rallies?

-- The Problem: How do environmental factors affect the decision to play tennis?
-- The Insights:
-- Overcast days encouraged gameplay.
-- High humidity often led to cancellations.
-- Calm winds were the ideal playing conditions.


