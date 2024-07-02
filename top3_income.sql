--Г) топ-3 товаров по выручке и их доля в общей выручке за любой год
--выручка каждого товара
with i as (
 SELECT
  i.itemId,
  SUM(i.price) AS item_income
FROM Purchases AS p
LEFT JOIN Items AS i ON p.itemId = i.itemId
GROUP BY i.itemId
ORDER BY item_income DESC
LIMIT 3),
h as(
--общая выручка
SELECT
  SUM(i.price) AS total_income
FROM Purchases AS p
LEFT JOIN Items AS i ON p.itemId = i.itemId)

SELECT
  i.itemId,
  i.item_income,
  (i.item_income / h.total_income) * 100 AS income_procent
FROM i, h;



