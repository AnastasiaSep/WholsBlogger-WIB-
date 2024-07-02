--Б) в каком месяце года выручка от пользователей в возрастном диапазоне 35+ самая большая

WITH s AS (
  SELECT 
    p.userId,
    EXTRACT(MONTH FROM p.date) AS month,
    EXTRACT(YEAR FROM p.date) AS year,
    SUM(i.price) AS total
  FROM Purchases AS p 
  LEFT JOIN Items AS i ON p.itemId = i.itemId
  GROUP BY p.userId, month, year
)
SELECT 
  s.month,
  s.year,
  SUM(s.total) AS total_income
FROM s
JOIN Users u ON s.userId = u.userId
WHERE u.age > 35
GROUP BY s.month, s.year
ORDER BY total_income DESC
LIMIT 1;
