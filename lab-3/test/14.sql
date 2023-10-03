.headers on
select *
from (select count(o_orderstatus) as Success, r_name as S
from region, nation, customer, orders
where r_regionkey = n_regionkey and n_nationkey = c_nationkey and c_custkey = o_custkey and o_orderstatus = "F"
group by r_name), (select count(o_orderstatus) as Total, r_name as T
from region, nation, customer, orders
where r_regionkey = n_regionkey and n_nationkey = c_nationkey and c_custkey = o_custkey
group by r_name)
where S = T;
