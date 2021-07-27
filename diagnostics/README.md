# Diagnostics

*To be sure about reproducibility we uses auto-creation of plot in different formats.*

## DBSolve - manual run

1. open model **dist/covid19_integrated_slv.slv** in DBSolve
1. set options in "ODE solver" as shown in file **diagnostics/conditions.txt**
1. save simulation to files: **diagnostics/dbsolve/default-dbsolve-IR_apo.png**, **diagnostics/dbsolve/default-dbsolve-COV_num_sputum_ml.png**
1. save options for scan in "Options => Multiplot"
1. save simulation to files: **diagnostics/dbsolve/scan-dbsolve-IR_apo.png**, **diagnostics/dbsolve/scan-dbsolve-COV_num_sputum_ml.png**

## Simbiology - semi-manual run

1. Open bash in repository root
1. ./diagnostics/simbio/start.sh or (bash ./diagnostics/simbio/start.sh)

## Matlab - semi-manual run

1. Open bash in repository root
1. ./diagnostics/matlab/start.sh or (bash ./diagnostics/matlab/start.sh)

## HetaSimulator.jl

1. Open bash in repository root
1. ./diagnostics/julia/start.sh or (bash ./diagnostics/julia/start.sh)
