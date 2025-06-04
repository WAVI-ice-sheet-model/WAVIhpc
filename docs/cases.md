# Case breakdown

Below is a breakdown of the different cases that are provided in WAVIhpc.

## template

The `template` case is the boilerplate template on which all other templates are based.

It contains the following structure:

```bash
cases
└── template
    ├── code
    ├── ensemble
    |   └── template.yaml
    ├── input
    |   ├── drive.jl
    |   └── driver.jl.j2
    ├── run
    └── scripts
        ├── prep_run
        ├── run_driver
        ├── run_ensemble_member
        └── run_ensemble_member.j2
```

All other cases also follow this structure. The directories contain the following:

* `/code`: Empty in templates, but could contain additional (e.g. Julia) code required to run your ensemble.
* `/ensemble`: Contains a [model-ensembler configuration](https://model-ensembler.readthedocs.io/en/latest/user/configuration/) file, `template.yaml`.
* `/input`: Contains input files, in this case `driver.jl`/`driver.jl.j2`, files which instantiate, configure and run the WAVI simulation. Also see [WAVI API Overview](https://rjarthern.github.io/WAVI.jl/data_structure/overview/).
* `/run`: An empty folder, which will contain output files for each run.
* `/scripts`: Contains scripts `prep_run`, `run_driver.jl`, `run_ensemble_member`/`run_ensemble_member.j2`, whose execution are configured by `/ensemble/template.yaml`

## template_bas

The BAS template structure is identical to the boilerplate template, but there are changes to `ensemble/template.yaml` and `scripts/run_ensemble_member` tailored to running on the BAS HPC.

## template_archer

The Archer template structure is identical to the boilerplate template, but there are changes to `ensemble/template.yaml` and `scripts/run_ensemble_member` tailored to running on the Archer HPC.

## template_jasmin
Identical to Archer, with JASMIN-specific changes to `ensemble/template.yaml` and `script/run_ensemble_member`.

## ATTR_666

## MISMIP_666
This case is intended to simulate the [Marine Ice Sheet Model Intercomparison](https://tc.copernicus.org/articles/14/2283/2020/), which you can also follow in the [WAVI documentation](https://rjarthern.github.io/WAVI.jl/examples/mismip_plus).

Configured to run on Archer, MISMIP_666 contains changes to `input/driver.jl`, as well as additional files under `/scripts`: `prep_run.sh`, `rsync_jld2.sh`, `rsync_mat.sh`, `rsync.sh`, `run_repeat.sh` and `sub_run.sh`.

## MISOMIP_666

This case is intended to simulate the Marine Ice Sheet-Ocean Model Intercomparison Project (MISOMIP)

Configured to run on Archer, MISOMIP_666 contains changes to `input/driver.jl`, as well as additional input data files: `bathyREAL_408.box`, `hinit400_40_24_2.box`, `hmask400_40_24_2_edit.bin`, and `Streamice_Thickness_out.data`.

It also contains additional files under `/scripts`: `prep_run.sh`, `rsync.sh`, `run_repeat.sh` and `sub_run.sh`.
