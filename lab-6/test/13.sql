.headers on
select n_name
from(
select n_name, sum(o_totalprice) as X
from nation, customer, orders
where n_nationkey = c_nationkey and c_custkey = o_custkey
group by n_name
)
order by X DESC
LIMIT 1;