# SAS Code

This folder contains the SAS programs used to develop the NASA C-MAPSS Predictive Maintenance project in SAS Viya.

## Project Workflow

The SAS code supports the following stages:

1. Load and prepare the NASA C-MAPSS dataset.
2. Assign meaningful variable names to the engine sensor data.
3. Create the modeling datasets for training and testing.
4. Perform feature engineering using sensor measurements.
5. Generate lag-based and moving-average features.
6. Prepare the final dataset for machine learning.
7. Use the prepared data in SAS Model Studio for predictive modeling.

## Main SAS Programs

The following programs will be included in this folder:

- `01_data_preparation.sas` – Loads and prepares the NASA C-MAPSS training and test datasets.
- `02_feature_engineering.sas` – Creates lag and moving-average features from selected engine sensor variables.
- `03_model_preparation.sas` – Prepares the final modeling dataset for use in SAS Model Studio.

## Technologies Used

- SAS Viya
- SAS Studio
- SAS Cloud Analytic Services (CAS)
- SAS Model Studio
- SAS Model Manager

## Project Context

The project uses the NASA C-MAPSS Turbofan Engine Degradation Simulation Dataset to develop machine learning models for predictive maintenance and Remaining Useful Life (RUL) analysis.

The processed datasets are used to train and compare multiple machine learning models, including:

- Forest
- Gradient Boosting
- Linear Regression

The final models are evaluated and managed using SAS Model Studio and SAS Model Manager.
