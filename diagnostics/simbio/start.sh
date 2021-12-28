# before run the nameless.m must be renamed to nameless_.m
matlab.exe -sd "." -nodisplay -nosplash -nodesktop -wait -r "run('dist/covid19_integrated_simbio/nameless_.m');run('diagnostics/simbio/run.m');"
