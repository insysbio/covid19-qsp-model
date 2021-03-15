$PROB
# Model: `nameless`
  - Title: nameless
  - Notes: Generated automatically from platform with Heta compiler
  - Source: Heta compiler

# Demo
```{r,echo=TRUE}
  ev(amt=10) %>% mrgsim %>% plot
```

$SET end=120, delta=0.1, hmax=0.01, hmin=0, rtol=1e-3, atol=1e-6

$PARAM @annotated
// @Const 'kcell to cell conversion coefficient'
kcell_to_cell : 1000 : (cell/kcell)
// @Const 'Avogadro constant for 1 pmole'
NA_pmole : 602000000000 : (item/pmole)
// @Const 'dilution of sputum in comparison with lung epithelium lining fluid'
sputum_dilution_coef : 0.1 : (UL)
// @Const 'rate constant of PC and iPC apoptosis'
k_apo_pc : 0.00082 : (1/h)
// @Const 'rate constant of vPC apoptosis'
kbase_apo_vpc : 0.00082 : (1/h)
// @Const 'rate constant of PC to iPC transition'
kbase_tran_pc_ipc : 4 : (1/pM/h)
// @Const 'rate constant of iPC to vPC transition'
kbase_tran_ipc_vpc : 4 : (1/pM/h)
// @Const 'rate constant of ACE2 shedding'
k_shed_ace2_pc : 1.8 : (1/h)
// @Const 'rate constant of COV_ACE2 complex dissociation'
k_off_cov_ace2 : 23.56 : (1/h)
// @Const 'number of Spike proteins per virion'
Num_sp_per_cov : 150 : (UL)
// @Const 'equilibrium dissociation constant of spike (RBD) to ACE2 binding'
Kd_spike_ace2 : 4670 : (pM)
// @Const 'rate constant of COV entry in iPC cell'
k_ent_cov_ipc : 0.936 : (1/h)
// @Const 'rate constant of COV release to bulk phase from iPC and vPC cell'
k_rel_cov_vpc : 2 : (1/h)
// @Const 'rate constant of COV uncouting in vPC cell'
k_unc_cov_vpc : 14 : (1/h)
// @Const 'rate constant of COV_RNA replication in vPC cell'
k_rep_cov_rna_vpc : 0.2 : (1/h)
// @Const 'EC50 of COV_RNA replication referring to concentration inindividual vPC cell'
EC50_rep_cov_rna_vpc : 9992 : (pM)
// @Const 'rate constant of COV assembling in vPC'
k_ass_cov_vpc : 0.39 : (1/h)
// @Const 'rate constant of COV degradation in bulk phase'
k_deg_cov : 0.17 : (1/h)
// @Const 'maximal number of viral particles able to be simultaneously attached to pneumocyte'
Nmax_cov_per_cell : 11900 : (item/cell)
// @Const 'rate constant of COV_RNA degradation in bulk phase'
k_deg_cov_rna : 17 : (1/h)
// @Const 'switch on time of IR effect on vPC apoptosis'
T_sw_ir : 50 : (h)
// @Const 'Effective Time when IR effect reach 50% of maximal value'
ET50_ir : 190 : (h)
// @Const 'maximal effect of IR on vPC apoptosis'
Emax_ir_apo : 700 : (UL)
// @Const 'Hill coefficient of IR effect on vPC apoptosis'
n_ir : 5 : (UL)
// @Const 'Kd for binding of Spike protein and neutralizing antibodies'
Kd_anti_Ab : 14300 : (pM)
// @Const 'maximal concentration of anti Spike Ab in serum'
anti_Ab_max : 941000 : (pM)
// @Const 'Volume of Pneumocyte'
Vol_pc : 1.33e-12 : (L/cell)
// @Const ''
L_to_mL : 1000 : (mL/L)

