# Notebook_C Extension Exercises (3 of 5 completed)

## Exercise 4: STL Decomposition
Decomposed traffic for one unit (period = SEASON = 168h) into trend, seasonal, and residual components.
**Result:** residual share of variance = 0.092, meaning 90.8% of traffic variance is explained by trend + seasonal components combined -- confirming strong cyclical structure suitable for seasonal-naive baselines.

## Exercise 2: Frequency Comparison (working frequency vs. daily)
Compared day-of-week seasonal strength at the working frequency (hourly) versus a coarser daily frequency.
**Result:** weekday strength = 0.046 at hourly frequency vs. 0.079 at daily frequency (~1.7x higher).
**Conclusion:** aggregating to daily frequency slightly increases the visibility of day-of-week effects (likely because within-day variation dominates at hourly resolution), but both values remain far below hourly seasonality (0.291) -- hourly frequency remains the right choice for this forecasting task since day-of-week is a weak signal at either resolution.

## Exercise 3: Additional SQL Queries (QUALIFY and CTE)
Added a query using `QUALIFY` to extract the top-5 units per month by mean traffic.
**Result:** the same five countries (US, NL, ID, SG, DE) consistently appear in the top-5 across the first two months, with only minor rank changes (e.g., ID moved from rank 3 to rank 1) -- indicating country rankings are stable over time rather than driven by random monthly noise.
