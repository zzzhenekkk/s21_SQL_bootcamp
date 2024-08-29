WITH balanc_gr AS (
       SELECT b.user_id,
              b.type,
              b.currency_id,
              SUM(b.money) volume
       FROM balance b
       GROUP BY
              b.user_id,
              b.type,
              b.currency_id
), last_upd_cur AS (
       SELECT DISTINCT ON (name) 
              id,
              name,
              rate_to_usd,
              updated
       FROM currency
       ORDER BY name, updated DESC
) SELECT 
              COALESCE(u.name, 'not defined') name,
              COALESCE(u.lastname, 'not defined') lastname,
              bg.type type,
              bg.volume,
              COALESCE(luc.name, 'not defined') AS currency_name,
              COALESCE(luc.rate_to_usd, 1) last_rate_to_usd,
              bg.volume * COALESCE(luc.rate_to_usd, 1) AS total_volume_in_usd
FROM balanc_gr bg
       LEFT JOIN last_upd_cur luc ON bg.currency_id = luc.id
       LEFT JOIN "user" u ON bg.user_id = u.id
ORDER BY name DESC, lastname, type;
