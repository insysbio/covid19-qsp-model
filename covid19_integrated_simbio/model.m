%{
  This model was created by Heta compiler.
  Additional functions and constants for compatibility see in "fun.m"
  export from : out_simbio @SimbioExport {...};
  
  
%}

sbioaddtolibrary(sbiounit('week', 'day', 7));

out_simbio_model = sbiomodel('out_simbio');

% Useful parameters
addparameter(out_simbio_model, 'timeOne', 1, 'ValueUnits', 'hour');
















