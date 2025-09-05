# Troubleshooting
Below is information on where to find logs for debugging, and other common issues you may run into.

## Logs

Output logs will be written to the root of your ensemble run folders (e.g. `test_ensemble-*`).

You will also find a *run* log under `/run/proc.0.log`.

## Can't find command `wavi_install`
Make sure you have set `export PATH="`realpath .`/scripts/local:$PATH"` in the *root* directory of 
WAVIhpc. Replace `local` with the name of the platform you are running on.

## `wavi_install` can't find Julia
Make sure you have either loaded the Julia module:

```shell
module avail julia
module load julia-*
```

Or, if you have installed Julia using `install_julia.sh`, point to it in `PATH`:
```bash
export PATH="$PATH:/path/to/<Julia directory>/bin"
```

## HPC Nodes can't find Julia

Inspect `/scripts/run_ensemble_member.j2` - is the script loading a Julia module, or pointing to the right location in `PATH`?

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

## BAS HPC Quota exceeded
`quota of x exceeds y`

Check the quota you have on the BAS HPC using `myquotas`, in particular under `/data/hpcdata` (or wherever you are outputting results). Open an IT ticket to increase your quota, and adjust the limit accordingly in your `template.yaml`.

## `juliaup` can't find the right channel
Run `juliaup status`, is a default channel set?

If not:

```shell
juliaup add release
juliaup default release
```

If this does not resolve the issue, you may be attempting to run julia in an environment with multiple _source_ of julia installation. Try replacing calls of `julia` in your scripts with the exact julia executable provided by juliaup: `/data/hpcdata/users/$USER/.juliaup/bin/julia`.