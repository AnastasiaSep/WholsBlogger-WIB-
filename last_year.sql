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

--
--WITH LastYear AS (
--  SELECT MAX(EXTRACT(YEAR FROM p.date)) AS last_year
--  FROM Purchases p
--)
--SELECT
--  i.itemId,
--  SUM(i.price) AS item_income
--FROM Purchases p
--JOIN Items i ON p.itemId = i.itemId
--JOIN LastYear ly ON EXTRACT(YEAR FROM p.date) = ly.last_year
--GROUP BY i.itemId
--ORDER BY item_income DESC
--LIMIT 1;
