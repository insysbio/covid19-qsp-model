% load the model and start base simulations
% this is for diagnostic purposes

%start this using ci script
% run('dist/covid19_integrated_simbio/model.m');

%%% prepare

% use when start matlab console
%cd '../simulations'
%copyfile('../../dist/simbio/fun.m', './fun.m');
%run('../dist/simbio/main.m');
%sbiosaveproject '../../dist/simbio/proj' default_model;

% get configset
output_ids = {
  'IR_apo',
  'COV_num_sputum_ml',
  'time_day'
};
default_cfgs = getconfigset(nameless_model, 'default');
    set(default_cfgs, 'StopTime', 1700);
    set(default_cfgs.RuntimeOptions, 'StatesToLog', output_ids);

%%% run

% simulate human
sim = sbiosimulate(nameless_model, default_cfgs);
fig = figure(1);
% plot IR_apo
subplot(2, 1, 1); % [rows, colomns]
semilogy(sim.Data(:, 3), sim.Data(:, 1));
xlabel('Time, day');
ylabel('IR_apo', 'Interpreter', 'none');
title('Default simulation', 'Interpreter', 'none');
% plot COV_num_sputum_ml
subplot(2, 1, 2);
semilogy(sim.Data(:, 3), sim.Data(:, 2));
xlabel('Time, day');
ylabel('COV_num_sputum_ml', 'Interpreter', 'none');
title('Default simulation', 'Interpreter', 'none');
% print(fig, 'simbio_plot', '-dpdf', '-fillpage');
print(fig, 'default-simbio-plot', '-dpng');

exit(0);
