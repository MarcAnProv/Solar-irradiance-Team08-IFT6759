#!/bin/bash
#SBATCH --time=360:00
#SBATCH --gres=gpu:k80:1
#SBATCH --cpus-per-task=1
#SBATCH --mem=10000M
#SBATCH --reservation=IFT6759_2020-02-26

# date
# echo ~~~~~~~~~~~~removing tmp files...
# rm -rf $SLURM_TMPDIR/*
# date
# echo ~~~~~~~~~~~~copying train files...
# mkdir $SLURM_TMPDIR/train_crops/
# cp ../../data/train_crops_seq_3/batch_[567890]* $SLURM_TMPDIR/train_crops/
# date
# echo ~~~~~~~~~~~~copying val files...
# mkdir $SLURM_TMPDIR/val_crops/
# cp ../../data/val_crops_seq_3/batch_[234567890]* $SLURM_TMPDIR/val_crops/
date
echo ~~~~~~~~~~~~setting up environement
module load python/3.7
virtualenv --no-download ../my_env
source ../my_env/bin/activate
pip install --no-index -r ../requirements.txt

date
echo ~~~~~~~~~~~~starting evaluation loop
python ../code/evaluator.py ../log/output.txt ../val_cfg_local.json -u="../code/eval_user_cfg_cnn.json" -s="../log/output_stats.txt"

# date
# echo starting evaluator
# ./run_evaluator.sh

date
echo ~~~~~~~~~~~~finished
