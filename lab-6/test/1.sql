.headers on
select s_name, c_name, o_totalprice
from customer, orders, lineitem, partsupp, supplier
where c_custkey = o_custkey and o_orderkey = l_orderkey and l_suppkey = ps_suppkey and s_suppkey = ps_suppkey and
o_totalprice > (select o_totalprice
from orders
where o_orderstatus = "F" and o_totalprice <> (select max(o_totalprice) from orders where o_orderstatus = "F")
order by o_totalprice DESC
LIMIT 1) and o_orderstatus = "F"
group by s_name, c_name;