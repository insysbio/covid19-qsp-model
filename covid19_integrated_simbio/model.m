%{
  This model was created by Heta compiler.
  Additional functions and constants for compatibility see in "fun.m"
  export from : #export { format: Simbio, namespace: nameless, ...};
%}

sbioaddtolibrary(sbiounit('week', 'day', 7));

nameless_model = sbiomodel('nameless');

% Useful parameters
addparameter(nameless_model, 'timeOne', 1, 'ValueUnits', 'hour');

% Compartments
nameless.compartment.Vol_alv = addcompartment(nameless_model, 'Vol_alv', 'ConstantCapacity', false, 'Capacity', 0.014, 'CapacityUnits', 'litre', 'Notes', '<p>calculated as (width of linning layer)<em>(lunf surface area) = (0.1 - 0.3 um)</em>(66 - 75 m)</p>', 'Tag', '');

% Species
nameless.species.PC = addspecies(nameless.compartment.Vol_alv, 'PC', 'ConstantAmount', false, 'InitialAmount', 2643000000, 'InitialAmountUnits', 'kiloitem/litre', 'BoundaryCondition', false, 'Notes', '<p>calculated on the basis of total type II pneumocytes number per lungs (see ref) and volume of lung surfactant equal to 0.014L</p>', 'Tag', '');
nameless.species.iPC = addspecies(nameless.compartment.Vol_alv, 'iPC', 'ConstantAmount', false, 'InitialAmount', 1, 'InitialAmountUnits', 'kiloitem/litre', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.vPC = addspecies(nameless.compartment.Vol_alv, 'vPC', 'ConstantAmount', false, 'InitialAmount', 1, 'InitialAmountUnits', 'kiloitem/litre', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.PC_hs_ss = addspecies(nameless.compartment.Vol_alv, 'PC_hs_ss', 'ConstantAmount', false, 'InitialAmount', 2643000000, 'InitialAmountUnits', 'kiloitem/litre', 'BoundaryCondition', true, 'Notes', '<p>estimate for type II pneumocytes was taken</p>', 'Tag', '');
nameless.species.ACE2_pc = addspecies(nameless.compartment.Vol_alv, 'ACE2_pc', 'ConstantAmount', false, 'InitialAmount', 615, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '<p>based on 1e4 ACE2 per cell</p>', 'Tag', '');
nameless.species.ACE2_pc_hs_ss = addspecies(nameless.compartment.Vol_alv, 'ACE2_pc_hs_ss', 'ConstantAmount', false, 'InitialAmount', 615, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', true, 'Notes', '<p>based on 1e4 ACE2 per cell and total PC II number in lungs equal to 37e9 [7103258]</p>', 'Tag', '');
nameless.species.COV_ACE2_pc = addspecies(nameless.compartment.Vol_alv, 'COV_ACE2_pc', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.ACE2_ipc = addspecies(nameless.compartment.Vol_alv, 'ACE2_ipc', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.COV_ACE2_ipc = addspecies(nameless.compartment.Vol_alv, 'COV_ACE2_ipc', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.COV_ipc = addspecies(nameless.compartment.Vol_alv, 'COV_ipc', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.ACE2_vpc = addspecies(nameless.compartment.Vol_alv, 'ACE2_vpc', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.COV_ACE2_vpc = addspecies(nameless.compartment.Vol_alv, 'COV_ACE2_vpc', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.COV_vpc = addspecies(nameless.compartment.Vol_alv, 'COV_vpc', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.COV_RNA_vpc = addspecies(nameless.compartment.Vol_alv, 'COV_RNA_vpc', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.COV = addspecies(nameless.compartment.Vol_alv, 'COV', 'ConstantAmount', false, 'InitialAmount', 0.002, 'InitialAmountUnits', 'picomole/litre', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.COV_RNA = addspecies(nameless.compartment.Vol_alv, 'COV_RNA', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole/litre', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.COVass_vpc = addspecies(nameless.compartment.Vol_alv, 'COVass_vpc', 'ConstantAmount', false, 'InitialAmount', 0, 'InitialAmountUnits', 'picomole', 'BoundaryCondition', false, 'Notes', '', 'Tag', '');
nameless.species.anti_Ab = addspecies(nameless.compartment.Vol_alv, 'anti_Ab', 'ConstantAmount', false, 'InitialAmountUnits', 'picomole/litre', 'BoundaryCondition', true, 'Notes', '<p>hill like expression describes general kinetic pattern observed for Spike specific IgG and IgM in [32350462]</p>', 'Tag', '');

% Parameters
nameless.parameter.time_day = addparameter(nameless_model, 'time_day', 'ConstantValue', false, 'ValueUnits', 'day', 'Notes', '', 'Tag', '');
nameless.parameter.k_syn_ace2_pc = addparameter(nameless_model, 'k_syn_ace2_pc', 'ConstantValue', false, 'ValueUnits', 'picomole/litre/hour', 'Notes', '', 'Tag', '');
nameless.parameter.k_tran_pc_ipc = addparameter(nameless_model, 'k_tran_pc_ipc', 'ConstantValue', false, 'ValueUnits', '1/hour', 'Notes', '', 'Tag', '');
nameless.parameter.k_tran_ipc_vpc = addparameter(nameless_model, 'k_tran_ipc_vpc', 'ConstantValue', false, 'ValueUnits', '1/hour', 'Notes', '', 'Tag', '');
nameless.parameter.VO = addparameter(nameless_model, 'VO', 'ConstantValue', false, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.Kd_cov_ace2 = addparameter(nameless_model, 'Kd_cov_ace2', 'ConstantValue', false, 'ValueUnits', 'picomole/litre', 'Notes', '<p>Kd for viral Spike receptor binding domain (RBD) and ACE2 receptor is known and equal to 4.67 nM. Basing on estimate that virion includes  VO*Num<em>sp</em>per_cov free spike proteins ready to bind to ACE2 we have come to the equation for apparent Kd describing binding of virion and ACE2</p>', 'Tag', '');
nameless.parameter.ACE2_pc_per_cell = addparameter(nameless_model, 'ACE2_pc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_ACE2_pc_per_cell = addparameter(nameless_model, 'COV_ACE2_pc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.ACE2_ipc_per_cell = addparameter(nameless_model, 'ACE2_ipc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_ACE2_ipc_per_cell = addparameter(nameless_model, 'COV_ACE2_ipc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_ipc_per_cell = addparameter(nameless_model, 'COV_ipc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.ACE2_vpc_per_cell = addparameter(nameless_model, 'ACE2_vpc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_ACE2_vpc_per_cell = addparameter(nameless_model, 'COV_ACE2_vpc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_vpc_per_cell = addparameter(nameless_model, 'COV_vpc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COVass_vpc_per_cell = addparameter(nameless_model, 'COVass_vpc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_RNA_vpc_per_cell = addparameter(nameless_model, 'COV_RNA_vpc_per_cell', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_num_sputum_ml = addparameter(nameless_model, 'COV_num_sputum_ml', 'ConstantValue', false, 'ValueUnits', 'item/millilitre', 'Notes', '', 'Tag', '');
nameless.parameter.PC_tot = addparameter(nameless_model, 'PC_tot', 'ConstantValue', false, 'ValueUnits', 'kiloitem/litre', 'Notes', '', 'Tag', '');
nameless.parameter.PC_percent = addparameter(nameless_model, 'PC_percent', 'ConstantValue', false, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.iPC_percent = addparameter(nameless_model, 'iPC_percent', 'ConstantValue', false, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.vPC_percent = addparameter(nameless_model, 'vPC_percent', 'ConstantValue', false, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.ACE2_pc_per_cell_tot = addparameter(nameless_model, 'ACE2_pc_per_cell_tot', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.ACE2_ipc_per_cell_tot = addparameter(nameless_model, 'ACE2_ipc_per_cell_tot', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.ACE2_vpc_per_cell_tot = addparameter(nameless_model, 'ACE2_vpc_per_cell_tot', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_pc_per_cell_tot = addparameter(nameless_model, 'COV_pc_per_cell_tot', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_ipc_per_cell_tot = addparameter(nameless_model, 'COV_ipc_per_cell_tot', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.COV_vpc_per_cell_tot = addparameter(nameless_model, 'COV_vpc_per_cell_tot', 'ConstantValue', false, 'ValueUnits', 'item/item', 'Notes', '', 'Tag', '');
nameless.parameter.steric_factor_pc = addparameter(nameless_model, 'steric_factor_pc', 'ConstantValue', false, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.steric_factor_ipc = addparameter(nameless_model, 'steric_factor_ipc', 'ConstantValue', false, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.steric_factor_vpc = addparameter(nameless_model, 'steric_factor_vpc', 'ConstantValue', false, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.COV_sgRNA_perc = addparameter(nameless_model, 'COV_sgRNA_perc', 'ConstantValue', false, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.IR_apo = addparameter(nameless_model, 'IR_apo', 'ConstantValue', false, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.k_apo_vpc = addparameter(nameless_model, 'k_apo_vpc', 'ConstantValue', false, 'ValueUnits', '1/hour', 'Notes', '', 'Tag', '');
nameless.parameter.switch_ir = addparameter(nameless_model, 'switch_ir', 'ConstantValue', false, 'Value', 0, 'ValueUnits', 'dimensionless', 'Notes', '<p>assumed</p>', 'Tag', '');
nameless.parameter.kcell_to_cell = addparameter(nameless_model, 'kcell_to_cell', 'ConstantValue', true, 'Value', 1000, 'ValueUnits', 'item/kiloitem', 'Notes', '', 'Tag', '');
nameless.parameter.NA_pmole = addparameter(nameless_model, 'NA_pmole', 'ConstantValue', true, 'Value', 602000000000, 'ValueUnits', 'item/picomole', 'Notes', '', 'Tag', '');
nameless.parameter.sputum_dilution_coef = addparameter(nameless_model, 'sputum_dilution_coef', 'ConstantValue', true, 'Value', 0.1, 'ValueUnits', 'dimensionless', 'Notes', '', 'Tag', '');
nameless.parameter.k_apo_pc = addparameter(nameless_model, 'k_apo_pc', 'ConstantValue', true, 'Value', 0.00082, 'ValueUnits', '1/hour', 'Notes', '<p>the value was estimated from the HS submodel at steady state. Indeed, taking into account that (i) PC2 is precursors of PC1 [9227501], (ii) life span of PC1 is about 120 days [20616357], (iii) ratio of PC1/PC2 at steady state = 19/37 [7103258] we represented lung cell  dynamics system as follows: --(Vol<em>alv*k</em>mat<em>pc) --&gt; PC2 --(Vol</em>alv*k<em>dif</em>pc*PC2)--&gt; PC1--(Vol<em>alv*k</em>apo<em>pc1*PC1)--&gt;. Then consider the system at steady state and assuming that lifespan (T</em>ls) corresponds to time required for 99% of cell die we have come to following formulas: (a) k<em>apo</em>pc1 = ln(1/0.01)/(120 days) = 1.6e-3 1/h, (b) k<em>dif</em>pc = k<em>apo</em>pc1*PC1<em>ss/PC2</em>ss = 8.2e-4 1/h, (c) k<em>mat</em>pc = k<em>dif</em>pc*PC2<em>ss. Since  PC2 to PC1 transition was not considered in the version of the model we can assume that k</em>apo<em>pc = k</em>dif_pc</p>', 'Tag', '');
nameless.parameter.kbase_apo_vpc = addparameter(nameless_model, 'kbase_apo_vpc', 'ConstantValue', true, 'Value', 0.00082, 'ValueUnits', '1/hour', 'Notes', '<p>the value was estimated from [PMID 18487354] only</p>', 'Tag', '');
nameless.parameter.kbase_tran_pc_ipc = addparameter(nameless_model, 'kbase_tran_pc_ipc', 'ConstantValue', true, 'Value', 10, 'ValueUnits', '1/picomole*litre/hour', 'Notes', '<p>fitted to describe in vivo viral load dynamics</p>', 'Tag', '');
nameless.parameter.kbase_tran_ipc_vpc = addparameter(nameless_model, 'kbase_tran_ipc_vpc', 'ConstantValue', true, 'Value', 10, 'ValueUnits', '1/picomole*litre/hour', 'Notes', '<p>fitted to describe in vivo viral load dynamics</p>', 'Tag', '');
nameless.parameter.k_shed_ace2_pc = addparameter(nameless_model, 'k_shed_ace2_pc', 'ConstantValue', true, 'Value', 1.8, 'ValueUnits', '1/hour', 'Notes', '<p>rate constant of shedding catalysed by ADAM17/TACE = 5e-4 1/s</p>', 'Tag', '');
nameless.parameter.k_off_cov_ace2 = addparameter(nameless_model, 'k_off_cov_ace2', 'ConstantValue', true, 'Value', 23.56, 'ValueUnits', '1/hour', 'Notes', '<p>k_off for viral Spike receptor binding domain (RBD) and ACE2 receptor</p>', 'Tag', '');
nameless.parameter.Num_sp_per_cov = addparameter(nameless_model, 'Num_sp_per_cov', 'ConstantValue', true, 'Value', 150, 'ValueUnits', 'dimensionless', 'Notes', '<p>Basing on estimate  that virion diameter=120-160 nm and Spike height=20nm we have come to following number of Spikes per virion = 4<em>3.14</em>(70 nm)^2/(3.14<em>(10 nm)^2)  = 4</em>49 = 196. Assuming that &quot;dynamic&quot; diameter of Spike is little bit more we have assumed that there are about  150 spike proteins per 1 virion.</p>', 'Tag', '');
nameless.parameter.Kd_spike_ace2 = addparameter(nameless_model, 'Kd_spike_ace2', 'ConstantValue', true, 'Value', 4670, 'ValueUnits', 'picomole/litre', 'Notes', '<p>Kd for viral Spike receptor binding domain (RBD) and ACE2</p>', 'Tag', '');
nameless.parameter.k_ent_cov_ipc = addparameter(nameless_model, 'k_ent_cov_ipc', 'ConstantValue', true, 'Value', 0.936, 'ValueUnits', '1/hour', 'Notes', '<p>estimated on the basis of rate constant of endocytosis for Influenza virus</p>', 'Tag', '');
nameless.parameter.k_rel_cov_vpc = addparameter(nameless_model, 'k_rel_cov_vpc', 'ConstantValue', true, 'Value', 2, 'ValueUnits', '1/hour', 'Notes', '<p>fitted to describe in vivo viral load dynamics averaged across 9 patients</p>', 'Tag', '');
nameless.parameter.k_unc_cov_vpc = addparameter(nameless_model, 'k_unc_cov_vpc', 'ConstantValue', true, 'Value', 14, 'ValueUnits', '1/hour', 'Notes', '<p>estimated on the basis of rate constant of endocytosis for Influenza virus: k<em>end-cyt</em>Vend in original paper describing release from endosome/uncoating</p>', 'Tag', '');
nameless.parameter.k_rep_cov_rna_vpc = addparameter(nameless_model, 'k_rep_cov_rna_vpc', 'ConstantValue', true, 'Value', 0.2, 'ValueUnits', '1/hour', 'Notes', '<p>fitted to describe in vivo viral load dynamics averaged across 9 patients</p>', 'Tag', '');
nameless.parameter.EC50_rep_cov_rna_vpc = addparameter(nameless_model, 'EC50_rep_cov_rna_vpc', 'ConstantValue', true, 'Value', 9992, 'ValueUnits', 'picomole/litre', 'Notes', '<p>it was proposed that a host cell can produce about 8000 (item/cell) virions of Influenza virus before it dies [15384040]. So we have calculated the EC50 basing on the value; taking into account that Vol<em>pc = 1.33e-12 L/cell we can obtain estimate in pM: EC50 = 8e3 /NA</em>pmole/Vol_pc = 8e3/6.02e11/1.33e-12 = 9992 pM</p>', 'Tag', '');
nameless.parameter.k_ass_cov_vpc = addparameter(nameless_model, 'k_ass_cov_vpc', 'ConstantValue', true, 'Value', 0.39, 'ValueUnits', '1/hour', 'Notes', '<p>fitted to describe in vivo viral load dynamics averaged across 9 patients</p>', 'Tag', '');
nameless.parameter.k_deg_cov = addparameter(nameless_model, 'k_deg_cov', 'ConstantValue', true, 'Value', 0.17, 'ValueUnits', '1/hour', 'Notes', '<p>COV half-life on different surfaces and aerosole is varied from 1 to 8 hours. We have chosen half-life equal to 4 hour. So, rate constant is equal to ln2/4 = 0.17 1/h</p>', 'Tag', '');
nameless.parameter.Nmax_cov_per_cell = addparameter(nameless_model, 'Nmax_cov_per_cell', 'ConstantValue', true, 'Value', 11900, 'ValueUnits', 'item/item', 'Notes', '<p>maximal number of virions Nmax = (surface area of PC faced to alveoli lumen)/(area of &quot;maximal&quot; section of SARS-CoV-2). Based on PC surface area = 183 um^2 [7103258] and (virion diameter=120-160 nm), one obtains Nmax =  183 um^2 / Pi*(140/2 nm) ^2 = 11900</p>', 'Tag', '');
nameless.parameter.k_deg_cov_rna = addparameter(nameless_model, 'k_deg_cov_rna', 'ConstantValue', true, 'Value', 17, 'ValueUnits', '1/hour', 'Notes', '<p>assumed to be equal to COV half-life equal to 4 hour. So, rate constant is equal to ln2/4 = 0.17 1/h</p>', 'Tag', '');
nameless.parameter.T_sw_ir = addparameter(nameless_model, 'T_sw_ir', 'ConstantValue', true, 'Value', 50, 'ValueUnits', 'hour', 'Notes', '<p>assumed</p>', 'Tag', '');
nameless.parameter.ET50_ir = addparameter(nameless_model, 'ET50_ir', 'ConstantValue', true, 'Value', 190, 'ValueUnits', 'hour', 'Notes', '<p>assumed</p>', 'Tag', '');
nameless.parameter.Emax_ir_apo = addparameter(nameless_model, 'Emax_ir_apo', 'ConstantValue', true, 'Value', 700, 'ValueUnits', 'dimensionless', 'Notes', '<p>assumed</p>', 'Tag', '');
nameless.parameter.n_ir = addparameter(nameless_model, 'n_ir', 'ConstantValue', true, 'Value', 5, 'ValueUnits', 'dimensionless', 'Notes', '<p>assumed</p>', 'Tag', '');
nameless.parameter.Kd_anti_Ab = addparameter(nameless_model, 'Kd_anti_Ab', 'ConstantValue', true, 'Value', 14300, 'ValueUnits', 'picomole/litre', 'Notes', '<p>assumed to be equal to tat presented in the paper for neutralizing mAb</p>', 'Tag', '');
nameless.parameter.anti_Ab_max = addparameter(nameless_model, 'anti_Ab_max', 'ConstantValue', true, 'Value', 941000, 'ValueUnits', 'picomole/litre', 'Notes', '<p>For Protective Antigen (PA) for Anthrax vaccine it was measured that concentration of Anti-PA specific IgG in serum is 141.2 ug/mL [15358653]. Taking into account Mr_IgG = 150 kDa, one obtains 141.2 ug/mL =</p>', 'Tag', '');
nameless.parameter.Vol_pc = addparameter(nameless_model, 'Vol_pc', 'ConstantValue', true, 'Value', 1.33e-12, 'ValueUnits', 'litre/item', 'Notes', '<p>averaged between type I and II pneumocytes (moved to Const)</p>', 'Tag', '');
nameless.parameter.L_to_mL = addparameter(nameless_model, 'L_to_mL', 'ConstantValue', true, 'Value', 1000, 'ValueUnits', 'millilitre/litre', 'Notes', '', 'Tag', '');

% Reactions
nameless.reaction.V_mat_pc = addreaction(nameless_model, 'null -> null', 'Name', 'V_mat_pc', 'Active', true, 'Reversible', true, 'ReactionRate', 'Vol_alv * k_apo_pc * PC_hs_ss', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_mat_pc, [nameless.species.PC_hs_ss, ], [1, ]);
  addproduct(nameless.reaction.V_mat_pc, [nameless.species.PC, nameless.species.PC_hs_ss, ], [1, 1, ]);
nameless.reaction.V_tran_pc_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_tran_pc_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_tran_pc_ipc * PC', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_tran_pc_ipc, [nameless.species.PC, ], [1, ]);
  addproduct(nameless.reaction.V_tran_pc_ipc, [nameless.species.iPC, ], [1, ]);
nameless.reaction.V_tran_ipc_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_tran_ipc_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_tran_ipc_vpc * iPC', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_tran_ipc_vpc, [nameless.species.iPC, ], [1, ]);
  addproduct(nameless.reaction.V_tran_ipc_vpc, [nameless.species.vPC, ], [1, ]);
nameless.reaction.V_apo_pc = addreaction(nameless_model, 'null -> null', 'Name', 'V_apo_pc', 'Active', true, 'Reversible', true, 'ReactionRate', 'Vol_alv * k_apo_pc * PC', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_apo_pc, [nameless.species.PC, ], [1, ]);
nameless.reaction.V_apo_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_apo_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'Vol_alv * k_apo_pc * iPC', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_apo_ipc, [nameless.species.iPC, ], [1, ]);
nameless.reaction.V_apo_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_apo_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'Vol_alv * k_apo_vpc * vPC', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_apo_vpc, [nameless.species.vPC, ], [1, ]);
nameless.reaction.V_syn_ace2_pc = addreaction(nameless_model, 'null -> null', 'Name', 'V_syn_ace2_pc', 'Active', true, 'Reversible', true, 'ReactionRate', 'Vol_pc * k_syn_ace2_pc * PC * Vol_alv * kcell_to_cell', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_syn_ace2_pc, [nameless.species.PC, ], [1, ]);
  addproduct(nameless.reaction.V_syn_ace2_pc, [nameless.species.ACE2_pc, nameless.species.PC, ], [1, 1, ]);
nameless.reaction.V_shed_ace2_pc = addreaction(nameless_model, 'null -> null', 'Name', 'V_shed_ace2_pc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_shed_ace2_pc * ACE2_pc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_shed_ace2_pc, [nameless.species.ACE2_pc, ], [1, ]);
nameless.reaction.V_bind_cov_ace2_pc = addreaction(nameless_model, 'null -> null', 'Name', 'V_bind_cov_ace2_pc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_off_cov_ace2 * (steric_factor_pc * COV * ACE2_pc / Kd_cov_ace2 - COV_ACE2_pc)', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_bind_cov_ace2_pc, [nameless.species.COV, nameless.species.ACE2_pc, ], [1, 1, ]);
  addproduct(nameless.reaction.V_bind_cov_ace2_pc, [nameless.species.COV_ACE2_pc, ], [1, ]);
nameless.reaction.V_deg_ace2_apo_pc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_ace2_apo_pc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_pc * ACE2_pc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_ace2_apo_pc, [nameless.species.ACE2_pc, ], [1, ]);
nameless.reaction.V_deg_cov_ace2_apo_pc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_cov_ace2_apo_pc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_pc * COV_ACE2_pc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_cov_ace2_apo_pc, [nameless.species.COV_ACE2_pc, ], [1, ]);
  addproduct(nameless.reaction.V_deg_cov_ace2_apo_pc, [nameless.species.COV, ], [1, ]);
nameless.reaction.V_tran_ace2_pc_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_tran_ace2_pc_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_tran_pc_ipc * ACE2_pc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_tran_ace2_pc_ipc, [nameless.species.ACE2_pc, ], [1, ]);
  addproduct(nameless.reaction.V_tran_ace2_pc_ipc, [nameless.species.ACE2_ipc, ], [1, ]);
nameless.reaction.V_tran_cov_ace2_pc_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_tran_cov_ace2_pc_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_tran_pc_ipc * COV_ACE2_pc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_tran_cov_ace2_pc_ipc, [nameless.species.COV_ACE2_pc, ], [1, ]);
  addproduct(nameless.reaction.V_tran_cov_ace2_pc_ipc, [nameless.species.COV_ACE2_ipc, ], [1, ]);
nameless.reaction.V_syn_ace2_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_syn_ace2_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'Vol_pc * k_syn_ace2_pc * iPC * Vol_alv * kcell_to_cell', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_syn_ace2_ipc, [nameless.species.iPC, ], [1, ]);
  addproduct(nameless.reaction.V_syn_ace2_ipc, [nameless.species.ACE2_ipc, nameless.species.iPC, ], [1, 1, ]);
nameless.reaction.V_shed_ace2_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_shed_ace2_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_shed_ace2_pc * ACE2_ipc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_shed_ace2_ipc, [nameless.species.ACE2_ipc, ], [1, ]);
nameless.reaction.V_bind_cov_ace2_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_bind_cov_ace2_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_off_cov_ace2 * (steric_factor_ipc * COV * ACE2_ipc / Kd_cov_ace2 - COV_ACE2_ipc)', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_bind_cov_ace2_ipc, [nameless.species.COV, nameless.species.ACE2_ipc, ], [1, 1, ]);
  addproduct(nameless.reaction.V_bind_cov_ace2_ipc, [nameless.species.COV_ACE2_ipc, ], [1, ]);
nameless.reaction.V_deg_ace2_apo_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_ace2_apo_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_pc * ACE2_ipc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_ace2_apo_ipc, [nameless.species.ACE2_ipc, ], [1, ]);
nameless.reaction.V_deg_cov_ace2_apo_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_cov_ace2_apo_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_pc * COV_ACE2_ipc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_cov_ace2_apo_ipc, [nameless.species.COV_ACE2_ipc, ], [1, ]);
  addproduct(nameless.reaction.V_deg_cov_ace2_apo_ipc, [nameless.species.COV, ], [1, ]);
nameless.reaction.V_deg_cov_apo_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_cov_apo_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_pc * COV_ipc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_cov_apo_ipc, [nameless.species.COV_ipc, ], [1, ]);
nameless.reaction.V_ent_cov_ipc = addreaction(nameless_model, 'null -> null', 'Name', 'V_ent_cov_ipc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_ent_cov_ipc * COV_ACE2_ipc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_ent_cov_ipc, [nameless.species.COV_ACE2_ipc, ], [1, ]);
  addproduct(nameless.reaction.V_ent_cov_ipc, [nameless.species.COV_ipc, ], [1, ]);
nameless.reaction.V_tran_ace2_ipc_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_tran_ace2_ipc_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_tran_ipc_vpc * ACE2_ipc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_tran_ace2_ipc_vpc, [nameless.species.ACE2_ipc, ], [1, ]);
  addproduct(nameless.reaction.V_tran_ace2_ipc_vpc, [nameless.species.ACE2_vpc, ], [1, ]);
nameless.reaction.V_tran_cov_ace2_ipc_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_tran_cov_ace2_ipc_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_tran_ipc_vpc * COV_ACE2_ipc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_tran_cov_ace2_ipc_vpc, [nameless.species.COV_ACE2_ipc, ], [1, ]);
  addproduct(nameless.reaction.V_tran_cov_ace2_ipc_vpc, [nameless.species.COV_ACE2_vpc, ], [1, ]);
nameless.reaction.V_tran_cov_ipc_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_tran_cov_ipc_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_tran_ipc_vpc * COV_ipc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_tran_cov_ipc_vpc, [nameless.species.COV_ipc, ], [1, ]);
  addproduct(nameless.reaction.V_tran_cov_ipc_vpc, [nameless.species.COV_vpc, ], [1, ]);
nameless.reaction.V_syn_ace2_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_syn_ace2_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'Vol_pc * k_syn_ace2_pc * vPC * Vol_alv * kcell_to_cell', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_syn_ace2_vpc, [nameless.species.vPC, ], [1, ]);
  addproduct(nameless.reaction.V_syn_ace2_vpc, [nameless.species.ACE2_vpc, nameless.species.vPC, ], [1, 1, ]);
nameless.reaction.V_shed_ace2_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_shed_ace2_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_shed_ace2_pc * ACE2_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_shed_ace2_vpc, [nameless.species.ACE2_vpc, ], [1, ]);
nameless.reaction.V_bind_cov_ace2_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_bind_cov_ace2_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_off_cov_ace2 * (steric_factor_vpc * COV * ACE2_vpc / Kd_cov_ace2 - COV_ACE2_vpc)', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_bind_cov_ace2_vpc, [nameless.species.COV, nameless.species.ACE2_vpc, ], [1, 1, ]);
  addproduct(nameless.reaction.V_bind_cov_ace2_vpc, [nameless.species.COV_ACE2_vpc, ], [1, ]);
nameless.reaction.V_deg_ace2_apo_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_ace2_apo_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_vpc * ACE2_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_ace2_apo_vpc, [nameless.species.ACE2_vpc, ], [1, ]);
nameless.reaction.V_deg_cov_ace2_apo_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_cov_ace2_apo_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_vpc * COV_ACE2_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_cov_ace2_apo_vpc, [nameless.species.COV_ACE2_vpc, ], [1, ]);
  addproduct(nameless.reaction.V_deg_cov_ace2_apo_vpc, [nameless.species.COV, ], [1, ]);
nameless.reaction.V_ent_cov_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_ent_cov_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_ent_cov_ipc * COV_ACE2_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_ent_cov_vpc, [nameless.species.COV_ACE2_vpc, ], [1, ]);
  addproduct(nameless.reaction.V_ent_cov_vpc, [nameless.species.COV_vpc, ], [1, ]);
nameless.reaction.V_unc_cov_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_unc_cov_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_unc_cov_vpc * COV_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_unc_cov_vpc, [nameless.species.COV_vpc, ], [1, ]);
  addproduct(nameless.reaction.V_unc_cov_vpc, [nameless.species.COV_RNA_vpc, ], [1, ]);
nameless.reaction.V_rep_cov_rna_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_rep_cov_rna_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_rep_cov_rna_vpc * COV_RNA_vpc / (1 + (COV_RNA_vpc / (vPC * Vol_alv * kcell_to_cell) / Vol_pc) / EC50_rep_cov_rna_vpc)', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_rep_cov_rna_vpc, [nameless.species.vPC, ], [1, ]);
  addproduct(nameless.reaction.V_rep_cov_rna_vpc, [nameless.species.COV_RNA_vpc, nameless.species.vPC, ], [1, 1, ]);
nameless.reaction.V_ass_cov_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_ass_cov_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_ass_cov_vpc * COV_RNA_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_ass_cov_vpc, [nameless.species.COV_RNA_vpc, ], [1, ]);
  addproduct(nameless.reaction.V_ass_cov_vpc, [nameless.species.COVass_vpc, ], [1, ]);
nameless.reaction.V_rel_cov_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_rel_cov_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_rel_cov_vpc * COVass_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_rel_cov_vpc, [nameless.species.COVass_vpc, ], [1, ]);
  addproduct(nameless.reaction.V_rel_cov_vpc, [nameless.species.COV, ], [1, ]);
nameless.reaction.V_deg_cov_apo_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_cov_apo_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_vpc * COV_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_cov_apo_vpc, [nameless.species.COV_vpc, ], [1, ]);
nameless.reaction.V_deg_cov_ass_apo_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_cov_ass_apo_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_vpc * COVass_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_cov_ass_apo_vpc, [nameless.species.COVass_vpc, ], [1, ]);
  addproduct(nameless.reaction.V_deg_cov_ass_apo_vpc, [nameless.species.COV, ], [1, ]);
nameless.reaction.V_deg_cov_rna_apo_vpc = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_cov_rna_apo_vpc', 'Active', true, 'Reversible', true, 'ReactionRate', 'k_apo_vpc * COV_RNA_vpc', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_cov_rna_apo_vpc, [nameless.species.COV_RNA_vpc, ], [1, ]);
  addproduct(nameless.reaction.V_deg_cov_rna_apo_vpc, [nameless.species.COV_RNA, ], [1, ]);
nameless.reaction.V_deg_cov = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_cov', 'Active', true, 'Reversible', true, 'ReactionRate', 'Vol_alv * k_deg_cov * COV', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_cov, [nameless.species.COV, ], [1, ]);
nameless.reaction.V_deg_cov_rna = addreaction(nameless_model, 'null -> null', 'Name', 'V_deg_cov_rna', 'Active', true, 'Reversible', true, 'ReactionRate', 'Vol_alv * k_deg_cov_rna * COV_RNA', 'Notes', '', 'Tag', '');
  addreactant(nameless.reaction.V_deg_cov_rna, [nameless.species.COV_RNA, ], [1, ]);

% Rules
addrule(nameless_model, 'time_day = time / 24', 'repeatedAssignment');
addrule(nameless_model, 'k_syn_ace2_pc = k_shed_ace2_pc * ACE2_pc_hs_ss / PC_hs_ss / Vol_pc / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'k_tran_pc_ipc = kbase_tran_pc_ipc * COV_ACE2_pc', 'repeatedAssignment');
addrule(nameless_model, 'k_tran_ipc_vpc = kbase_tran_ipc_vpc * COV_ipc', 'repeatedAssignment');
addrule(nameless_model, 'VO = anti_Ab / (Kd_anti_Ab + anti_Ab)', 'repeatedAssignment');
addrule(nameless_model, 'Kd_cov_ace2 = Kd_spike_ace2 / Num_sp_per_cov / (1 - VO)', 'repeatedAssignment');
addrule(nameless_model, 'ACE2_pc_per_cell = NA_pmole * ACE2_pc / PC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_ACE2_pc_per_cell = NA_pmole * COV_ACE2_pc / PC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'ACE2_ipc_per_cell = NA_pmole * ACE2_ipc / iPC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_ACE2_ipc_per_cell = NA_pmole * COV_ACE2_ipc / iPC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_ipc_per_cell = NA_pmole * COV_ipc / iPC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'ACE2_vpc_per_cell = NA_pmole * ACE2_vpc / vPC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_ACE2_vpc_per_cell = NA_pmole * COV_ACE2_vpc / vPC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_vpc_per_cell = NA_pmole * COV_vpc / vPC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'COVass_vpc_per_cell = NA_pmole * COVass_vpc / vPC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_RNA_vpc_per_cell = NA_pmole * COV_RNA_vpc / vPC / Vol_alv / kcell_to_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_num_sputum_ml = sputum_dilution_coef * (COV + COV_RNA) * NA_pmole / L_to_mL', 'repeatedAssignment');
addrule(nameless_model, 'PC_tot = PC + iPC + vPC', 'repeatedAssignment');
addrule(nameless_model, 'PC_percent = 100 * PC / PC_tot', 'repeatedAssignment');
addrule(nameless_model, 'iPC_percent = 100 * iPC / PC_tot', 'repeatedAssignment');
addrule(nameless_model, 'vPC_percent = 100 * vPC / PC_tot', 'repeatedAssignment');
addrule(nameless_model, 'ACE2_pc_per_cell_tot = ACE2_pc_per_cell + COV_ACE2_pc_per_cell', 'repeatedAssignment');
addrule(nameless_model, 'ACE2_ipc_per_cell_tot = ACE2_ipc_per_cell + COV_ACE2_ipc_per_cell', 'repeatedAssignment');
addrule(nameless_model, 'ACE2_vpc_per_cell_tot = ACE2_vpc_per_cell + COV_ACE2_vpc_per_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_pc_per_cell_tot = COV_ACE2_pc_per_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_ipc_per_cell_tot = COV_ACE2_ipc_per_cell + COV_ipc_per_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_vpc_per_cell_tot = COV_ACE2_vpc_per_cell + COV_vpc_per_cell + COV_RNA_vpc_per_cell', 'repeatedAssignment');
addrule(nameless_model, 'steric_factor_pc = 1 - COV_ACE2_pc_per_cell / Nmax_cov_per_cell', 'repeatedAssignment');
addrule(nameless_model, 'steric_factor_ipc = 1 - COV_ACE2_ipc_per_cell / Nmax_cov_per_cell', 'repeatedAssignment');
addrule(nameless_model, 'steric_factor_vpc = 1 - COV_ACE2_vpc_per_cell / Nmax_cov_per_cell', 'repeatedAssignment');
addrule(nameless_model, 'COV_sgRNA_perc = 100 * COV_RNA / (COV + COV_RNA)', 'repeatedAssignment');
addrule(nameless_model, 'IR_apo = 1 + switch_ir * Emax_ir_apo * (time / T_sw_ir - 1) ^ n_ir / ((1 + ET50_ir / T_sw_ir) ^ n_ir + (time / T_sw_ir - 1) ^ n_ir)', 'repeatedAssignment');
addrule(nameless_model, 'k_apo_vpc = kbase_apo_vpc * IR_apo', 'repeatedAssignment');
addrule(nameless_model, 'anti_Ab = switch_ir * anti_Ab_max * (time / T_sw_ir - 1) ^ n_ir / ((1 + ET50_ir / T_sw_ir) ^ n_ir + (time / T_sw_ir - 1) ^ n_ir)', 'repeatedAssignment');



% Time Switchers
nameless.event.viral_load = addevent(nameless_model, 'time >= T_sw_ir', {'switch_ir = 1', }, 'Notes', '', 'Tag', '');





