
#!/bin/bash

set -e

#get path to subject T1 from config.json
SUBBRAIN=$(jq -r .t1 config.json)
echo "$SUBBRAIN"

#path to the template (binary) subcortical atlas
TEMPLATEATLAS=/path/to/atlas/template
#path to the probabilistic subcortical atlas
PROBATLAS=/path/to/prob/atlas.

#standard ants wrapper from
#https://github.com/jmtyszka/atlaskit/blob/master/tmp2ind_T1.sh
atlaskit/tmp2ind_T1.sh --T1ind=$SUBBRAIN --T1tmp=$TEMPLATEATLAS --Atmp=$PROBATLAS --nthreads=1

#convert the output probabalistic (4D) subject-specific atlas to a binarized atlas (3D)
#https://github.com/jmtyszka/atlaskit/blob/master/prob2det.sh
prob2det.sh pA_tmp2ind.nii.gz T1w_tmp2ind.nii.gz .5

