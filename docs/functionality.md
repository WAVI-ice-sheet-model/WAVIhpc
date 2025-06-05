# Functionality
## `wavi_install`
Installs [WAVI](https://github.com/RJArthern/WAVI.jl) into a Julia Pkg Environment.

```
wavi_install
```

`wavi_install` can also accept an additional `--develop <path>` argument to specify a local clone of WAVI to install from:

```
wavi_install --develop ~/Documents/WAVI
```

## `wavi_create_case`
Creates a new case by copying an existing template:

```
# Usage
wavi_create_case <name-of-new-case> <source-template>

# Example
wavi_create_case anewcase bas_template
```

Where the first argument is the name of the new case, and the second the existing template to copy from.

## `wavi_ensemble`
Sets up the Python environment, installs model-ensembler and calls `model_ensemble` using the configuration `.yml` provided:

```
# Usage
wavi_ensemble <ensemble-name> <case-template>

# Example
wavi_ensemble test_ensemble anewcase
```

Where the first argument is a name you want to give your ensemble, and the second argument is the cases folder you have configured it in.

## `wavi_execute`
Provides a single execution command for WAVI:

```
# Usage
wavi_execute <run-name> <pkg-environment>

# Example
wavi_execute test_run wavi_test
```

Where the first argument is a name you want to give to the run, and the second argument it the Pkg environment you have installed WAVI in.