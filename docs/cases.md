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

## template_archer

## ATTR_666

## MISMIP_666

## MISOMIP_666