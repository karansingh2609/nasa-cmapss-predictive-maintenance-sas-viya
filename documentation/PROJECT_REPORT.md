
# Project Report
## NASA C-MAPSS Predictive Maintenance & RUL Prediction Using SAS Viya

---

## 1. Project Overview

This project implements an end-to-end predictive maintenance workflow for turbofan engines using the NASA C-MAPSS FD001 dataset and SAS Viya.

The primary objective is to estimate the Remaining Useful Life (RUL) of an engine from its operating conditions and sensor measurements.

RUL estimation can support predictive maintenance by identifying degradation patterns before an engine reaches failure, allowing maintenance decisions to be based on predicted equipment condition rather than fixed maintenance intervals.

---

## 2. Problem Statement

Industrial equipment generates large volumes of sensor data during operation.

A key predictive maintenance problem is:

> Given the current operating cycle and sensor measurements of an engine, estimate how many operational cycles remain before failure.

This project treats RUL prediction as a supervised regression problem.

### Target Variable

`RUL`

The target represents the number of remaining operational cycles before the end of the engine's observed lifetime.

For each engine:

```text
RUL = Maximum Engine Cycle - Current Engine Cycle
````

---

## 3. Dataset

The project uses the NASA C-MAPSS FD001 turbofan engine degradation simulation dataset.

The dataset contains multivariate time-series observations collected across engine operating cycles.

### Main Data Components

* Training data
* Test data
* Test-set RUL values

### Important Variables

| Variable                  | Description                  |
| ------------------------- | ---------------------------- |
| `Engine_ID`               | Unique engine identifier     |
| `Cycle`                   | Operational cycle            |
| `Op_Setting_1`            | Operating condition          |
| `Op_Setting_2`            | Operating condition          |
| `Op_Setting_3`            | Operating condition          |
| `Sensor_02` – `Sensor_21` | Engine sensor measurements   |
| `RUL`                     | Remaining Useful Life target |

---

## 4. Technology Stack

* SAS Viya
* SAS Studio
* CAS
* SAS Model Studio
* SAS Model Manager
* SAS Programming
* Machine Learning
* Time-Series Feature Engineering
* Regression Modeling

---

## 5. Project Workflow

The project follows the following machine learning lifecycle:

```text
NASA C-MAPSS Dataset
        |
        v
Data Import & Validation
        |
        v
Data Preparation
        |
        v
Feature Engineering
        |
        v
Model Preparation
        |
        v
Model Development
        |
        +--------------------+
        |                    |
        v                    v
      Forest        Gradient Boosting
        |                    |
        +---------+----------+
                  |
                  v
          Linear Regression
                  |
                  v
          Model Comparison
                  |
                  v
          Champion Selection
                  |
                  v
          Model Evaluation
                  |
                  v
          Model Manager
