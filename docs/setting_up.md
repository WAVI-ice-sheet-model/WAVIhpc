# Setting up your environment

Depending on which platform you are intending to run your ensemble, there are slightly different instructions.

## BAS HPC
Instructions differ between bash/c shell.

=== "bash"
### Julia Installation
Firstly, set `JULIA_DEPOT_PATH` for package storage in `~/.bashrc`:

```bash
export JULIA_DEPOT_PATH="/data/hpcdata/users/$USER/.julia:$JULIA_DEPOT_PATH"
```

Remember to run `source ~/.bashrc`.

This is where Julia packages will be installed. It is recommended the location is visible to the workstations
(ie. under "/data"), and in an area specific to you as user.

To install/load Julia, you have a couple of options:

1. Load the Julia module that is available on the HPC:
```shell
module avail julia
module load julia-*
```
1. Install [Julia manually](https://julialang.org/downloads/platform/#linux_and_freebsd), and set Julia's location in PATH:
```bash
wget https://julialang-s3.julialang.org/bin/linux/x64/1.11/julia-1.11.5-linux-x86_64.tar.gz
tar zxvf julia-1.11.5-linux-x86_64.tar.gz

export PATH="$PATH:/path/to/<Julia directory>/bin"
```

While 1). is more convenient, the availability of modules on the BAS HPC is subject to change.

Check Julia is installed:
```bash
julia --version
```

### Run Directory and Scripts
With Julia installed, make sure the functions in `scripts` can be found:

```bash
cd <directoryOfRepo>
export PATH="`realpath .`/scripts/BAS:$PATH"
```

You should now be able to call the convenvience functions under `/scripts`, such as `wavi_install`:

```bash
wavi_install
```

This will install [WAVI](https://github.com/RJArthern/WAVI.jl).

### Create an ensemble configuration
You can use `wavi_create_case` to create a new template folder to create your ensemble:

```bash
wavi_create_case anewcase template_bas
```
This will create a `/cases/anewcase` folder containing `/code`, `/ensemble`, `/input`, `/run` and `/scripts`, based
on the `/cases/template_bas` folder. 

A full breakdown is provided in the [Cases page](cases.md), but in particular, pay attention to the following:

1. `/ensemble/template.yaml` controls the model ensemble, change directory destinations and quota as you see fit, ensuring they point to a location which is visible for the HPC nodes. Also see [model-ensembler building configuration](https://model-ensembler.readthedocs.io/en/latest/user/configuration/).
1. `/scripts/run_ensemble_member.j2` is the template for the script that will be sent to SLURM. Pay attention to module loading and/or exports to `$PATH`, depending on how you have installed Julia. 

### Running the ensemble
To run your ensemble:

```bash
module load python/3.*
wavi_ensemble test_ensemble anewcase
```

## Archer

## local

```bash
export PATH="`realpath .`/scripts/local:$PATH"
wavi_install

# Either
wavi_create_case anewcase
## Edit your driver file under cases/anewcase/driver.jl to specify {{ }} tags
wavi_execute anewcase

# Or run five WAVIs in an ensemble
wavi_create_case anewcase
wavi_ensemble test_ensemble anewcase
```

