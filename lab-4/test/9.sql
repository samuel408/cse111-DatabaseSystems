.mode csv
.headers on
SELECT
    n.n_name AS country,
    COUNT(DISTINCT o.o_orderkey) AS cnt
FROM
    region AS r
JOIN
    nation AS n
ON
    r.r_regionkey = n.n_regionkey
JOIN
    customer AS c
ON
    n.n_nationkey = c.c_nationkey
JOIN
    orders AS o
ON
    c.c_custkey = o.o_custkey
WHERE
    r.r_name = 'AFRICA'
    AND o.o_orderstatus = 'F'
    AND strftime('%Y', o.o_orderdate) = '1993'
GROUP BY
    n.n_name
HAVING
    cnt > 200
ORDER BY
    cnt DESC;
