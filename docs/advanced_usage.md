# Advanced usage

## Using a local development directory

For this, any invocation of `wavi_install` can accept an additional `--develop <path>` argument to specify your local clone of WAVI to install from. Please adapt any following instructions accordingly.

_Any use of the ensembler will require a symlink in the template directory to ensure that the run directory can access your local code._

# Revised workflow notes

_From a discussion with Rosie_

So in whichever WAVIhpc folder you want (make sure you're in the root of it though :slightly_smiling_face: ), you'll need to do the following.

```
git checkout revised_workflow
git pull
source venv/bin/activate
pip install --upgrade model_ensembler
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
