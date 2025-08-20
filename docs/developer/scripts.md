# Scripts

The scripts folder contains helper functions to help install and initiate WAVI ensembles:

```bash
scripts
└── archer/jasmin
|   ├── fcopy_wavi_case_a2.sh # Unique to ARCHER2
|   ├── .. # Symlinks to BAS pre_run.sh and post_batch.sh
|   └── .. # Symlinks to local
└── jasmin
|   ├── .. # Symlinks to BAS pre_run.sh and post_batch.sh
|   └── .. # Symlinks to local
└── BAS
|   ├── install_julia.sh # Unique to BAS HPC
|   ├── post_batch.sh
|   ├── pre_run.sh
|   └── .. # Symlinks to local
└── local
|   ├── wavi_create_case
|   ├── wavi_ensemble
|   ├── wavi_execute
|   └── wavi_install
└── common.sh
└── julia_install_wavi.jl
```

It contains common scripts used on all platforms, `local/` scripts which contain the helper functions.

The `BAS/` folder contains symlinks to the helper functions in `local/`, and additional BAS HPC-specific scripts.

The `archer/` and `jasmin/` folders contains symlinks to `local/` and `BAS/`.

## ./
### `common.sh`
Checks if Julia is available, and if we are running in the root directory.

### `julia_install_wavi.jl`
Install WAVI into a Pkg environment. Also provides the option to install a [development branch of WAVI](../advanced_usage.md#using-different-pkg-environments-for-different-experimentsruns).

## local
Contains all functionality command scripts, which are described on the [functionality page](../functionality.md).

## BAS
### `pre_run.sh`
This is template script to demonstrate a pre-run task as part of an ensemble. 

It sets environmental variables (such as run destination, outfiles names) used by a run.

### `post_batch.sh`
This is template script to demonstrate a post-batch task as part of an ensemble. 

It checks whether an outfile exists in the run directory.

### `install_julia.sh`
A helper script that installs Julia, specifically written for use on Archer.

## jasmin
Simply contains symlinks to all local scripts, and BAS HPCs `pre_run.sh` and `post_batch.sh` 

## archer
As with JASMIN, but with the addition of `fcopy_wavi_case_a2.sh`.

### `fcopy_wavi_case_a2.sh`
An ARCHER2-specific script wich makes a new case by copying an old case on ARCHER2 without copying results files or unnecessary binaries.
