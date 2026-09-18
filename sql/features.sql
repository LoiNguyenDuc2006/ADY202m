
CREATE OR REPLACE TABLE feat AS
SELECT loc, ts, traffic, cloud_inc, hour(ts) AS hr, dayofweek(ts) AS dow, month(ts) AS mon, dayofyear(ts) AS doy, LAG(traffic, 1) OVER w AS y_lag1, LAG(traffic, 2) OVER w AS y_lag2, LAG(traffic, 3) OVER w AS y_lag3, LAG(traffic, 168) OVER w AS y_lag168, LAG(traffic, 336) OVER w AS y_lag336, LAG(traffic, 1176) OVER w AS y_lag1176, AVG(traffic) OVER (w ROWS BETWEEN 167 PRECEDING AND CURRENT ROW) AS y_ma_season, STDDEV(traffic) OVER (w ROWS BETWEEN 167 PRECEDING AND CURRENT ROW) AS y_sd_season, traffic - LAG(traffic, 1) OVER w AS y_diff1, LAG(cloud_inc, 168) OVER w AS cloud_inc_lag_season, LEAD(traffic, 1) OVER w AS y_h1, LEAD(traffic, 24) OVER w AS y_h24
FROM clean WINDOW w AS (PARTITION BY loc ORDER BY ts);
