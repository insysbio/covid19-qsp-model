# Change Log

## Mph_0.1.0 - development of macrophage life cycle sub-model

- Mph passport was downloaded from IRT and upgraded to take into account lung specific features and implement new regulations
- The upgraded Mph sub-model describes: (i) influx of monocytes (PBM) from bone marrow regulated by GMCSF, (ii) PBM migration to lung tissue stimulated by CCL2, CXCL10 and TGFb, (iii) PBM polarization to M1/M2 macrophages regulated by Antigen, IFNg, IL10, TGFb, IL4 and IL13, (iv) IL1b, IL6, IL10, IL12, IL23, TNFa, TGFb, CXCL10 and CCL2 production by the PBM and macrophages, (v) cytokine/chemokine distribution between lung tissue, plasma and lymph node, (vi) cytokine chemokine degradation
- In vivo baseline data on PBM, iMph, M1, M2 and several cytokines/chemokines were extracted from Cytocon DB and further used for fitting of model parameters 
- Model is preliminary calibrated against available in vitro data describing regulatory effects of cytokines/chemokines on cell dynamics and then finally calibrated against in vivo baseline data measured for healthy subjects


## VL_0.1.2 - implementation of Immune Response (empiric)

- To introduce new variable COVass_vpc designating assembled virus amount in vPC and implement release of COV from vPC from the variable. Delete release of the virus from COV_vpc.
- Cell death leads to release of the virus bound with ACE2 at the cell surface. ACE2 is degraded. 
- To introduce 2 modes of immune response in empiric way: (i) Spike specific antibodies ( IgG/IgM) interfere binding of virus ACE2 (ii) stimulation of death of infected cells
- Introduction of sputum dilution coefficient
- Change in parameters k_rep_cov_rna_vpc , k_ass_cov_vpc , kbase_tran_pc_ipc , kbase_tran_ipc_vpc to describe clinically measured data on viral load and percent of subgenomic viral mRNA in sputum

## VL_0.1.1 - changes in implementation of ACE2/COV binding

- To introduce limitation in number of virions able to bind to PCII cell to avoid non-physiological accumulation of (i) the virions on the cell surface and (ii) virus RNA in nucleus
- Reproduction of clinical data on virus load dynamics

## VL_0.1.0 - first public release

- To develop a structure and to perform initial calibration of viral dynamics model for SARS-CoV-2
