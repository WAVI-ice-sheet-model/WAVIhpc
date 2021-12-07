# WAVIhpc

Scripts for running WAVI, in either uncoupled or MITgcm-coupled mode.

Extended to support execution in single mode and ensemble mode on the following platforms:

* the local host, assuming availability of Julia in $PATH
* the BAS HPC, using the available Julia module
* the Archer HPC, leveraging Singularity

# Usage

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

```bash
export PATH="`realpath .`/scripts/local:$PATH"
wavi_install
wavi_create_case anewcase template_bas
wavi_ensemble test_ensemble anewcase
```

## Archer2

```bash
export PATH="`realpath .`/scripts/archer:$PATH"
```

TODO: clarify workflow with Alex / gain access and retest
