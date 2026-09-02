# Model Results

## Model Comparison

The following results are taken directly from the SAS Model Studio Model Comparison output for the test partition.

| Model | Average Squared Error | Root Average Squared Error | Root Mean Absolute Error | Root Mean Squared Error |
|---|---:|---:|---:|---:|
| Forest | 1241.0656 | 35.2288 | 4.9319 | 0.3506 |
| Gradient Boosting | 1264.4624 | 35.5593 | 4.9853 | 0.3717 |
| Linear Regression | 1592.5749 | 39.9071 | 5.5027 | 0.6027 |

> **Note:** The metric names above reproduce the labels displayed in the SAS Model Studio screenshot. The values are reported as displayed by SAS and are not independently reinterpreted.

---

## Champion Model

### Forest

The Forest model was selected as the champion in the displayed SAS Model Studio model comparison.

It achieved the lowest displayed values across the comparison metrics among the three evaluated models.

The champion selection is visible in the SAS Model Studio Model Comparison output.

![Model Comparison](../screenshots/03_model_comparison.png)

---

## Forest Configuration

The displayed Forest procedure output documents the following configuration:

| Parameter | Value |
|---|---:|
| Number of Trees | 100 |
| Variables Per Split | 5 |
| Seed | 12345 |
| Bootstrap Percentage | 60 |
| Number of Bins | 50 |
| Maximum Depth | 20 |

![Forest Procedure Output](../screenshots/04_forest_procedure_output.png)

---

## Forest Error Analysis

The Forest error plot shows the relationship between the number of trees and average squared error across the available data partitions.

For the displayed model:

- Validation minimum error: **1,251.981**
- Number of trees at validation minimum: **87**

![Forest Error Plot](../screenshots/02_forest_error_plot.png)

---

## Prediction Analysis

### Predicted vs Actual

The predicted-versus-actual visualization compares the predicted target mean with the actual target mean across the data.

![Predicted by Actual](../screenshots/06_predicted_by_actual.png)

### Prediction by Depth

The prediction-by-depth visualization compares predicted and actual target means across the depth of the Forest model.

![Predicted by Depth](../screenshots/07_predicted_by_depth.png)

---

## Influential Variables

The model analysis identified the following variables among the important inputs:

1. `Cycle`
2. `Sensor_11`
3. `Sensor_11_MA5`
4. `Sensor_04`
5. `Sensor_12`

These variables provide insight into which engine-cycle and sensor-derived measurements contributed strongly to the Forest model.

---

## Model Health

SAS Model Manager was used to review model health and generalizability.

The displayed model passed the R-Squared health check but showed a generalizability-related warning.

This result is retained as part of the project's model evaluation rather than being omitted.

---

## Results Summary

The modeling experiment demonstrated that:

- Forest performed best among the three displayed candidate models.
- Gradient Boosting provided a competitive nonlinear alternative.
- Linear Regression produced higher displayed error values.
- Increasing the Forest tree count reduced error rapidly before reaching a relatively stable region.
- Sensor measurements and engineered moving-average features contributed to the predictive model.
- Model Manager provided additional information beyond predictive performance, including model health and generalizability.

---

## Evidence

All results presented in this document are supported by screenshots captured from the SAS Viya Model Studio workflow.

Relevant evidence is available in:

```text
screenshots/
├── 02_forest_error_plot.png
├── 03_model_comparison.png
├── 04_forest_procedure_output.png
├── 06_predicted_by_actual.png
└── 07_predicted_by_depth.png
