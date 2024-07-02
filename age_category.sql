--А) какую сумму в среднем в месяц тратит:
--- пользователи в возрастном диапазоне от 18 до 25 лет включительно
--- пользователи в возрастном диапазоне от 26 до 35 лет включительно

WITH s AS (
  SELECT 
    p.userId,
    EXTRACT(MONTH FROM p.date) AS month,
    SUM(i.price) AS total
  FROM Purchases AS p 
  LEFT JOIN Items AS i ON p.itemId = i.itemId
  GROUP BY p.userId, month
),
k AS ( 
  SELECT 
    u.age, 
    u.userId,
    CASE 
      WHEN u.age BETWEEN 18 AND 25 THEN '18-25'
      WHEN u.age BETWEEN 26 AND 35 THEN '26-35'
    END AS age_category
  FROM Users AS u
  WHERE u.age BETWEEN 18 AND 35
)   
SELECT 
  AVG(s.total) AS monthly_spent, 
  k.age_category
FROM k
LEFT JOIN s ON k.userId = s.userId
GROUP BY k.age_category;

