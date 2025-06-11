# Platforms

WAVIhpc contains templates for the following platforms: ARCHER2, BAS HPC and JASMIN. But which one should you use?

This page aims to give a high-level comparison and quickstart guide to each platform.

## Comparison

Below is a comparison table of usage and hardware specification of the different supported platforms. Number of nodes/cores are not exact, but are intended to be indicative.

| Feature                 | ARCHER2                                                | JASMIN                                                  | BAS HPC                  |
|-------------------------|---------------------------------------------------------|----------------------------------------------------------|----------------------------------------------------------|
| **Purpose**             | National HPC service for compute-intensive research     | Data-intensive computing for climate/environmental science | BAS's internal HPC cluster |
| **Permitted Use**             | ESPRC + NERC     | NERC | BAS internal only|
| **CPU**                 | AMD EPYC 7742, 64-core Zen 2 processors                 | Various Intel Xeon CPUs                                  | Various Intel Xeon CPUs               |
| **Number of Nodes**     | ~5860 total                                           | ~300 total | ~20 total |
| **Number of Cores**     | ~750,000 total                                           | ~19,000 total                                    | ~ 430 total |
| **Memory per Node**     | 256 GB to 512 GB (standard nodes)                                 | 256 GB to 1024 GB (depending on host group)                       | 512 GB |

## ARCHER2
ARCHER2 is the National HPC service for compute-intensive research for ESPRC + NERC funded research. You can read more about its [storage types](https://docs.archer2.ac.uk/user-guide/io/#achieving-efficient-io) and [hardware specifications](https://docs.archer2.ac.uk/user-guide/hardware/).

ARCHER2 is the most powerful HPC supported by WAVIhpc, and therefore well-suited to the most compute-intensive ensembles.

Recommended reading:

1. [Quickstart for users](https://docs.archer2.ac.uk/quick-start/quickstart-users/).
1. [Running jobs](https://docs.archer2.ac.uk/user-guide/scheduler/).
1. [Data Management & Transfer](https://docs.archer2.ac.uk/user-guide/data/).


## BAS HPC
The BAS HPC is BAS's internal HPC cluster. You can read more about the [hardware specifications (BAS internal only)](https://servicedesk.bas.ac.uk/app/itdesk/ui/solutions/60624000040987658/details).

While not as powerful as ARCHER2, this cluster is only open to other BAS users. It is well suited for day-to-day running and testing of ensembles, and internal use.

Recommended reading:

1. [HPC User Guide](https://ictdocs.nerc-bas.ac.uk//index.php?title=HPC:User_Guide).
1. [HPC Training](https://gitlab.data.bas.ac.uk/kinton/hpc-training/-/tree/main/).
1. [Linux Service Desk Solutions](https://servicedesk.bas.ac.uk/app/itdesk/ui/solutions).


## JASMIN
[JASMIN](https://jasmin.ac.uk/about/) is a data analysis facility for NERC funded research or related environmental science projects. It provides storage **and** compute. You can read more about its [storage types](https://help.jasmin.ac.uk/docs/short-term-project-storage/), and [hardware specifications](https://help.jasmin.ac.uk/docs/batch-computing/lotus-cluster-specification/).

JASMIN provides larger and more versatile storage, but ARCHER2 is a far more powerful computing facility. It is well suited for day-to-day running and testing of ensembles, high-memory runs or simply testing your ensembles on a different platform.

Recommended reading:

1. [Getting started](https://help.jasmin.ac.uk/docs/getting-started/get-started-with-jasmin/).
1. [Batch computing](https://help.jasmin.ac.uk/docs/batch-computing/).
1. [Introduction to group workspaces](https://help.jasmin.ac.uk/docs/short-term-project-storage/introduction-to-group-workspaces/).

## Run on ARCHER2, store on JASMIN
As you have read above, ARCHER2's compute is more powerful while JASMIN's storage is more versatile - you can choose to combine these, by following the [Transfers from ARCHER2](https://help.jasmin.ac.uk/docs/data-transfer/transfers-from-archer2/#available-transfer-methods) documentation.