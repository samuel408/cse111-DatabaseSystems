.headers on
SELECT
    n.n_name AS Country,
    o.o_orderstatus AS Status,
    COUNT(o.o_orderkey) AS OrdersCount
FROM
    nation AS n
JOIN
    customer AS c
ON
    n.n_nationkey = c.c_nationkey
JOIN
    orders AS o
ON
    c.c_custkey = o.o_custkey
WHERE
    n.n_name IN (
        'ALGERIA', 'ANGOLA', 'EGYPT', 'KENYA', 'MOROCCO', 'MOZAMBIQUE', 'NIGERIA',
        'SAUDI ARABIA', 'SOUTH AFRICA', 'ZIMBABWE'
    )
GROUP BY
    n.n_name, o.o_orderstatus
ORDER BY
    n.n_name, o.o_orderstatus;
