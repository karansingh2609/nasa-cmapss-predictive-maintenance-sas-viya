/*=========================================================
  NASA C-MAPSS Predictive Maintenance Project
  05 - Model Evaluation
=========================================================*/

/*
Purpose:
Evaluate and compare the predictive maintenance models
developed in SAS Model Studio.

Models evaluated:
1. Forest
2. Gradient Boosting
3. Linear Regression

The models are evaluated on validation data using
regression performance measures and model comparison
results.
*/


/*---------------------------------------------------------
  1. Model Evaluation
---------------------------------------------------------*/

/*
The validation partition is used to assess how well
each model generalizes to unseen engine-cycle observations.

Key regression metrics considered include:

- R-Squared
- Root Mean Squared Error (RMSE)
- Mean Absolute Error (MAE)

Higher R-Squared indicates better explanatory power,
while lower RMSE and MAE indicate lower prediction error.
*/


/*---------------------------------------------------------
  2. Model Comparison
---------------------------------------------------------*/

/*
SAS Model Studio Model Comparison is used to compare
the candidate models using their validation performance.

Candidate models:

Forest
Gradient Boosting
Linear Regression

The comparison helps identify the model that provides
the best predictive performance for Remaining Useful Life
(RUL) prediction.
*/


/*---------------------------------------------------------
  3. Model Health and Interpretability
---------------------------------------------------------*/

/*
The selected model is further reviewed in SAS Model
Manager.

Model health is examined using:

- Validation performance
- Generalizability
- Influential variables
- Model diagnostics

For the Forest model, influential variables included:

- Cycle
- Sensor_11
- Sensor_11_MA5
- Sensor_04
- Sensor_12
*/


/*---------------------------------------------------------
  4. Final Model Selection
---------------------------------------------------------*/

/*
The final model should be selected based on validation
performance rather than training performance alone.

The selected model is intended to estimate the Remaining
Useful Life (RUL) of aircraft engines from sensor and
operational-cycle information.
*/
