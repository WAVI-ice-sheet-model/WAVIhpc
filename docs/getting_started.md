# Getting Started

Depending on which platform you are intending to run your ensemble, there are slightly different setup instructions:

1. [BAS HPC](getting_started.md#bas-hpc)
1. [Archer HPC](getting_started.md#archerjasmin)
1. [JASMIN](getting_started.md#archerjasmin)
1. [Local](getting_started.md#local)

## Platform-specific setup
### BAS HPC

#### Directory setup
Instructions differ between bash/c shell.

=== "bash"

    Firstly, set `JULIA_DEPOT_PATH` for package storage in `~/.bashrc`:

    ```bash
    export JULIA_DEPOT_PATH="/data/hpcdata/users/$USER/.julia:$JULIA_DEPOT_PATH"
    ```

    Then, make sure the functions in `scripts` can be found:

    ```bash
    cd <directoryOfRepo>
    export PATH="`realpath .`/scripts/BAS:$PATH"
    ```
    
    Remember to run `source ~/.bashrc`.

=== "c shell"

    Firstly, set `JULIA_DEPOT_PATH` for package storage in `~/.cshrc`:

    ```shell
    setenv JULIA_DEPOT_PATH="/data/hpcdata/users/$USER/.julia"
    ```
    
    Then, make sure the functions in `scripts` can be found:

    ```bash
    cd <directoryOfRepo>
    setenv PATH="`realpath .`/scripts/BAS"
    ```

    Remember to run `source ~/.cshrc`.

#### Julia Installation
This is where Julia packages will be installed. It is recommended the location is visible to the workstations
(ie. under "/data"), and in an area specific to you as user.

To install/load Julia, you have a couple of options:

1. Load the Julia module that is available on the HPC:
```shell
module avail julia
module load julia-*
```
1. Install [Julia manually](https://julialang.org/downloads/platform/#linux_and_freebsd), and set Julia's location in PATH, using the provided `install_julia.sh` script:
```bash
cd <directoryOfRepo>

install_julia.sh
```

While 1). is more convenient, the availability of modules on the BAS HPC is subject to change.

You should now be able to call the convenvience functions under `/scripts`, such as `wavi_install`.

You can now continue setting up using the [all platform instructions](getting_started.md#all-platforms) below.

### Archer/JASMIN
#### Directory setup
Make sure the functions in `scripts` can be found:

```bash
cd <directoryOfRepo>

# For Archer
export PATH="`realpath .`/scripts/archer:$PATH"

# For JASMIN
export PATH="`realpath .`/scripts/jasmin:$PATH"
```

#### Julia Installation
There are no Julia modules on JASMIN/Archer, but you can conveniently [install Julia using `juliaup`](https://julialang.org/install/):

```bash
curl -fsSL https://install.julialang.org | sh
```

This will automatically set up Julia for you - there are no additional steps needed as the installation will be visible to the HPC nodes by default.

You can now continue setting up using the [all platform instructions](getting_started.md#all-platforms) below.

### Local
As with Archer/JASMIN, you can install [Julia using `juliaup`](https://julialang.org/install/).

Then just point to the scripts under `local` so they can be found:

```bash
cd <directoryOfRepo>
export PATH="`realpath .`/scripts/local:$PATH"
```

You can now continue setting up using the [all platform instructions](getting_started.md#all-platforms) below.

## All Platforms
Check Julia is installed:

```bash
julia --version
```

To install WAVI:

```bash
wavi_install
```

This will install [WAVI](https://github.com/RJArthern/WAVI.jl).

!!! note "Pkg environments"

    WAVI will automatically be installed into an Pkg enviroment called `wavi_test`. As a user, you
    do not need to do anything for this to happen.
    
    However, should you wish to install WAVI into different environments, please refer to the [advanced functionality page](advanced_functionality.md#using-a-local-development-directory-of-wavi) for guidance on how to do this.

### Create an ensemble configuration
You can use `wavi_create_case` to create a new template folder to create your ensemble:

```bash
wavi_create_case anewcase template_bas
```
This will create a `/cases/anewcase` folder containing `/code`, `/ensemble`, `/input`, `/run` and `/scripts`, based
on the `/cases/template_bas` folder. 

A full breakdown is provided in the [Cases page](templates_cases.md), but in particular, pay attention to the following:

1. `/ensemble/template.yaml` controls the model ensemble, change directory destinations and quota as you see fit, ensuring they point to a location which is visible for the HPC nodes. Also see [model-ensembler building configuration](https://model-ensembler.readthedocs.io/en/latest/user/configuration/).
1. `/scripts/run_ensemble_member.j2` is the template for the script that will be sent to SLURM. Pay attention to module loading and/or exports to `$PATH`, depending on how you have installed Julia. If you have installed Julia using `juliaup` (e.g. for Archer/JASMIN/local), you should not need to make any changes here.

### Running the ensemble
Finally, to run your ensemble:

```bash
wavi_ensemble test_ensemble anewcase
```