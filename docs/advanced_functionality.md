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

## Updating code in `template_bas/` and updating `anewcase/`
First, check the differences between the original template (template_bas) and anewcase:

```bash
diff --brief --recursive cases/template_bas/ cases/anewcase/
```

This will show you files you have updated, you can partially rsync the files to only transfer updates.

For example, if we had changed `code/myfunction.jl` in `template_bas/`, and wanted to move this 
change to `anewcase/code/myfunction.jl`:

```bash
rsync --inplace --no-whole-file cases/template_bas/code/myfunction.jl cases/anewcase/code/myfunction.jl
```

This should update `myfunction.jl` in `anewcase`, only with changes made in `template_base/code/myfunction.jl`.

!!! danger "Conflicting changes"

    Take some care with the approach, especially if there are potentially conflicting changes.