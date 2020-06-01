# Change Log

## 0.1.2 - implementation of Immune Response (empiric)

- To introduce new variable COVass_vpc designating assembled virus amount in vPC and implement release of COV from vPC from the variable. Delete release of the virus from COV_vpc.
- Cell death leads to release of the virus bound with ACE2 at the cell surface. ACE2 is degraded. 
- To introduce 2 modes of immune response in empiric way: (i) Spike specific antibodies ( IgG/IgM) interfere binding of virus ACE2 (ii) stimulation of death of infected cells
- Introduction of sputum dilution coefficient
- Change in parameters k_rep_cov_rna_vpc , k_ass_cov_vpc , kbase_tran_pc_ipc , kbase_tran_ipc_vpc to describe clinically measured data on viral load and percent of subgenomic viral mRNA in sputum

## 0.1.1 - changes in implementation of ACE2/COV binding

- To introduce limitation in number of virions able to bind to PCII cell to avoid non-physiological accumulation of (i) the virions on the cell surface and (ii) virus RNA in nucleus
- Reproduction of clinical data on virus load dynamics

## 0.1.0 - first public release

- To develop a structure and to perform initial calibration of viral dynamics model for SARS-CoV-2