$CMT @annotated
// @Species 'concentration of PC type II (Pneumocytes free of virus) in alveoli'
PC_amt_ : as amount
// @Species 'concentration of iPC (Pneumocytes with virus entered but w/o virus replication) in alveoli'
iPC_amt_ : as amount
// @Species 'concentration of vPC (Pneumocytes with virus actively replicated) in alveoli'
vPC_amt_ : as amount
// @Species 'amount of ACE2 located at PC'
ACE2_pc : amount
// @Species 'amount of COV_ACE2 complexes located at PC'
COV_ACE2_pc : amount
// @Species 'amount of ACE2 located at iPC'
ACE2_ipc : amount
// @Species 'amount of COV_ACE2 complexes located at iPC'
COV_ACE2_ipc : amount
// @Species 'amount of partially disrupted COV particles ready to release RNA in cytoplasm located in iPC'
COV_ipc : amount
// @Species 'amount of ACE2 located at vPC'
ACE2_vpc : amount
// @Species 'amount of COV_ACE2 complexes located at vPC'
COV_ACE2_vpc : amount
// @Species 'amount of partially disrupted COV particles ready to release RNA in cytoplasm located in vPC'
COV_vpc : amount
// @Species 'amount of COV_RNA located in vPC'
COV_RNA_vpc : amount
// @Species 'concentration of  COV (SARS-CoV-2 virus)'
COV_amt_ : as amount
// @Species 'concentration of COV_RNA released from vPC due to their apoptosis'
COV_RNA_amt_ : as amount
// @Species 'amount of assembled virus ready to be released from from vPC'
COVass_vpc : amount

$GLOBAL
#define PC (PC_amt_ / Vol_alv)
#define iPC (iPC_amt_ / Vol_alv)
#define vPC (vPC_amt_ / Vol_alv)
#define COV (COV_amt_ / Vol_alv)
#define COV_RNA (COV_RNA_amt_ / Vol_alv)

$PREAMBLE
//double COVass_vpc = 0.0;
//double vPC = 1.0;
double Vol_alv = 0.014;
//double COV = 0.0018;
//double COV_RNA = 0.0;
//double PC = 2643000000.0;
//double iPC = 1.0;
//double ACE2_pc = 615.0;
//double COV_ACE2_pc = 0.0;
//double ACE2_ipc = 0.0;
//double COV_ACE2_ipc = 0.0;
//double ACE2_vpc = 0.0;
//double COV_ACE2_vpc = 0.0;
//double COV_ipc = 0.0;
//double COV_vpc = 0.0;
//double COV_RNA_vpc = 0.0;
double PC_hs_ss = 2643000000.0;
double switch_ir = 0.0;
double ACE2_pc_hs_ss = 615.0;

$MAIN
COVass_vpc_0 = (0.0);
vPC_amt__0 = (1.0) * Vol_alv;
COV_amt__0 = (0.0018) * Vol_alv;
COV_RNA_amt__0 = (0.0) * Vol_alv;
PC_amt__0 = (2643000000.0) * Vol_alv;
iPC_amt__0 = (1.0) * Vol_alv;
ACE2_pc_0 = (615.0);
COV_ACE2_pc_0 = (0.0);
ACE2_ipc_0 = (0.0);
COV_ACE2_ipc_0 = (0.0);
ACE2_vpc_0 = (0.0);
COV_ACE2_vpc_0 = (0.0);
COV_ipc_0 = (0.0);
COV_vpc_0 = (0.0);
COV_RNA_vpc_0 = (0.0);

