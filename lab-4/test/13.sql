.headers on
SELECT
    r1.r_name AS supp_region,
    r2.r_name AS cust_region,
    MIN(o.o_totalprice) AS min_price
FROM
    supplier AS s
JOIN
    nation AS ns
ON
    s.s_nationkey = ns.n_nationkey
JOIN
    region AS r1
ON
    ns.n_regionkey = r1.r_regionkey
JOIN
    customer AS c
ON
    c.c_nationkey = ns.n_nationkey
JOIN
    orders AS o
ON
    c.c_custkey = o.o_custkey
JOIN
    nation AS nc
ON
    o.o_custkey = nc.n_nationkey
JOIN
    region AS r2
ON
    nc.n_regionkey = r2.r_regionkey
WHERE
    r1.r_name < r2.r_name
GROUP BY
    r1.r_name, r2.r_name
ORDER BY
    r1.r_name, r2.r_name;
