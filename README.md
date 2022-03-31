# WAVIhpc

Scripts for running WAVI, in either uncoupled or MITgcm-coupled mode.

Extended to support execution in single mode and ensemble mode on the following platforms:

* the local host, assuming availability of Julia in $PATH
* the BAS HPC, using the available Julia module
* the Archer HPC, leveraging Singularity

# Usage

At present, prior to the wavi_install command, I run the following:

```bash
export WAVI_REPO="git@github.com:RJArthern/WAVI.jl.git"
export WAVI_REV="AlexDev"
```

## local

```bash
export PATH="`realpath .`/scripts/local:$PATH"
wavi_install

# Either
wavi_create_case anewcase
wavi_execute anewcase

# Or run five WAVIs in an ensemble
wavi_create_case anewcase
wavi_ensemble test_ensemble anewcase
```

**Still need to sort out ensemble configurations on a case by case basis, I defaulted to putting them in the scripts dir by accident...**

## BAS

Make sure you set JULIA_DEPOT_PATH for package storage, in your shells *rc file:

```
export JULIA_DEPOT_PATH="/data/hpcdata/users/<me>/.julia:$JULIA_DEPOT_PATH"
```

Then

```bash
cd <directoryOfRepo>
export PATH="`realpath .`/scripts/BAS:$PATH"
module load hpc/julia/1.6.2
wavi_install
wavi_create_case anewcase template_bas
module load hpc/python/conda-python-3.7.3
wavi_ensemble test_ensemble anewcase
```

## Archer2

```bash
export PATH="`realpath .`/scripts/archer:$PATH"
```

TODO: clarify workflow with Alex / gain access and retest

## Development of WAVI

```bash
cd <directoryOfRepo>
export PATH="`realpath .`/scripts/BAS:$PATH"
git clone -b <branch> <forkUrl>
wavi_install --develop WAVI.jl
# Continue with general usage but symlink WAVI.jl in the cases/templates
# TODO: automate
```