$ODE
// @Record 'hours to days conversion'
double time_day = SOLVERTIME / 24.0;
// @Record 'number of COVass per vPC cell'
double COVass_vpc_per_cell = NA_pmole * COVass_vpc / vPC / Vol_alv / kcell_to_cell;
// @Record 'number of virus copies in 1 mL of sputum'
double COV_num_sputum_ml = sputum_dilution_coef * (COV + COV_RNA) * NA_pmole / L_to_mL;
// @Record 'total pneumocytes cell count'
double PC_tot = PC + iPC + vPC;
// @Record 'percent of PC of total pneumocytes cell count'
double PC_percent = 100.0 * PC / PC_tot;
// @Record 'percent of iPC of total pneumocytes cell count'
double iPC_percent = 100.0 * iPC / PC_tot;
// @Record 'percent of vPC of total pneumocytes cell count'
double vPC_percent = 100.0 * vPC / PC_tot;
// @Record 'number of ACE2 per PC cell'
double ACE2_pc_per_cell = NA_pmole * ACE2_pc / PC / Vol_alv / kcell_to_cell;
// @Record 'number of COV_ACE2 per PC cell'
double COV_ACE2_pc_per_cell = NA_pmole * COV_ACE2_pc / PC / Vol_alv / kcell_to_cell;
// @Record 'total number of ACE2 molecules per PC cell'
double ACE2_pc_per_cell_tot = ACE2_pc_per_cell + COV_ACE2_pc_per_cell;
// @Record 'number of ACE2 per iPC cell'
double ACE2_ipc_per_cell = NA_pmole * ACE2_ipc / iPC / Vol_alv / kcell_to_cell;
// @Record 'number of COV_ACE2 per iPC cell'
double COV_ACE2_ipc_per_cell = NA_pmole * COV_ACE2_ipc / iPC / Vol_alv / kcell_to_cell;
// @Record 'total number of ACE2 molecules per iPC cell'
double ACE2_ipc_per_cell_tot = ACE2_ipc_per_cell + COV_ACE2_ipc_per_cell;
// @Record 'number of ACE2 per vPC cell'
double ACE2_vpc_per_cell = NA_pmole * ACE2_vpc / vPC / Vol_alv / kcell_to_cell;
// @Record 'number of COV_ACE2 per vPC cell'
double COV_ACE2_vpc_per_cell = NA_pmole * COV_ACE2_vpc / vPC / Vol_alv / kcell_to_cell;
// @Record 'total number of ACE2 molecules per vPC cell'
double ACE2_vpc_per_cell_tot = ACE2_vpc_per_cell + COV_ACE2_vpc_per_cell;
// @Record 'total number of COV genomes per PC cell'
double COV_pc_per_cell_tot = COV_ACE2_pc_per_cell;
// @Record 'number of COV per iPC cell'
double COV_ipc_per_cell = NA_pmole * COV_ipc / iPC / Vol_alv / kcell_to_cell;
// @Record 'total number of COV genomes per iPC cell'
double COV_ipc_per_cell_tot = COV_ACE2_ipc_per_cell + COV_ipc_per_cell;
// @Record 'number of COV per vPC cell'
double COV_vpc_per_cell = NA_pmole * COV_vpc / vPC / Vol_alv / kcell_to_cell;
// @Record 'number of COV_RNA per vPC cell'
double COV_RNA_vpc_per_cell = NA_pmole * COV_RNA_vpc / vPC / Vol_alv / kcell_to_cell;
// @Record 'total number of COV genomes per vPC cell'
double COV_vpc_per_cell_tot = COV_ACE2_vpc_per_cell + COV_vpc_per_cell + COV_RNA_vpc_per_cell;
// @Record 'percent of actively transcribed subgenomic RNA of total (packed + unpacked) RNA in sputum samples taken from the patients'
double COV_sgRNA_perc = 100.0 * COV_RNA / (COV + COV_RNA);
// @Reaction 'influx of Pneumocytes via maturation'
double V_mat_pc = Vol_alv * k_apo_pc * PC_hs_ss;
// @Record 'apparent rate constant of PC to iPC transition'
double k_tran_pc_ipc = kbase_tran_pc_ipc * COV_ACE2_pc / Vol_alv;
// @Reaction 'transition of Pneumocyte from normal state to state with entered COV'
double V_tran_pc_ipc = Vol_alv * k_tran_pc_ipc * PC;
// @Record 'apparent rate constant of iPC to vPC transition'
double k_tran_ipc_vpc = kbase_tran_ipc_vpc * COV_ipc / Vol_alv;
// @Reaction 'transition of Pneumocyte from state with entered COV to state able to produce viral particles'
double V_tran_ipc_vpc = Vol_alv * k_tran_ipc_vpc * iPC;
// @Reaction 'apoptosis of Pneumocyte'
double V_apo_pc = Vol_alv * k_apo_pc * PC;
// @Reaction 'apoptosis of iPneumocyte'
double V_apo_ipc = Vol_alv * k_apo_pc * iPC;
// @Record 'empiric function imitating effect of Immune Response on vPC apoptosis'
double IR_apo = 1.0 + switch_ir * Emax_ir_apo * pow((SOLVERTIME / T_sw_ir - 1.0), n_ir) / (pow((1.0 + ET50_ir / T_sw_ir), n_ir) + pow((SOLVERTIME / T_sw_ir - 1.0), n_ir));
// @Record 'dependence of rate constant of vPC apoptosis on IR effect'
double k_apo_vpc = kbase_apo_vpc * IR_apo;
// @Reaction 'apoptosis of vPneumocyte'
double V_apo_vpc = Vol_alv * k_apo_vpc * vPC;
// @Record 'rate of ACE2 synthesis calculated per volume of PC'
double k_syn_ace2_pc = k_shed_ace2_pc * ACE2_pc_hs_ss / PC_hs_ss / Vol_pc / Vol_alv / kcell_to_cell;
// @Reaction 'synthesis of ACE2 by PC'
double V_syn_ace2_pc = Vol_pc * k_syn_ace2_pc * PC * Vol_alv * kcell_to_cell;
// @Reaction 'degradation of ACE2 located at PC via shedding'
double V_shed_ace2_pc = k_shed_ace2_pc * ACE2_pc;
// @Record 'a term responsible for limitation of COV to cell binding; number COV molecules per cell cannot be higher than Nmax_cov_per_cell due to physical size of a cell and virus which attaches to the cell'
double steric_factor_pc = 1.0 - COV_ACE2_pc_per_cell / Nmax_cov_per_cell;
// @Species 'concentration of anti-Spike attibodies'
double anti_Ab = switch_ir * anti_Ab_max * pow((SOLVERTIME / T_sw_ir - 1.0), n_ir) / (pow((1.0 + ET50_ir / T_sw_ir), n_ir) + pow((SOLVERTIME / T_sw_ir - 1.0), n_ir));
// @Record 'Virus Occupancy (VO) level with anti_Ab antibodies'
double VO = anti_Ab / (Kd_anti_Ab + anti_Ab);
// @Record 'apparent dissociation equilibrium constant of COV and ACE2'
double Kd_cov_ace2 = Kd_spike_ace2 / Num_sp_per_cov / (1.0 - VO);
// @Reaction 'binding of COV to ACE2 located at PC surface'
double V_bind_cov_ace2_pc = k_off_cov_ace2 * (steric_factor_pc * COV * ACE2_pc / Kd_cov_ace2 - COV_ACE2_pc);
// @Reaction 'degradation of ACE2 located at PC via PC apoptosis'
double V_deg_ace2_apo_pc = k_apo_pc * ACE2_pc;
// @Reaction 'degradation of COV_ACE2 located at PC via PC apoptosis with concomitant COV release'
double V_deg_cov_ace2_apo_pc = k_apo_pc * COV_ACE2_pc;
// @Reaction 'transition of ACE2 from PC to iPC with transition of pneumocytes between the states'
double V_tran_ace2_pc_ipc = k_tran_pc_ipc * ACE2_pc;
// @Reaction 'transition of COV_ACE2 from PC to iPC with transition of pneumocytes between the states'
double V_tran_cov_ace2_pc_ipc = k_tran_pc_ipc * COV_ACE2_pc;
// @Reaction 'synthesis of ACE2 by iPC'
double V_syn_ace2_ipc = Vol_pc * k_syn_ace2_pc * iPC * Vol_alv * kcell_to_cell;
// @Reaction 'degradation of ACE2 located at iPC via shedding'
double V_shed_ace2_ipc = k_shed_ace2_pc * ACE2_ipc;
// @Record 'a term responsible for limitation of COV to cell binding; number COV molecules per cell cannot be higher than Nmax_cov_per_cell due to physical size of a cell and virus which attaches to the cell'
double steric_factor_ipc = 1.0 - COV_ACE2_ipc_per_cell / Nmax_cov_per_cell;
// @Reaction 'binding of COV to ACE2 located at iPC surface'
double V_bind_cov_ace2_ipc = k_off_cov_ace2 * (steric_factor_ipc * COV * ACE2_ipc / Kd_cov_ace2 - COV_ACE2_ipc);
// @Reaction 'degradation of ACE2 located at iPC via iPC apoptosis'
double V_deg_ace2_apo_ipc = k_apo_pc * ACE2_ipc;
// @Reaction 'degradation of COV_ACE2 located at iPC via iPC apoptosis with concomitant COV release'
double V_deg_cov_ace2_apo_ipc = k_apo_pc * COV_ACE2_ipc;
// @Reaction 'degradation of COV located in iPC via iPC apoptosis'
double V_deg_cov_apo_ipc = k_apo_pc * COV_ipc;
// @Reaction 'entry of COV into iPC with concomitant ACE2 degradation'
double V_ent_cov_ipc = k_ent_cov_ipc * COV_ACE2_ipc;
// @Reaction 'transition of ACE2 from iPC to vPC with transition of pneumocytes between the states'
double V_tran_ace2_ipc_vpc = k_tran_ipc_vpc * ACE2_ipc;
// @Reaction 'transition of COV_ACE2 from iPC to vPC with transition of pneumocytes between the states'
double V_tran_cov_ace2_ipc_vpc = k_tran_ipc_vpc * COV_ACE2_ipc;
// @Reaction 'transition of COV from iPC to vPC with transition of pneumocytes between the states'
double V_tran_cov_ipc_vpc = k_tran_ipc_vpc * COV_ipc;
// @Reaction 'synthesis of ACE2 by vPC'
double V_syn_ace2_vpc = Vol_pc * k_syn_ace2_pc * vPC * Vol_alv * kcell_to_cell;
// @Reaction 'degradation of ACE2 located at vPC via shedding'
double V_shed_ace2_vpc = k_shed_ace2_pc * ACE2_vpc;
// @Record 'a term responsible for limitation of COV to cell binding; number COV molecules per cell cannot be higher than Nmax_cov_per_cell due to physical size of a cell and virus which attaches to the cell'
double steric_factor_vpc = 1.0 - COV_ACE2_vpc_per_cell / Nmax_cov_per_cell;
// @Reaction 'binding of COV to ACE2 located at vPC surface'
double V_bind_cov_ace2_vpc = k_off_cov_ace2 * (steric_factor_vpc * COV * ACE2_vpc / Kd_cov_ace2 - COV_ACE2_vpc);
// @Reaction 'degradation of ACE2 located at iPC via vPC apoptosis'
double V_deg_ace2_apo_vpc = k_apo_vpc * ACE2_vpc;
// @Reaction 'degradation of COV_ACE2 located at vPC via vPC apoptosis with concomitant COV release'
double V_deg_cov_ace2_apo_vpc = k_apo_vpc * COV_ACE2_vpc;
// @Reaction 'entry of COV into vPC with concomitant ACE2 degradation'
double V_ent_cov_vpc = k_ent_cov_ipc * COV_ACE2_vpc;
// @Reaction 'uncoating of COV in vPC'
double V_unc_cov_vpc = k_unc_cov_vpc * COV_vpc;
// @Reaction 'replication of COV_RNA in vPC'
double V_rep_cov_rna_vpc = k_rep_cov_rna_vpc * COV_RNA_vpc / (1.0 + (COV_RNA_vpc / (vPC * Vol_alv * kcell_to_cell) / Vol_pc) / EC50_rep_cov_rna_vpc);
// @Reaction 'assembling of COV in vPC'
double V_ass_cov_vpc = k_ass_cov_vpc * COV_RNA_vpc;
// @Reaction 'release of COV in vPC'
double V_rel_cov_vpc = k_rel_cov_vpc * COVass_vpc;
// @Reaction 'degradation of COV located in vPC via vPC apoptosis'
double V_deg_cov_apo_vpc = k_apo_vpc * COV_vpc;
// @Reaction 'degradation of COVass located in vPC via vPC apoptosis with concomitant COV release'
double V_deg_cov_ass_apo_vpc = k_apo_vpc * COVass_vpc;
// @Reaction 'degradation of COV_RNA located at vPC with concomitant COV_RNA release to bulk phase via vPC apoptosis'
double V_deg_cov_rna_apo_vpc = k_apo_vpc * COV_RNA_vpc;
// @Reaction 'degradation of COV in bulk phase'
double V_deg_cov = Vol_alv * k_deg_cov * COV;
// @Reaction 'degradation of COV_RNA in bulk phase'
double V_deg_cov_rna = Vol_alv * k_deg_cov_rna * COV_RNA;

