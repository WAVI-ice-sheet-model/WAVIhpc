# Functionality
## `wavi_install`
Installs WAVI into a Julia Environment.

```
wavi_install
```

## `wavi_create_case`
Creates a new case by copying an existing template:

```
wavi_create_case anewcase bas_template
```

Where the first argument is the name of the new case, and the second the existing template to copy from.

## `wavi_ensemble`
Sets up the Python environment, installs model-ensembler and calls `model_ensemble` using the configuration `.yml` provided:

```
wavi_ensemble test_ensemble anewcase
```

Where the first argument is a name you want to give your ensemble, and the second argument is the cases folder you have configured it in.

## `wavi_execute`