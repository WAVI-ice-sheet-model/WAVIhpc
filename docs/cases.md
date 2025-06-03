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

All other cases also follow this structure.


## template_bas

## template_archer

## ATTR_666

## MISMIP_666

## MISOMIP_666