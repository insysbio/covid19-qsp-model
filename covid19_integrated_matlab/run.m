clear; clc; close all;

p_names = ["kcell_to_cell", "NA_pmole", "sputum_dilution_coef", "k_apo_pc", "kbase_apo_vpc", "kbase_tran_pc_ipc", "kbase_tran_ipc_vpc", "k_shed_ace2_pc", "k_off_cov_ace2", "Num_sp_per_cov", "Kd_spike_ace2", "k_ent_cov_ipc", "k_rel_cov_vpc", "k_unc_cov_vpc", "k_rep_cov_rna_vpc", "EC50_rep_cov_rna_vpc", "k_ass_cov_vpc", "k_deg_cov", "Nmax_cov_per_cell", "k_deg_cov_rna", "switch_ir", "T_sw_ir", "ET50_ir", "Emax_ir_apo", "n_ir", "Kd_anti_Ab", "anti_Ab_max", "Vol_pc", "L_to_mL"];
output_names = ["time_day", "COVass_vpc", "Vol_alv", "vPC", "COVass_vpc_per_cell", "COV", "COV_RNA", "COV_num_sputum_ml", "PC", "iPC", "PC_tot", "PC_percent", "iPC_percent", "vPC_percent", "ACE2_pc", "ACE2_pc_per_cell", "COV_ACE2_pc", "COV_ACE2_pc_per_cell", "ACE2_pc_per_cell_tot", "ACE2_ipc", "ACE2_ipc_per_cell", "COV_ACE2_ipc", "COV_ACE2_ipc_per_cell", "ACE2_ipc_per_cell_tot", "ACE2_vpc", "ACE2_vpc_per_cell", "COV_ACE2_vpc", "COV_ACE2_vpc_per_cell", "ACE2_vpc_per_cell_tot", "COV_pc_per_cell_tot", "COV_ipc", "COV_ipc_per_cell", "COV_ipc_per_cell_tot", "COV_vpc", "COV_vpc_per_cell", "COV_RNA_vpc", "COV_RNA_vpc_per_cell", "COV_vpc_per_cell_tot", "COV_sgRNA_perc", "PC_hs_ss", "V_mat_pc", "k_tran_pc_ipc", "V_tran_pc_ipc", "k_tran_ipc_vpc", "V_tran_ipc_vpc", "V_apo_pc", "V_apo_ipc", "IR_apo", "k_apo_vpc", "V_apo_vpc", "ACE2_pc_hs_ss", "k_syn_ace2_pc", "V_syn_ace2_pc", "V_shed_ace2_pc", "steric_factor_pc", "anti_Ab", "VO", "Kd_cov_ace2", "V_bind_cov_ace2_pc", "V_deg_ace2_apo_pc", "V_deg_cov_ace2_apo_pc", "V_tran_ace2_pc_ipc", "V_tran_cov_ace2_pc_ipc", "V_syn_ace2_ipc", "V_shed_ace2_ipc", "steric_factor_ipc", "V_bind_cov_ace2_ipc", "V_deg_ace2_apo_ipc", "V_deg_cov_ace2_apo_ipc", "V_deg_cov_apo_ipc", "V_ent_cov_ipc", "V_tran_ace2_ipc_vpc", "V_tran_cov_ace2_ipc_vpc", "V_tran_cov_ipc_vpc", "V_syn_ace2_vpc", "V_shed_ace2_vpc", "steric_factor_vpc", "V_bind_cov_ace2_vpc", "V_deg_ace2_apo_vpc", "V_deg_cov_ace2_apo_vpc", "V_ent_cov_vpc", "V_unc_cov_vpc", "V_rep_cov_rna_vpc", "V_ass_cov_vpc", "V_rel_cov_vpc", "V_deg_cov_apo_vpc", "V_deg_cov_ass_apo_vpc", "V_deg_cov_rna_apo_vpc", "V_deg_cov", "V_deg_cov_rna"];

p = param();
[ode_func, out_func, y0, events] = model(p);

%%% default task
t_span = [0 100]; % [0:1:100]
opt = odeset('OutputFcn', out_func, 'Events', events{1}, 'MaxStep', 3); % odeset('Mass',M,'RelTol',1e-4,'AbsTol',[1e-6 1e-10 1e-6], 'Stats','on');

% the next string generates "output" variable
%[tout, y, te, ye, ie] = ode15s(ode_func, t_span, y0, opt);

% solution with events
ti = t_span(1);
yi = y0;
tout = [];
output = [];
while ti < t_span(2)
    [t, y, te, ye, ie] = ode15s(ode_func, [ti t_span(2)], yi, opt);

    tout = vertcat(tout, t);
    if length(te) == 0
        break
    end
    ti = t(end);
    yi = events{2}(ti, ye(end,:));
end

figure
hold on
for i = 1:length(output_names)
    plot(tout, output(:, i), '-', 'Linewidth', 1)
end
title('Default plot','Fontsize', 14)
xlabel('t', 'Fontsize', 14)
ylabel('records', 'Fontsize', 14)
legend(output_names)
hold off
