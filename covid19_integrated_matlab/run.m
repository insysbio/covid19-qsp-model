clear; clc; close all;

p_names = [];
output_names = [];

p = param();
[ode_func, out_func, y0, events] = model(p);

%%% default task
t_span = [0 100]; % [0:1:100]
opt = odeset('OutputFcn', out_func, 'Events', events{1}, 'MaxStep', 3); % odeset('Mass',M,'RelTol',1e-4,'AbsTol',[1e-6 1e-10 1e-6], 'Stats','on');

% the next string generates "output" variable
%[t, y, te, ye, ie] = ode15s(ode_func, t_span, y0, opt);

% solution with events
ti = t_span(1);
yi = y0;
tout = [];
yout = [];
while ti < t_span(2)
    [t, y, te, ye, ie] = ode15s(ode_func, [ti t_span(2)], yi, opt);
    
    ti = t(end);
    yi = events{2}(ti, ye(end,:));
    tout = vertcat(tout, t);
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