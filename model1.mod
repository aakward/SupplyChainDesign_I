set RPW;
set FPW;

param prim_costs{RPW};
param sec_costs{RPW,FPW};
param demand{FPW};
param k;

var x{i in RPW, j in FPW}>=0;
var y{i in RPW}>=0;
var z{i in RPW},binary;

minimize cost : sum{i in RPW} prim_costs[i]*y[i] + sum{i in RPW, j in FPW} sec_costs[i,j]*x[i,j];

# Opening of RPW
s.t. con1{i in RPW} : y[i] <= 342*z[i];
# Number of RPW
s.t. con2: sum{i in RPW} z[i] <=k;
# Quantity constraint
s.t. con3 {i in RPW}: sum{j in FPW} x[i,j]<=y[i];
# Demand constraint
s.t. con4 {j in FPW} : sum{i in RPW} x[i,j] >= demand[j];

