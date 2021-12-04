# WAVIhpc

Scripts for running WAVI, in either uncoupled or MITgcm-coupled mode.

Extended to support execution in single mode and ensemble mode on the following platforms:

* the local host, assuming availability of Julia in $PATH
* the BAS HPC, using the available Julia module
* the Archer HPC, leveraging Singularity

# Usage

## local/BAS

```bash
# In the root of the repository, set the appropriate root (local/archer/BAS)

export PATH="`realpath .`/scripts/local:$PATH"
wavi_install
wavi_create_case anewcase

# Either
wavi_execute anewcase

# Or run five WAVIs in an ensemble
wavi_ensemble anewcase 5
```

## Archer2

TODO: clarify workflow with Alex / gain access and retest
