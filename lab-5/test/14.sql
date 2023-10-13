.headers on

SELECT
    (SUM(CASE
        WHEN n1.n_name = 'FRANCE' AND r2.r_name = 'AMERICA' AND SUBSTR(l.l_shipdate, 1, 4) = '1994'
        THEN l.l_extendedprice * (1 - l.l_discount)
        ELSE 0
    ) * 1.0) / NULLIF(SUM(CASE
        WHEN r2.r_name = 'AMERICA' AND SUBSTR(l.l_shipdate, 1, 4) = '1994'
        THEN l.l_extendedprice * (1 - l.l_discount)
        ELSE 0
    ), 0) AS FRANCE_in_AMERICA_in_1994
FROM
    lineitem l
    JOIN supplier s ON l.l_suppkey = s.s_suppkey
    JOIN nation n1 ON s.s_nationkey = n1.n_nationkey
    JOIN customer c ON l.l_orderkey = c.c_custkey
    JOIN nation n2 ON c.c_nationkey = n2.n_nationkey
    JOIN region r1 ON n1.n_regionkey = r1.r_regionkey
    JOIN region r2 ON n2.n_regionkey = r2.r_regionkey;
