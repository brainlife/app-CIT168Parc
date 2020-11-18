
#!/bin/bash

set -e

#get path to subject T1 from config.json
SUBBRAIN=$(jq -r .t1 config.json)
echo "$SUBBRAIN"

#path to the template (binary) subcortical atlas
TEMPLATEATLAS=/template/CIT168_T1w_700um.nii.gz
#path to the probabilistic LATERALIZED subcortical atlas
PROBATLAS=/template/CIT168toMNI152_prob_atlas_bilat_1mm__merged_Lat.nii.gz

#standard ants wrapper from
#https://github.com/jmtyszka/atlaskit/blob/master/tmp2ind_T1.sh
atlaskit/tmp2ind_T1.sh --T1ind=$SUBBRAIN --T1tmp=$TEMPLATEATLAS --Atmp=$PROBATLAS --nthreads=8

#convert the output probabalistic (4D) subject-specific atlas to a binarized atlas (3D)
#https://github.com/jmtyszka/atlaskit/blob/master/prob2det.sh
atlaskit/prob2det.sh pA_tmp2ind.nii.gz output/parc.nii.gz .5

