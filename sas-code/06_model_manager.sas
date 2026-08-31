/*=========================================================
  NASA C-MAPSS Predictive Maintenance Project
  06 - Model Management
=========================================================*/

/*
Purpose:
Document the final model review and model-management
stage of the predictive maintenance workflow.

SAS Model Manager is used to review the developed model,
its validation performance, model health, and influential
variables.
*/


/*---------------------------------------------------------
  1. Model Health Review
---------------------------------------------------------*/

/*
The final model is reviewed using the validation partition.

Model health indicators include:

- Accuracy
- Generalizability
- R-Squared
- R-Squared Difference
*/


/*---------------------------------------------------------
  2. Influential Variables
---------------------------------------------------------*/

/*
The Forest model identified the following influential
variables:

1. Cycle
2. Sensor_11
3. Sensor_11_MA5
4. Sensor_04
5. Sensor_12

These variables provide important information about
aircraft engine degradation and Remaining Useful Life.
*/


/*---------------------------------------------------------
  3. Model Generalizability
---------------------------------------------------------*/

/*
Model generalizability is evaluated to determine whether
the model performs consistently on validation data.

A model should not be selected only because it performs
well on training data.

Validation performance and generalization should be
considered before deployment.
*/


/*---------------------------------------------------------
  4. Model Deployment Readiness
---------------------------------------------------------*/

/*
The model-management stage provides a final review before
a predictive model is considered for operational use.

The workflow supports:

- Model documentation
- Model health monitoring
- Influential-variable analysis
- Validation review
- Future model monitoring
*/


/*---------------------------------------------------------
  5. Project Output
---------------------------------------------------------*/

/*
Final objective:

Estimate the Remaining Useful Life (RUL) of aircraft
engines using historical sensor measurements and operating
cycle information.

The completed workflow demonstrates an end-to-end
predictive maintenance process using SAS Viya and
SAS Model Studio.
*/
