/*------------------------------------------------------------*/
/* Feature Engineering                                        */
/* NASA C-MAPSS Predictive Maintenance Project                */
/*------------------------------------------------------------*/

/* Create moving average features for selected sensors */

data casuser.TRAIN_MODEL_FEATURES;
    set casuser.TRAIN_MODEL_MS;

    by Engine_ID Cycle;

    /* Reset lag variables for each new engine */
    if first.Engine_ID then do;
        Sensor_04_Lag1 = .;
        Sensor_07_Lag1 = .;
        Sensor_11_Lag1 = .;
        Sensor_12_Lag1 = .;
    end;

    /* Create lag variables */
    Sensor_04_Lag1 = lag(Sensor_04);
    Sensor_07_Lag1 = lag(Sensor_07);
    Sensor_11_Lag1 = lag(Sensor_11);
    Sensor_12_Lag1 = lag(Sensor_12);

    /* Moving average features */
    Sensor_04_MA5 = mean(
        Sensor_04,
        lag1(Sensor_04),
        lag2(Sensor_04),
        lag3(Sensor_04),
        lag4(Sensor_04)
    );

    Sensor_07_MA5 = mean(
        Sensor_07,
        lag1(Sensor_07),
        lag2(Sensor_07),
        lag3(Sensor_07),
        lag4(Sensor_07)
    );

    Sensor_11_MA5 = mean(
        Sensor_11,
        lag1(Sensor_11),
        lag2(Sensor_11),
        lag3(Sensor_11),
        lag4(Sensor_11)
    );

    Sensor_12_MA5 = mean(
        Sensor_12,
        lag1(Sensor_12),
        lag2(Sensor_12),
        lag3(Sensor_12),
        lag4(Sensor_12)
    );

    /* Remove temporary variables */
    drop Sensor_04_Lag1 Sensor_07_Lag1
         Sensor_11_Lag1 Sensor_12_Lag1;

run;


/* View the engineered dataset */
proc print data=casuser.TRAIN_MODEL_FEATURES(obs=10);
run;
