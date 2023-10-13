.headers on

SELECT
    r1.r_name AS supp_region,
    r2.r_name AS cust_region,
    SUBSTR(l.l_shipdate, 1, 4) AS year,
    SUM(l.l_extendedprice * (1 - l.l_discount)) AS revenue
FROM
    lineitem l
    JOIN supplier s1 ON l.l_suppkey = s1.s_suppkey
    JOIN nation n1 ON s1.s_nationkey = n1.n_nationkey
    JOIN region r1 ON n1.n_regionkey = r1.r_regionkey
    JOIN customer c1 ON l.l_orderkey = c1.c_custkey
    JOIN nation n2 ON c1.c_nationkey = n2.n_nationkey
    JOIN region r2 ON n2.n_regionkey = r2.r_regionkey
WHERE
    SUBSTR(l.l_shipdate, 1, 4) IN ('1994', '1995')
    AND r1.r_name <> r2.r_name
GROUP BY
    r1.r_name, r2.r_name, year
ORDER BY
    supp_region, cust_region, year;
