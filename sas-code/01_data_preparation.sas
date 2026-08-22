/*==============================================================*/
/* Project: NASA C-MAPSS Predictive Maintenance                  */
/* File: b1_data_preparation.sas                                 */
/* Purpose: Prepare the NASA C-MAPSS data for machine learning   */
/*==============================================================*/


/*--------------------------------------------------------------*/
/* STEP 1: Verify source datasets                                */
/*--------------------------------------------------------------*/

proc contents data=casuser.TRAIN_FD001;
run;

proc contents data=casuser.TEST_FD001;
run;

proc contents data=casuser.RUL_FD001;
run;


/*--------------------------------------------------------------*/
/* STEP 2: Create Remaining Useful Life (RUL) target             */
/*--------------------------------------------------------------*/

/* Find the maximum cycle for each engine */

proc sql;
   create table work.MAX_CYCLE as
   select Engine_ID,
          max(Cycle) as Max_Cycle
   from casuser.TRAIN_FD001
   group by Engine_ID;
quit;


/* Calculate RUL */

proc sql;
   create table work.TRAIN_WITH_RUL as
   select a.*,
          b.Max_Cycle,
          (b.Max_Cycle - a.Cycle) as RUL
   from casuser.TRAIN_FD001 as a
   left join work.MAX_CYCLE as b
   on a.Engine_ID = b.Engine_ID;
quit;


/*--------------------------------------------------------------*/
/* STEP 3: Cap RUL                                               */
/*--------------------------------------------------------------*/

/* Cap the target value to reduce the influence of very high RUL */

data work.TRAIN_RUL_CAPPED;
   set work.TRAIN_WITH_RUL;

   if RUL > 125 then RUL = 125;
run;


/*--------------------------------------------------------------*/
/* STEP 4: Validate prepared training data                       */
/*--------------------------------------------------------------*/

proc print data=work.TRAIN_RUL_CAPPED(obs=10);
   var Engine_ID Cycle RUL;
run;

proc means data=work.TRAIN_RUL_CAPPED
           n mean std min max;
   var RUL;
run;


/*--------------------------------------------------------------*/
/* STEP 5: Save prepared dataset                                 */
/*--------------------------------------------------------------*/

data casuser.TRAIN_PREPARED;
   set work.TRAIN_RUL_CAPPED;
run;


/* Verify final prepared dataset */

proc contents data=casuser.TRAIN_PREPARED;
run;

proc print data=casuser.TRAIN_PREPARED(obs=10);
run;


/*==============================================================*/
/* End of Data Preparation                                      */
/*==============================================================*/
