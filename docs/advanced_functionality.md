# Advanced Functionality

A collection of more advanced use cases and how to approach them.

## Using a local development directory of WAVI

For this, any invocation of `wavi_install` can accept an additional `--develop <path>` argument to specify your local clone of WAVI to install from.

## Different Pkg environments for different experiments/runs
By default activity will take place in a default `wavi_test` Pkg environment.

You can set `WAVI_ENV` to create / use different environments for different experiments / runs!

For example:
```bash
export WAVI_ENV="mismip_run"
```

[Please read here for more information about Julia environments](https://pkgdocs.julialang.org/v1/environments/#Creating-your-own-environments).