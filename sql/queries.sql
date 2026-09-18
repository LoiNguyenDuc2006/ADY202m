
-- Q1: mean and spread of the target per unit and per calendar period
SELECT loc, month(ts) AS mon, AVG(traffic) AS mean_target, STDDEV(traffic) AS sd_target, COUNT(*) AS n FROM clean GROUP BY 1, 2 ORDER BY 1, 2;
-- Q2: share of event steps (target above the 90% quantile) per unit
WITH thr AS (SELECT quantile_cont(traffic, 0.9) AS q FROM clean)
SELECT loc, AVG((traffic > q)::INT) AS event_share FROM clean, thr GROUP BY 1 ORDER BY 2 DESC;
-- Q3: target by covariate decile (relationship with the secondary source)
SELECT decile, AVG(traffic) AS mean_target, COUNT(*) AS n FROM (SELECT NTILE(10) OVER (ORDER BY cloud_inc) AS decile, traffic FROM clean WHERE cloud_inc IS NOT NULL) GROUP BY 1 ORDER BY 1;
-- Q4: seasonal-naive skill check: correlation between the target and its value SEASON steps earlier
SELECT corr(traffic, lagged) AS r_season FROM (SELECT traffic, LAG(traffic, 168) OVER (PARTITION BY loc ORDER BY ts) AS lagged FROM clean);
