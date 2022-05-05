#!/bin/bash
echo 'NeRF job started'
NAME=$1
EXP=$2
source /users/visics/gkouros/.bashrc
export PATH="/usr/local/cuda-11/bin:/usr/local/cuda/bin:$PATH"
export LD_LIBRARY_PATH="/usr/local/cuda-11/lib64:/usr/local/cuda/lib64:$LD_LIBRARY_PATH"
conda activate nerd
DIR=/users/visics/gkouros/projects/nerf-repos/NeRD-Neural-Reflectance-Decomposition/
cd $DIR

python3 train_nerd.py --datadir /esat/topaz/gkouros/datasets/nerf/$NAME --basedir logs/$NAME --expname $EXP --gpu 0 --config configs/nerd/real_world.txt --spherify

conda deactivate
echo 'NeRF job terminated'
