# SAS Code

This folder contains the SAS programs used for data preparation, feature engineering, and model-related processing in the NASA C-MAPSS Predictive Maintenance project.

## Project Workflow

The SAS code supports the following workflow:

1. Load the NASA C-MAPSS training and test datasets into SAS Viya.
2. Prepare and validate the input variables.
3. Create engineered features from sensor measurements.
4. Generate moving average features for selected sensors.
5. Prepare the final modeling dataset.
6. Use SAS Model Studio to train and compare machine learning models.
7. Score the test data using the selected model.

## Main Data Tables

During the project, the following tables were created:

| Table | Purpose |
|---|---|
| `TRAIN_FD001` | Original training dataset |
| `TEST_FD001` | Original test dataset |
| `RUL_FD001` | Remaining Useful Life information |
| `TRAIN_MODEL_V1` | Initial modeling dataset |
| `TRAIN_MODEL_FINAL` | Final training dataset |
| `TRAIN_MODEL_MS` | Dataset prepared for SAS Model Studio |

## Feature Engineering

Feature engineering included the creation of moving average features for selected sensors:

- `Sensor_04_MA5`
- `Sensor_07_MA5`
- `Sensor_11_MA5`
- `Sensor_12_MA5`

These features were created using rolling windows within each `Engine_ID`.

## Modeling

The prepared dataset was used in SAS Model Studio to build and compare multiple regression models, including:

- Forest
- Gradient Boosting
- Linear Regression

The models were evaluated using regression performance metrics such as:

- RMSE
- MAE

The best-performing model was then selected for final scoring.
