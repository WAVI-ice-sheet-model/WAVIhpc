# Troubleshooting
Below is information on where to find logs for debugging, and other common issues you may run into.

## Logs

Output logs will be written to the root of your ensemble run folders (e.g. `test_ensemble-*`).

You will also find a *run* log under `/run/proc.0.log`.

## Can't find command `wavi_install`
Make sure you have set `export PATH="`realpath .`/scripts/local:$PATH"` in the *root* directory of 
WAVIhpc.

## `wavi_install` can't find Julia
Make sure you have either loaded the Julia module:

```shell
module avail julia
module load julia-*
```

Or, if you have manually installed Julia, point to it in `PATH`:
```bash
export PATH="$PATH:/path/to/<Julia directory>/bin"
```

## HPC Nodes can't find Julia

Inspect `/scripts/run_ensemble_member.j2` - is the script loading Julia, or pointing to the right location in `PATH`?

## HPC Nodes can't find WAVI

Did you call `wavi_install` before submitting the job?

If you are not sure if WAVI is installed in the right place, you can check so interactively. In Julia:

```julia
import Pkg
Pkd.add("WAVI")

using WAVI
```

If you have installed WAVI, but julia cannot find it - check your `JULIA_DEPOT_PATH`.

## Can't find command `module`
Try running:
```bash
source /etc/profile.d/modules.sh
```

To prevent this issue in the future, consider adding this to `~/.bashrc`.

## Post-run check fails: there is no `outfile.nc`
In `ensemble/template.yaml`:
```yaml
      post_run:
        - name:     check
          args:
            cmd:    /usr/bin/test -f run/outfile.nc
            fail:   True
        - name:     move
          args:
            dest:   "/data/hpcdata/users/${USER}/WAVIhpc"
```

Is `dest:` pointing to a destination that the HPC nodes can see, and that the user has write-access to?

## HPC Quotas
BAS hpc quotas

