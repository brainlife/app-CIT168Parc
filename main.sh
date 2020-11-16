#!/bin/bash
#PBS -l nodes=1:ppn=8,vmem=28gb,walltime=10:00:00
#PBS -N wmaSeg
#PBS -V

set -e
set -x

echo "performing parcellation generation"
singularity exec -e docker://brainlife/atlaskit ./CTI168wrapper.sh

#brainlife issue rasing stuff goes here
