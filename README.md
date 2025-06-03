# WAVIhpc

A configuration and helper repository to assist with running [WAVI](https://github.com/RJArthern/WAVI.jl) ensembles locally or on HPCs using [model-ensembler](https://github.com/environmental-forecasting/model-ensembler).

## Supported Platforms
Currently WAVIhpc supports execution in single mode and ensemble mode on the following platforms:

* Locally
* BAS HPC
* [Archer HPC](https://www.archer2.ac.uk/).

## Functionality
WAVIhpc provides convenience function to help set up and run WAVI ensembles:

* `wavi_install`: Installs WAVI into a Julia environment.
* `wavi_create_case`: Creates a new ensembling case based on a provided template.
* `wavi_ensemble`: Runs a WAVI ensemble.
* `wavi_execute`: Runs a single execution of WAVI (ie not an ensemble).

## Templates and Use Cases
WAVIhpc also provides generic templates and specific cases you can base your ensembles on:

* `template`: a generic boilerplate template.
* `template_archer`: a template set up to run ensembles on Archer.
* `template_bas`: a template set up to run ensembles on the BAS HPC.
* `ATTR_666`:
* `MISMIP_666`: [Marine Ice Sheet Model Intercomparison Project (MISMIP)](https://tc.copernicus.org/articles/14/2283/2020/)
* `MISOMIP_666`: Marine Ice Sheet-Ocean Model Intercomparison Project (MISOMIP)