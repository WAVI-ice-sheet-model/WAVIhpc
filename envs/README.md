## Environments

This folder contains different environments that might be maintained for different run profiles: if you want to run lots of jobs then you're more than likely going to mix codebases. This can only be achieved with Pkg in julia allowing different specifications, and then `Pkg.activate`-ion as appropriate in the run directories.