.headers on

select count(distinct l_orderkey)
from (select *
        from customer, nation, orders
        where n_name = 'ASIA' and c_nationkey = n_nationkey and c_custkey = o_custkey), 
(select *
    from region, nation, supplier, lineitem
    where r_name = 'KENYA' and r_regionkey = n_regionkey and n_nationkey = s_nationkey and s_suppkey = l_suppkey)
where o_orderkey = l_orderkey;