.headers on

SELECT p.p_name AS part
FROM part p
WHERE p.p_partkey IN (
    SELECT DISTINCT ps.ps_partkey
    FROM partsupp ps
    WHERE ps.ps_suppkey IN (
        SELECT s.s_suppkey
        FROM supplier s
        WHERE s.s_nationkey = (
            SELECT n.n_nationkey
            FROM nation n
            WHERE n.n_name = 'FRANCE'
        )
    )
    ORDER BY (ps.ps_supplycost * ps.ps_availqty) DESC
    LIMIT (
        SELECT COUNT(*) * 0.05
        FROM partsupp
        WHERE partsupp.ps_suppkey IN (
            SELECT s.s_suppkey
            FROM supplier s
            WHERE s.s_nationkey = (
                SELECT n.n_nationkey
                FROM nation n
                WHERE n.n_name = 'FRANCE'
            )
        )
    )
);