dxdt_PC_amt_ = (1)*V_mat_pc + (-1)*V_tran_pc_ipc + (-1)*V_apo_pc;
dxdt_iPC_amt_ = (1)*V_tran_pc_ipc + (-1)*V_tran_ipc_vpc + (-1)*V_apo_ipc;
dxdt_vPC_amt_ = (1)*V_tran_ipc_vpc + (-1)*V_apo_vpc;
dxdt_ACE2_pc = (1)*V_syn_ace2_pc + (-1)*V_shed_ace2_pc + (-1)*V_bind_cov_ace2_pc + (-1)*V_deg_ace2_apo_pc + (-1)*V_tran_ace2_pc_ipc;
dxdt_COV_ACE2_pc = (1)*V_bind_cov_ace2_pc + (-1)*V_deg_cov_ace2_apo_pc + (-1)*V_tran_cov_ace2_pc_ipc;
dxdt_ACE2_ipc = (1)*V_tran_ace2_pc_ipc + (1)*V_syn_ace2_ipc + (-1)*V_shed_ace2_ipc + (-1)*V_bind_cov_ace2_ipc + (-1)*V_deg_ace2_apo_ipc + (-1)*V_tran_ace2_ipc_vpc;
dxdt_COV_ACE2_ipc = (1)*V_tran_cov_ace2_pc_ipc + (1)*V_bind_cov_ace2_ipc + (-1)*V_deg_cov_ace2_apo_ipc + (-1)*V_ent_cov_ipc + (-1)*V_tran_cov_ace2_ipc_vpc;
dxdt_COV_ipc = (-1)*V_deg_cov_apo_ipc + (1)*V_ent_cov_ipc + (-1)*V_tran_cov_ipc_vpc;
dxdt_ACE2_vpc = (1)*V_tran_ace2_ipc_vpc + (1)*V_syn_ace2_vpc + (-1)*V_shed_ace2_vpc + (-1)*V_bind_cov_ace2_vpc + (-1)*V_deg_ace2_apo_vpc;
dxdt_COV_ACE2_vpc = (1)*V_tran_cov_ace2_ipc_vpc + (1)*V_bind_cov_ace2_vpc + (-1)*V_deg_cov_ace2_apo_vpc + (-1)*V_ent_cov_vpc;
dxdt_COV_vpc = (1)*V_tran_cov_ipc_vpc + (1)*V_ent_cov_vpc + (-1)*V_unc_cov_vpc + (-1)*V_deg_cov_apo_vpc;
dxdt_COV_RNA_vpc = (1)*V_unc_cov_vpc + (1)*V_rep_cov_rna_vpc + (-1)*V_ass_cov_vpc + (-1)*V_deg_cov_rna_apo_vpc;
dxdt_COV_amt_ = (-1)*V_bind_cov_ace2_pc + (1)*V_deg_cov_ace2_apo_pc + (-1)*V_bind_cov_ace2_ipc + (1)*V_deg_cov_ace2_apo_ipc + (-1)*V_bind_cov_ace2_vpc + (1)*V_deg_cov_ace2_apo_vpc + (1)*V_rel_cov_vpc + (1)*V_deg_cov_ass_apo_vpc + (-1)*V_deg_cov;
dxdt_COV_RNA_amt_ = (1)*V_deg_cov_rna_apo_vpc + (-1)*V_deg_cov_rna;
dxdt_COVass_vpc = (1)*V_ass_cov_vpc + (-1)*V_rel_cov_vpc + (-1)*V_deg_cov_ass_apo_vpc;

$CAPTURE @annotated
COV_num_sputum_ml : number of virus copies in 1 mL of sputum (item/mL)
IR_apo : empiric function imitating effect of Immune Response on vPC apoptosis (UL)
