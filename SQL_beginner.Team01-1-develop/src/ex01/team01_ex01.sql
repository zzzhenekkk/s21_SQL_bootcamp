insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29'); 
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

with cur_min_max as (
    select balance.user_id,
           currency.id,
           currency.name,
           balance.money,
           (
               select currency.rate_to_usd
               from currency
               where currency.id = balance.currency_id
                 and currency.updated <= balance.updated
               order by updated desc
               limit 1
           ) min,
           (
               select currency.rate_to_usd
               from currency
               where currency.id = balance.currency_id
                 and currency.updated > balance.updated
               order by updated
               limit 1
           ) max
    from currency
             join balance on currency.id = balance.currency_id
    group by balance.money, currency.id, currency.name, balance.user_id, balance.updated, balance.currency_id
    order by min desc, max, balance.updated
)
select coalesce(u.name, 'not defined')     name,
       coalesce(u.lastname, 'not defined') lastname,
       cur_min_max.name currency_name,
       cur_min_max.money * coalesce(min, max) currency_in_usd
from cur_min_max left join "user" u on cur_min_max.user_id = u.id
order by name desc, lastname, currency_name;
