.headers on

SELECT
    r.r_name AS region,
    COUNT(DISTINCT c.c_custkey) AS cust_cnt
FROM
    region r
LEFT JOIN
    nation n ON r.r_regionkey = n.n_regionkey
LEFT JOIN
    customer c ON n.n_nationkey = c.c_nationkey
WHERE
    c.c_custkey IN (
        SELECT DISTINCT o.o_custkey
        FROM orders o
        WHERE o.o_custkey IS NOT NULL
    )
    AND c.c_acctbal > (
        SELECT AVG(c_acctbal)
        FROM customer
        WHERE c_acctbal IS NOT NULL
    )
GROUP BY
    r.r_name
ORDER BY
    r.r_name;
