# Data

This project uses the NASA C-MAPSS Turbofan Engine Degradation Simulation Dataset.

The dataset contains multivariate time-series sensor measurements collected from simulated aircraft engines operating under different conditions.

## Dataset Structure

The project uses:

- **TRAIN_FD001** – Training data used for feature engineering and model development.
- **TEST_FD001** – Test data used for final model scoring.
- **RUL_FD001** – Remaining Useful Life values associated with the test engines.

## Key Variables

The dataset includes:

- `Engine_ID` – Unique identifier for each aircraft engine.
- `Cycle` – Operating cycle of the engine.
- `Op_Setting_1`
- `Op_Setting_2`
- `Op_Setting_3`
- Multiple sensor measurements such as `Sensor_01` through `Sensor_21`.

## Target Variable

The target variable is:

**Remaining Useful Life (RUL)**

RUL represents the number of operating cycles remaining before an engine reaches failure.

## Data Preparation

The raw NASA C-MAPSS data was processed in SAS Viya and used for:

1. Exploratory data analysis.
2. Data preparation.
3. Feature engineering.
4. Moving average feature creation.
5. Machine learning model training.
6. Model comparison.
7. Final scoring.

> The raw dataset files are not included in this repository. They should be obtained from the NASA C-MAPSS dataset source and loaded into SAS Viya.
