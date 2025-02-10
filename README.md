# WAVIhpc

A repository to assist with running WAVI ensembles locally or on HPCs.

Extended to support execution in single mode and ensemble mode on the following platforms:

* the local host, assuming availability of Julia in $PATH
* the BAS HPC, using the available Julia module
* the Archer HPC, leveraging Singularity

# Usage

## Setting up your environment

__Most importantly, by default activity will take place in a default "wavi_test" Pkg environment. Set `WAVI_ENV` to create / use different environments for different experiements / runs!__ [Please read here for more information about Julia environments](https://pkgdocs.julialang.org/v1/environments/#Creating-your-own-environments).

### Using a remote clone

At present, prior to the wavi_install command, I run the following to set up my repo (_the below are the default values_):  

```bash
export WAVI_REPO="https://github.com/RJArthern/WAVI.jl" # bash
setenv WAVI_REPO "https://github.com/RJArthern/WAVI.jl" # csh
```

You can also set `WAVI_REV` to any revision you'd like to pull, it will default to `main`.

### Using a local development directory

For this, any invocation of `wavi_install` can accept an additional `--develop <path>` argument to specify your local clone of WAVI to install from. Please adapt any following instructions accordingly.

_Any use of the ensembler will require a symlink in the template directory to ensure that the run directory can access your local code._

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

