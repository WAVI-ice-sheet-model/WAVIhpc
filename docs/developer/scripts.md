# Scripts

The scripts folder contains helper functions to help install and initiate WAVI ensembles:

```bash
scripts
└── archer
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
Install WAVI into an enviroment. Also provides the option to install a [development branch of WAVI](../advanced_usage.md#using-a-local-development-directory-of-wavi).

## local
### `wavi_install`
Calls `common.sh` and `julia_install_wavi.jl` using Julia.

### `wavi_create_case`
Creates a new case by copying an existing template:

```
wavi_create_case anewcase bas_template
```

Where the first argument is the name of the new case, and the second the existing template to copy from.

### `wavi_ensemble`
Sets up the Python environment, installs model-ensembler and calls `model_ensemble` using the configuration `.yml` provided:

```
wavi_ensemble test_ensemble anewcase
```

Where the first argument is a name you want to give your ensemble, and the second argument is the cases folder you have configured it in.

### `wavi_execute`

## BAS
### `pre_run.sh`
### `post_batch.sh`

## archer
### `install_julia.sh`