# Getting Started
## Pre-requisites

It is recommended you have some familiarity of how to _use_:

* [WAVI](https://rjarthern.github.io/WAVI.jl/).
* [model-ensembler](https://model-ensembler.readthedocs.io/en/latest).
* Running SLURM jobs on your chosen platform ([BAS HPC (internal)](https://gitlab.data.bas.ac.uk/kinton/hpc-training/-/blob/main/7%20-%20Slurm%20Scheduler.ipynb), [JASMIN LOTUS](https://help.jasmin.ac.uk/docs/batch-computing/lotus-overview/), [Archer](https://docs.archer2.ac.uk/user-guide/scheduler/)).

## Platform-specific setup

Setup and installation instructions are provided for each platform:

1. [BAS HPC](installation.md#bas-hpc)
1. [Archer HPC](installation.md#archerjasmin)
1. [JASMIN](installation.md#archerjasmin)
1. [Local](installation.md#local)

After directory setup and Julia installation, [all platforms follow common instructions](installation.md#all-platforms).

### BAS HPC

#### Directory setup
Depending on the default shell you wish to use (bash or c shell), instructions differ slightly:

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
1. Install [Julia manually](https://julialang.org/downloads/platform/#linux_and_freebsd), and provided Julia's location is set in PATH, using the provided `install_julia.sh` script:
```bash
cd <directoryOfRepo>

install_julia.sh
```

While 1). is more convenient, the availability of modules on the BAS HPC is subject to change.

You should now be able to call the convenvience functions under `/scripts`, such as `wavi_install`.

You can now continue setting up using the [all platform instructions](installation.md#all-platforms) below.

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

You can now continue setting up using the [all platform instructions](installation.md#all-platforms) below.

### Local
As with Archer/JASMIN, you can install [Julia using `juliaup`](https://julialang.org/install/).

Then just point to the scripts under `local` so they can be found:

```bash
cd <directoryOfRepo>
export PATH="`realpath .`/scripts/local:$PATH"
```

You can now continue setting up using the [all platform instructions](installation.md#all-platforms) below.

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
    
    However, should you wish to install WAVI into different environments, please refer to the [advanced usage page](advanced_usage.md#using-a-local-development-directory-of-wavi) for guidance on how to do this.