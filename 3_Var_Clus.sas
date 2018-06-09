libname rg '/folders/myfolders/rg';
option compress = yes;

/*var clus*/
proc contents data=rg.creditcard; run;

proc factor data=rg.creditcard nfact=87 out=rg.creditcard_factor; var V1_bin -- D406_bin; run;
data rg.creditcard_factor; set rg.creditcard_factor (drop=V1_bin -- D406_bin); run;
proc contents data=rg.creditcard_factor; run;

/*train - test split*/
data rg.train; set rg.creditcard_factor (drop=row_num); where Fraud ^= .; run;
proc contents data=rg.train; run;

data temp (drop=Fraud); set rg.creditcard_factor; where Fraud = .; run;
proc sql; 
create table temp as select a.*, b.Class_num as Fraud
from temp as a left join rg.key as b on a.row_num = b.row_num;
quit;
data rg.test; set temp (drop=row_num); where Fraud ^= .; run;
proc contents data=rg.test; run;

/*export*/
proc export data=rg.train outfile='/folders/myfolders/rg/train.csv' dbms=csv replace; run;
proc export data=rg.test outfile='/folders/myfolders/rg/test.csv' dbms=csv replace; run;
