# COVID-19 QSP model / dist branch

[Back to source repository](https://github.com/insysbio/covid19-qsp-model)

*This branch stores auto-generated files using [Heta-compiler](https://hetalang.github.io). They are  generated by GitHub Actions each time when sources are updated in "master" branch.*

## Usage

To download the whole dist branch using [Git](https://git-scm.com/)

```sh
git clone -b dist --single-branch https://github.com/insysbio/covid19-qsp-model.git covid19-qsp-model-dist
```

To refresh "dist" repository

```sh
cd covid19-qsp-model-dist
git fetch
git pull
```

## Diagnostics

### format: HetaSimulator.jl

![default-hetasimulator-IR_apo](./plots/default-hetasimulator-IR_apo.png)
![default-hetasimulator-COV_num_sputum_ml](./plots/default-hetasimulator-COV_num_sputum_ml.png)

### format: SLV

![default-dbsolve-IR_apo](./plots/default-dbsolve-IR_apo.png)
![default-dbsolve-COV_num_sputum_ml](./plots/default-dbsolve-COV_num_sputum_ml.png)

### format: Matlab

![default-matlab-plot](./plots/default-matlab-plot.png)

### format: Simbio

![default-matlab-plot](./plots/default-simbio-plot.png)