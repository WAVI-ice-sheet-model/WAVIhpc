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

Use install_julia.sh below to install julia, or if you already have an
installation sorted, ensure `JULIA_DEPOT_PATH` is set as with BAS, but under
your /work directory

```bash
# WAVIhpc MUST be installed under your /work directory for slurm runs
# Do this once for a working copy of julia and then you're done
cd <directoryOfRepo>
export PATH="`pwd`/scripts/archer:$PATH"
install_julia.sh

# Log out and back in again - this is the block to use normally
cd <directoryOfRepo>
export PATH="`pwd`/scripts/archer:$PATH"
wavi_install
wavi_create_case anewcase template_archer
# The next module load is only required the first time you run wavi_ensemble
module load cray-python
wavi_ensemble test_ensemble anewcase
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

# Revised workflow notes

_From a discussion with Rosie_

So in whichever WAVIhpc folder you want (make sure you're in the root of it though :slightly_smiling_face: ), you'll need to do the following.

```
git checkout revised_workflow
git pull
source venv/bin/activate
pip install --upgrade git+https://git@github.com/JimCircadian/model-ensembler.git@v0.5.4_work
deactivate
```

At this point you'll have the latest ensembler code and the new template under template_bas, so if you create your new ensemble template from that you'll see that both ensemble/template.yaml and scripts/* have been altered significantly, with the former being the one you'll need to define your runs in. Other than that you should be able to just bring over driver files etc without trouble, just bearing in mind that the aforementioned directories (especially scripts) are rather different.
The behavioural changes to be aware of, which I'm testing through at the moment but are better in the long run are:

* No more weird LAST_EXIT or timeout statuses
* The ensembler will refuse to run a member if there's an outfile or something in icesheet_output, but it'll work for all other members and carry on thereafter
* It will move the output once outfile is generated and remove the run directory entirely
The repeat parameter is a flag, so it'll keep running until there are no run directories left for the batch in question
* The slurm job will place a dummy outfile in the run directory if the previous run started at the same niter as the next run, as this may indicate a failure. It'll email you if this happens

All of these activities are now controlled by the ensembler, which is kind of better to be honest, so you can have a nosey in the template.yaml. Also, I've fixed a gremlin that meant cancelled members hung the batch (apologies, I think you might have tried to say this to me before but I didn't get what you meant, it's a recently introduced error), which is great as it means if jobs get cancelled in slurm (i.e. node reboot) then you shouldn't have to intervene as they'll get picked up next time round.
