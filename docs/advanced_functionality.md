# Advanced Functionality

A collection of more advanced use cases and how to approach them.

## Using a local development directory of WAVI

For this, any invocation of `wavi_install` can accept an additional `--develop <path>` argument to specify your local clone of WAVI to install from.

## Using different Pkg environments for different experiments/runs
By default activity will take place in a default `wavi_test` Pkg environment.

You can set `WAVI_ENV` to create / use different environments for different experiments / runs!

For example:
```bash
export WAVI_ENV="mismip_run"
```

[Please read here for more information about Julia environments](https://pkgdocs.julialang.org/v1/environments/#Creating-your-own-environments).

## Pulling code from a template to existing case directory
First, check the differences between the original template (`template_bas/`) and your current case directory (`anewcase/`):

```bash
diff --brief --recursive cases/template_bas/ cases/anewcase/
```

This will show you files you have updated in your case directory, since copying them over from the template.

You can _partially_ rsync these files to only transfer updates.

For example, if we had changed `template_bas/code/myfunction.jl`, and wanted to move this 
change to `anewcase/code/myfunction.jl`:

```bash
rsync --inplace --no-whole-file cases/template_bas/code/myfunction.jl cases/anewcase/code/myfunction.jl
```

This should update `myfunction.jl` in `anewcase` with changes made in `template_bas/code/myfunction.jl`.

!!! danger "Overwriting existing destination file"

    Take some care with the approach, this **will** overwrite any changes you have made to
    `cases/anewcase/code/myfunction.jl` that do not appear in `template_bas/code/myfunction.jl`.