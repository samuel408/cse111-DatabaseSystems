.headers on
select c_name, o_totalprice
from nation, customer, orders
where n_name = 'ARGENTINA' and n_nationkey = c_nationkey and c_custkey = o_custkey  and o_orderdate >='1996-01-01' and o_orderdate <='1996-12-31'
group by c_name;