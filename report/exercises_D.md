# Notebook_D Extension Exercises (3 of 6 completed)

## Exercise 1: Two More Model Families (ExtraTrees)
Added ExtraTrees to the 5-seed comparison protocol alongside the six core models.
**Result:** ExtraTrees MAE = 0.0229 (MASE 0.2935), ranking third among tree-based models, behind LightGBM (0.0221) and RandomForest (0.0226).
**Conclusion:** ExtraTrees does not outperform the two incumbent tree models -- LightGBM remains the best choice for this task.

## Exercise 3: Quantile Regression Intervals
Trained LightGBM with quantile loss (alpha=0.05 and 0.95) and compared empirical coverage/width to the split-conformal intervals from RQ3-1.
**Result:** quantile regression achieves 87.3% coverage with mean width 0.092, versus conformal's 93.2% coverage with width 0.1196 (23% wider).
**Conclusion:** quantile regression gives noticeably tighter intervals but under-covers relative to the 90% target and to conformal -- conformal remains the more statistically reliable choice despite the wider intervals, since it carries a distribution-free coverage guarantee that quantile regression does not.

## Exercise 4: Per-Unit Models versus the Global Model
Trained 10 separate LightGBM models (one per country, first 10 units) and compared MAE and fit time to the single global model.
**Result:** per-unit models beat the global model in 8 of 10 countries (average improvement 5-13%, e.g. AE: 0.0205 vs 0.0236), with only DE and ES slightly favoring the global model. Fit time per unit ranged 0.35-0.78 seconds.
**Conclusion:** per-unit models offer a modest but consistent accuracy gain for most countries, at the cost of linearly increasing training time with the number of units (~0.4-0.8s per country) versus a single training pass for the global model -- a real accuracy/operational-cost trade-off worth noting when considering deployment at scale.

## Exercise 5: Reliability Diagram and ECE
Plotted a reliability diagram for the event classifier's predicted probabilities and computed the Expected Calibration Error.
**Result:** ECE = 0.0584 (~5.8%), which falls in the "good" calibration range (below 0.10) and close to the "excellent" threshold (0.05).
**Conclusion:** the classifier's predicted probabilities are reasonably well-calibrated -- when it reports a given confidence level, the empirical event rate tracks that confidence fairly closely, supporting its use for probability-threshold-based alerting rather than only rank-based thresholds.

## Exercise 6: Cost-Sensitive Threshold
Assumed a missed event costs 5x a false alarm, and searched for the threshold minimising total cost (5 x missed + 1 x false alarm), compared to the F1-optimal threshold from RQ3-3.
**Result:** cost-minimising threshold = 0.65, total cost = 6476, notably lower than the F1-optimal threshold (1.0).
**Conclusion:** when missed events are penalised more heavily than false alarms, the optimal operating point shifts toward a more sensitive (lower) threshold that accepts more false alarms in exchange for fewer missed events -- illustrating that the "best" threshold depends on the real-world cost structure, not on a single universal metric like F1.