```

---

## 6. Data Preparation

The raw C-MAPSS data was imported into SAS Viya and prepared for machine learning.

The preparation stage included:

* Importing the training dataset
* Importing the test dataset
* Importing the RUL reference data
* Assigning meaningful variable names
* Identifying engine and cycle information
* Creating the RUL target for training data
* Mapping test-set RUL values to the corresponding engines
* Assigning appropriate variable roles
* Preparing modeling tables

`Engine_ID` was treated as an identifier rather than a predictive input.

`RUL` was assigned as the modeling target.

---

## 7. Sensor Analysis

The sensor variables were examined to determine their usefulness for RUL prediction.

Several sensors were identified as constant or non-informative and were removed from the candidate modeling inputs.

The constant sensors identified during the analysis were:

```text
Sensor_01
Sensor_05
Sensor_10
Sensor_16
Sensor_18
Sensor_19
```

The remaining sensors were evaluated based on their relationship with the RUL target and their potential contribution to predicting degradation.

---

## 8. Feature Engineering

Because the dataset represents engine behavior over operational cycles, individual sensor observations can be noisy.

To capture short-term degradation trends, rolling features were created using a five-cycle moving average.

The engineered features were:

```text
Sensor_04_MA5
Sensor_07_MA5
Sensor_11_MA5
Sensor_12_MA5
```

The moving average was calculated within each `Engine_ID` so that observations from different engines were not mixed.

Conceptually:

```text
MA5(t) =
Average of the current sensor value
and the previous four cycle observations
```

This allows the models to use both the current sensor measurement and its recent local trend.

---

## 9. Model Development

Three machine learning approaches were developed in SAS Model Studio.

### 9.1 Forest

The Forest model uses an ensemble of decision trees to model nonlinear relationships between sensor measurements, operating cycles, and RUL.

The final displayed Forest configuration included:

* Number of trees: 100
* Variables per split: 5
* Bootstrap percentage: 60%
* Number of bins: 50
* Maximum depth: 20

The Forest model was selected as the champion in the displayed model comparison.

---

### 9.2 Gradient Boosting

Gradient Boosting was included as a second tree-based nonlinear modeling approach.

It builds an ensemble of sequential models where later models focus on reducing errors made by previous models.

This provides a useful comparison against the Forest model.

---

### 9.3 Linear Regression

Linear Regression was included as a baseline regression model.

It provides a simpler reference point against the nonlinear tree-based models and helps evaluate whether nonlinear modeling provides additional predictive value.

---

## 10. Model Comparison

The three models were compared using the test partition.

| Model             | Average Squared Error | Root Average Squared Error | Root Mean Absolute Error | Root Mean Squared Error |
| ----------------- | --------------------: | -------------------------: | -----------------------: | ----------------------: |
| Forest            |             1241.0656 |                    35.2288 |                   4.9319 |                  0.3506 |
| Gradient Boosting |             1264.4624 |                    35.5593 |                   4.9853 |                  0.3717 |
| Linear Regression |             1592.5749 |                    39.9071 |                   5.5027 |                  0.6027 |

Based on the displayed model comparison, the Forest model was selected as the champion.

The Forest model produced the lowest displayed error values among the three candidate models.

---

## 11. Forest Error Analysis

The Forest error plot was used to examine how model error changes as the number of trees increases.

In the displayed configuration, the validation partition reached its minimum average squared error at:

```text
Number of Trees = 87
Validation Error = 1,251.981
```

The plot provides an indication of how increasing the number of trees affects training, validation, test, and out-of-bag error.

---

## 12. Prediction Analysis

The predicted-versus-actual visualization was used to compare model predictions with observed RUL values.

A prediction that closely follows the diagonal reference line indicates better agreement between predicted and actual target values.

The project also examined predicted and actual target means across model depth to understand prediction behavior throughout the Forest structure.

---

## 13. Model Interpretability

The Forest model's influential variables were examined to understand which inputs contributed strongly to the model.

Important variables identified during model analysis included:

```text
Cycle
Sensor_11
Sensor_11_MA5
Sensor_04
Sensor_12
```

This analysis provides a degree of model interpretability and helps connect the machine learning results with the underlying engine degradation process.

---

## 14. SAS Model Manager

SAS Model Manager was used to review the developed model beyond basic predictive performance.

The review included:

* Model performance
* Model health
* Generalizability
* Influential variables

The model health analysis identified a generalizability-related warning in the displayed Forest model.

This is documented as a model limitation rather than being hidden from the project results.

Further model tuning and validation could be performed as a future improvement.

---

## 15. Key Results

The project successfully established an end-to-end RUL prediction workflow in SAS Viya.

Key outcomes include:

* C-MAPSS FD001 data successfully prepared for modeling
* Non-informative sensor variables identified
* Time-series moving-average features engineered
* Three regression models developed
* Forest selected as the displayed champion model
* Model performance compared using SAS Model Studio
* Prediction behavior analyzed visually
* Influential variables identified
* Model health and generalizability reviewed using SAS Model Manager

---

## 16. Limitations

The project is based on the NASA C-MAPSS FD001 simulated turbofan engine dataset.

Therefore, the results should not be interpreted as direct evidence of performance on real-world industrial engines.

The Model Manager analysis also indicated a generalizability-related warning for the displayed Forest model.

Potential improvements include:

* Hyperparameter tuning
* Cross-validation strategies
* Additional temporal features
* Sensor trend and degradation-rate features
* Evaluation on additional C-MAPSS subsets
* Comparison with additional machine learning algorithms
* Deployment of the model through a production scoring pipeline

---

## 17. Future Improvements

Future development could extend the project toward a production-oriented predictive maintenance system.

Possible improvements include:

1. Automated model retraining
2. Model monitoring
3. Additional feature engineering
4. Hyperparameter optimization
5. Model explainability
6. Real-time sensor scoring
7. Maintenance alert generation
8. API-based model deployment
9. Dashboard-based visualization
10. Integration with industrial IoT systems

---

## 18. Reproducibility

The project workflow is organized into separate SAS programs:

```text
sas-code/
├── 01_data_preparation.sas
├── 02_feature_engineering.sas
├── 03_model_preparation.sas
├── 04_model_development.sas
├── 05_model_evaluation.sas
└── 06_model_manager.sas
```

The programs document the major stages of the analytical workflow and provide a structured starting point for reproducing the project.

---

## 19. Conclusion

This project demonstrates an end-to-end predictive maintenance workflow using SAS Viya and NASA C-MAPSS FD001 data.

The workflow progresses from raw engine telemetry through data preparation, time-series feature engineering, machine learning model development, model comparison, prediction analysis, and model management.

The project demonstrates how SAS Viya can be used to build and evaluate predictive maintenance models while maintaining a structured machine learning lifecycle.

````
