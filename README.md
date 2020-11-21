[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.449-blue.svg)](https://doi.org/10.25663/brainlife.app.449)

<img src="birdface.gif" alt="birdface" width="232" height="193"/>

# app-CIT168Parc
This app generates a subject-specific parcellation of subcortical areas using the [CIT168 parcellation](https://identifiers.org/neurovault.collection:3145).

### Authors
- Daniel Bullock (dnbulloc@iu.edu)

### Contributors
- Soichi Hayashi (hayashis@iu.edu)

### Project Director
- Franco Pestilli (franpest@indiana.edu)

### Funding
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)
[![NIMH-T32-5T32MH103213-05](https://img.shields.io/badge/NIMH_T32-5T32MH103213--05-blue.svg)](https://projectreporter.nih.gov/project_info_description.cfm?aid=9725739)

### References 
[Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019).](https://doi.org/10.1038/s41597-019-0073-y)

[Pauli, W., Nili, A. & Tyszka, J. A high-resolution probabilistic in vivo atlas of human subcortical brain nuclei. Sci Data 5, 180063 (2018).](https://doi.org/10.1038/sdata.2018.63)  

[Pauli et al. 2018, human subcortical brain nuclei atlas neurovault record](https://identifiers.org/neurovault.collection:3145) 

(**Note**, the above parcellation _is not_ lateralized (in that the left and right variants of a structure receive the same label).  Thus for local users, in order to lateralize the structure a method akin to the one found [here](https://github.com/brainlife/app-CIT168Parc/issues/2) must be implemented.  Alternatively, the [docker container associated with this app](https://hub.docker.com/r/brainlife/atlaskit) contains a [lateralized version of this atlas](https://github.com/brainlife/docker-atlaskit/tree/master/CIT168Atlases), [found within the "template" directory](https://github.com/brainlife/docker-atlaskit/blob/b6fc856a7ac82dd52294e0aab2356465a79f0e11/Dockerfile#L32).

[**atlaskit**](https://github.com/jmtyszka/atlaskit/wiki), "Tools for working with deterministic and probabilistic anatomic atlas labels" ((wiki page)[https://github.com/jmtyszka/atlaskit/wiki])
[![DOI](https://zenodo.org/badge/33556742.svg)](https://zenodo.org/badge/latestdoi/33556742)

(**Note**, [atlaskit](https://github.com/jmtyszka/atlaskit/wiki) presumes a 4D structured probabalistic atlas.  As such, local machine users will need to use [fslmerge](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Fslutils) on the separated, 3D atlas volumes in order to make a 4D atlas.)

## Running the App 

### On Brainlife.io

Visit https://doi.org/10.25663/brainlife.app.449 to run this app on the brainlife.io platform.  Requires a T1 structural image as input.

### Running Locally (on your machine) using singularity & docker

Because there is a docker container for appropriate for this code you can run this on singularity, and thereby download the repo and run it locally with minimal setup.  Ensure that you have singularity installd appropriately on your machine.

### Running Locally (on your machine)

Pull this (app-CIT168Parc) repo.

Ensure the appropriate software is installed on your local machine
| Software | Description                  | Version | Link                            |
|----------|------------------------------|---------|---------------------------------|
| Python   | High-level coding            | 3.4+    | https://www.python.org/         |
| FSL      | Neuroimaging analysis        | 5.0.9+  | https://fsl.fmrib.ox.ac.uk/     |
| ANTs     | Image warp registration      | 2.1.0+  | https://github.com/stnava/ANTs/ |
| CIT168   | Templates and atlas          | 1.0.0 ? | https://identifiers.org/neurovault.collection:3145 |

Utilize a config.json setup that is analagous to the one contained within this repo, listed as a sample.

### Sample Datasets

Visit brainlife.io and explore any data set containg T1 data:

[Human Connectome Project 3T](https://brainlife.io/project/5941a225f876b000210c11e5/detail)

## Output

This app outputs a [parcellation type](https://brainlife.io/datatype/5c1a7489f9109beac4a88a1f) data output.

### Segmented strucures

This app segments the following subcortical structures, and associates them with the specified voxel labels.

|Label No.| Structure assignment |
|----|------------------------------|
|	 0	|  background |
|  1	|  l_putamen |
|  2	|  r_putamen | 
|  3	|  l_caudate |
|  4	|  r_caudate |
|  5	|  l_nucleus_accumbens |
| 	6	|  r_nucleus_accumbens |
| 	7	|  l_extended_amygdala |
| 	8	|  r_extended_amygdala |
| 	9	|  l_external_globus_pallidus |
| 	10	|  r_external_globus_pallidus |
| 	11	|  l_internal_globus_pallidus |
| 	12	|  r_internal_globus_pallidus |
| 	13	|  l_substantia_nigra_pars_compacta |
| 	14	|  r_substantia_nigra_pars_compacta |
| 	15	|  l_red_nucleus |
| 	16	|  r_red_nucleus |
| 	17	|  l_substantia_nigra_pars_reticulata |
| 	18	|  r_substantia_nigra_pars_reticulata |
| 	19	|  l_parabrachial_pigmented_nucleus |
| 	20	|  r_parabrachial_pigmented_nucleus |
| 	21	|  l_ventral_tegmental_area |
| 	22	|  r_ventral_tegmental_area |
| 	23	|  l_ventral_pallidum |
| 	24	|  r_ventral_pallidum |
| 	25	|  l_habenular_nucleus |
| 	26	|  r_habenular_nucleus |
| 	27	|  l_hypothalamus |
| 	28	|  r_hypothalamus |
| 	29	|  l_mamillary_nucleus |
| 	30	|  r_mamillary_nucleus |
| 	31	|  l_subthalamic_nucleus |
| 	32	|  r_subthalamic_nucleus |

### Product.json

Not relevant for this App as it does not generate processed data. 

## Dependencies

This Dockerized App only requires [singularity](https://www.sylabs.io/singularity/) and (in some cases) run. If you don't have singularity, you will need to install following dependencies.  

https://singularity.lbl.gov/docs-installation
https://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall

Alternatively, ensure the appropriate software is installed on your local machine in order to run it locally.

| Software | Description                  | Version | Link                            |
|----------|------------------------------|---------|---------------------------------|
| Python   | High-level coding            | 3.4+    | https://www.python.org/         |
| FSL      | Neuroimaging analysis        | 5.0.9+  | https://fsl.fmrib.ox.ac.uk/     |
| ANTs     | Image warp registration      | 2.1.0+  | https://github.com/stnava/ANTs/ |
| CIT168   | Templates and atlas          | 1.0.0 ? | https://identifiers.org/neurovault.collection:3145 |
 

