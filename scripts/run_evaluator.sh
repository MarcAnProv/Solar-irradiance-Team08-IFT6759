date
source /project/cq-training-1/project1/teams/team08/server_env/bin/activate
date
echo ~~~~~~~~~~~evaluating now
python ../code/evaluator.py ../log/output.txt ../val_cfg_local.json -u="../code/eval_user_cfg_cnn.json" -s="../log/output_stats.txt"