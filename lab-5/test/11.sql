.headers on

SELECT SUM(ps.ps_supplycost) AS total_supply_cost
FROM partsupp ps
JOIN lineitem l ON ps.ps_partkey = l.l_partkey AND ps.ps_suppkey = l.l_suppkey
WHERE l.l_shipdate >= '1994-01-01' AND l.l_shipdate <= '1994-12-31'
AND ps.ps_partkey IN (
    SELECT DISTINCT p.p_partkey
    FROM part p
    WHERE p.p_retailprice < 2000
)
AND ps.ps_suppkey NOT IN (
    SELECT DISTINCT s.s_suppkey
    FROM supplier s
    JOIN lineitem l2 ON s.s_suppkey = l2.l_suppkey
    WHERE l2.l_shipdate >= '1997-01-01' AND l2.l_shipdate <= '1997-12-31'
    AND l2.l_extendedprice < 1000
);
