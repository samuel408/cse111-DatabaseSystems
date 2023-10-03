.headers on
SELECT s.s_name AS SupplierName, COUNT(l.l_discount) AS NumberOfDiscountedItems
FROM supplier AS s
INNER JOIN lineitem AS l ON s.s_suppkey = l.l_suppkey
WHERE l.l_discount >= 0.10
GROUP BY s.s_name
HAVING COUNT(l.l_discount) >= 1;
