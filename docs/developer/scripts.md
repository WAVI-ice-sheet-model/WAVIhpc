# Scripts

The scripts folder contains helper functions to help install and initiate WAVI ensembles:

```bash
scripts
└── archer/jasmin
|   ├── install_julia.sh
|   ├── .. # Symlinks to BAS
|   └── .. # Symlinks to local
└── BAS
|   ├── post_batch.sh
|   ├── pre_run.sh
|   └── .. # Symlinks to local
└── local
|   ├── wavi_create_case
|   ├── wavi_ensemble
|   ├── wavi_execute
|   └── wavi_install
└── common.sh
└── fcopy_wavi_case_a2.sh
└── julia_install_wavi.jl
```

It contains common scripts used on all platforms, `local/` scripts which contain the helper functions, 
`BAS/` which contains symlinks to the helper functions in `local/`, and additional BAS HPC-specific scripts, and finally `archer/` which contains symlinks to `local/`, `BAS/` and additional `archer` scripts.


## ./
### `common.sh`
Checks if Julia is available, and if we are running in the root directory.

### `fcopy_wavi_case_a2.sh`

### `julia_install_wavi.jl`
Install WAVI into an enviroment. Also provides the option to install a [development branch of WAVI](../advanced_functionality.md#using-a-local-development-directory-of-wavi).

## local
Contains all functionality command scripts, which are described on the [functionality page](../functionality.md).

## BAS
### `pre_run.sh`
This is template script to demonstrate a pre-run task as part of an ensemble. 

It sets environmental variables (such as run destination, outfiles names) used by a run.

### `post_batch.sh`
This is template script to demonstrate a post-batch task as part of an ensemble. 

It checks whether an outfile exists in the run directory.

## archer
### `install_julia.sh`
A helper script that installs Julia, specifically written for use on Archer.

## jasmin
### `install_julia.sh`
A helper script that installs Julia, specifically written for use on JASMIN.
