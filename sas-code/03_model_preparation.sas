/*------------------------------------------------------------*/
/* Model Preparation                                          */
/* NASA C-MAPSS Predictive Maintenance Project                */
/*------------------------------------------------------------*/

/* Create the final modeling dataset */

data casuser.TRAIN_MODEL_FINAL;
    set casuser.TRAIN_MODEL_FEATURES;

    /* Keep variables required for model development */

    keep
        Engine_ID
        Cycle
        Op_Setting_1
        Op_Setting_2
        Op_Setting_3
        Sensor_01
        Sensor_02
        Sensor_03
        Sensor_04
        Sensor_05
        Sensor_06
        Sensor_07
        Sensor_08
        Sensor_09
        Sensor_10
        Sensor_11
        Sensor_12
        Sensor_13
        Sensor_14
        Sensor_15
        Sensor_16
        Sensor_17
        Sensor_18
        Sensor_19
        Sensor_20
        Sensor_21
        Sensor_04_MA5
        Sensor_07_MA5
        Sensor_11_MA5
        Sensor_12_MA5
        RUL;
run;


/* Verify the final modeling dataset */

proc contents data=casuser.TRAIN_MODEL_FINAL;
run;

proc print data=casuser.TRAIN_MODEL_FINAL(obs=10);
run;
