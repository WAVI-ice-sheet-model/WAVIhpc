# Usage
## Create an ensemble configuration
You can use `wavi_create_case` to create a new template folder to create your ensemble:

```bash
wavi_create_case anewcase template_bas
```
This will create a `/cases/anewcase` folder containing `/code`, `/ensemble`, `/input`, `/run` and `/scripts`, based
on the `/cases/template_bas` folder. 

A full breakdown is provided in the [Cases page](templates_cases.md), but in particular, pay attention to the following:

1. `/ensemble/template.yaml` controls the model ensemble, change directory destinations and quota as you see fit, ensuring they point to a location which is visible for the HPC nodes. Also see [model-ensembler building configuration](https://model-ensembler.readthedocs.io/en/latest/user/configuration/).
1. `/scripts/run_ensemble_member.j2` is the template for the script that will be sent to SLURM. Pay attention to module loading and/or exports to `$PATH`, depending on how you have installed Julia. If you have installed Julia using `juliaup` (e.g. for Archer/JASMIN/local), you should not need to make any changes here.

## Running the ensemble
Finally, to run your ensemble:

```bash
wavi_ensemble test_ensemble anewcase
```

## Single execution
You can also try running WAVI in single execution mode:

```bash
wavi_execute test_run wavi_test
```