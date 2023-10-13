.headers on
-- spits out null but there is 0 line items on october 1994--

SELECT MAX(l.l_discount) AS max_small_disc
FROM lineitem l
JOIN orders o ON l.l_orderkey = o.o_orderkey
WHERE strftime('%Y-%m', o.o_orderdate) = '1994-10'
  AND l.l_discount < (SELECT AVG(l_discount) FROM lineitem);
