/*------------------------------------------------------------*/
/* Model Development                                          */
/* NASA C-MAPSS Predictive Maintenance Project                */
/*------------------------------------------------------------*/

/*
   Modeling objective:
   Predict Remaining Useful Life (RUL) using engine cycle,
   operational settings, sensor measurements, and engineered
   moving average features.
*/


/* Verify the final modeling dataset */

proc contents data=casuser.TRAIN_MODEL_FINAL;
run;


/* Review the target variable */

proc means data=casuser.TRAIN_MODEL_FINAL
           mean std min max;
    var RUL;
run;


/*
   The final dataset is used in SAS Model Studio.

   Regression models developed in the pipeline:

   1. Forest
   2. Gradient Boosting
   3. Linear Regression

   The models are connected to a Model Comparison node
   to evaluate predictive performance.
*/


/* Create a CAS table for model development */

data casuser.MODELING_DATA;
    set casuser.TRAIN_MODEL_FINAL;
run;


/* Verify the modeling table */

proc print data=casuser.MODELING_DATA(obs=10);
run;
