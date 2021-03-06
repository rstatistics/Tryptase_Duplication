#!/bin/bash

# Example SGE submit script
# Any SGE command line option can be added to this script by
# starting a new line with "#$" followed by the SGE qsub option.

# Specify what shell you want SGE to use to start your job
#$ -S /bin/bash

# Use your current working directory as it's working directory for your jobs
# The default is to use $HOME
#$ -cwd

# trigger NCBI facilities to setup your environment on the SGE node running your job
#$ -v SGE_FACILITIES

# Use -v to export any other env variables you want your job to have access to
# #$ -v MYVAR=1

# Do not join stdout and stderr data. Also define filenames for stdout/stderr which
# are appended with the current jobid.
#$ -j n
#$ -o $HOME/stdout.$JOB_ID -e $HOME/stderr.$JOB_ID

# use the unfied project
#$ -P unified

# IMPORTANT: reset the runtime limit to 4 hours. If your job exceeds this runtime, it will be killed
# The default is two hours. This is walltime - not cpu time. The value must be in seconds. You should
# be sure to give your job enough time to run, but there are some slots on the farm reserved for jobs
# with shorter runtimes (e.g. < 1 hour, < 2 hours, < 4 hours, < 8 hours, etc.) so try not to
# overestimate too much.

#$ -l h_rt=14400

# IMPORTANT: reset the maximum amount of virtual memory you expect your job to use. The default
# is 2G. If your job exceeds this value and your don't reset the default, it will be killed.
# Values can be in <num>M (for megabytes) or <num>G (for gigabytes).

#$ -l h_vmem=8G

# only send job to hosts which have 1G of free memory. Note that this is NOT a limit
# but rather a resource request.

#$ -l mem_free=8G

# turn automatic emails off
# turn automatic emails off
#$ -m n

# This is the command line for my job.

bash jobs/job_SRR1608788.sh
