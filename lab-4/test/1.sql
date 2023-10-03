.headers ON
SELECT
    n.n_name || '|' || COUNT(o.o_orderkey) AS country|cnt
FROM
    region AS r
JOIN
    nation AS n
ON
    r.r_regionkey = n.n_regionkey
LEFT JOIN
    customer AS c
ON
    n.n_nationkey = c.c_nationkey
LEFT JOIN
    orders AS o
ON
    c.c_custkey = o.o_custkey
WHERE
    r.r_name = 'EUROPE'
GROUP BY
    n.n_name
ORDER BY
    COUNT(o.o_orderkey) DESC;
