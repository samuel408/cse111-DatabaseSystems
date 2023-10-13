.headers on

SELECT COUNT(*) AS cust_cnt
FROM customer c
WHERE c.c_nationkey NOT IN (
    SELECT n.n_nationkey
    FROM nation n
    WHERE n.n_regionkey IN (
        SELECT r.r_regionkey
        FROM region r
        WHERE r.r_name IN ('EUROPE', 'ASIA')
    )
);
