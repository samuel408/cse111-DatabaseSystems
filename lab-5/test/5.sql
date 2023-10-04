.headers on

SELECT DISTINCT p.p_name AS part
FROM lineitem l
JOIN part p ON l.l_partkey = p.p_partkey
WHERE l.l_shipdate > '1993-10-02'
ORDER BY (l.l_extendedprice * (1 - l.l_discount)) DESC
LIMIT 1;