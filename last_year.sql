--В) какой товар обеспечивает дает наибольший вклад в выручку за последний год

SELECT
  i.itemId,
  SUM(i.price) AS item_income
FROM Purchases AS p
LEFT JOIN Items AS i ON p.itemId = i.itemId
WHERE EXTRACT(year FROM p.date) = 2024
GROUP BY i.itemId
ORDER BY item_income DESC
LIMIT 1;
