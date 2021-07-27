using HetaSimulator, Plots

model = load_jlmodel("../dist/julia/model.jl")

res = sim(model; tspan = (0,1700))

plotd = plot(res; vars = [:IR_apo], yscale=:log10)
savefig(plotd, "plots/default-hetasimulator-IR_apo.png")

plotd = plot(res; vars = [:COV_num_sputum_ml], yscale=:log10, ylims=(1e1,1e8))
savefig(plotd, "plots/default-hetasimulator-COV_num_sputum_ml.png")
