#!/bin/sh
### General options
### -- specify queue --
#BSUB -q gpuv100
### -- set the job Name --
#BSUB -J molgym
### -- ask for number of cores (default: 1) --
#BSUB -n 1
### -- Select the resources: 1 gpu in exclusive process mode --
#BSUB -gpu "num=1:mode=exclusive_process"
### -- specify that we need 2GB of memory per core/slot --
#BSUB -R "rusage[mem=10GB]"
### -- specify that we want the job to get killed if it exceeds 3 GB per core/slot --
#BSUB -M 10GB
### -- set walltime limit: hh:mm --
#BSUB -W 24:00
### -- set the email address --
# please uncomment the following line and put in your e-mail address,
# if you want to receive e-mail notifications on a non-default address
#BSUB -u aardu@dtu.dk
### -- send notification at start --
#BSUB -B
### -- send notification at completion --
#BSUB -N
### -- Specify the output and error file. %J is the job-id --
### -- -o and -e mean append, -oo and -eo mean overwrite --
#BSUB -o Output_%J.out
#BSUB -e Error_%J.err#
###-- end of LSF options --
source ../../venv/bin/activate

# here follow the commands you want to executemodule load cuda/10.2
### nvidia-smi
#/appl/cuda/10.2/samples/NVIDIA_CUDA-10.2_Samples/bin/x86_64/linux/release/deviceQuerymodule load python3/3.8.2
#module load matplotlib/3.2.1-python-3.7.7
#pip3 install --user wandb gym torch torch-scatter
#pip3 install --user torch
#pip3 install --user ase asap3 pandas==1.1.0
#pip3 install -e .
#cd molgym-painn/
#module load molgym
#python3 scripts/structures.py --dir=runs/internal/results --symbols=X,H,O
python3 scripts/plot.py --dir={runs/CH3NO_dna/results,runs/CH3NO_baseline/results}
#python3 scripts/structures.py --dir=runs/CH3NO_dna/results --symbols=X,C,H,N,O
