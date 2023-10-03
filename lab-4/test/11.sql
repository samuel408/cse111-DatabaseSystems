.headers on
select count(distinct o_orderkey)
from (select *
        from customer, orders
        where c_custkey = o_custkey and c_acctbal > 0),
(select *
    from supplier, lineitem
    where s_suppkey = l_suppkey and s_acctbal > 0)
where l_orderkey = o_orderkey;