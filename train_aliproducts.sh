#!/usr/bin/env bash

# logging
# https://stackoverflow.com/questions/12919980/nohup-is-not-writing-log-to-output-file

# baseline/baseline++
nohup python -u ./train.py --dataset ali_products --model ResNet50 --method baseline++ --train_aug > out.log &

# meta-learning
python ./train.py --dataset ali_products --model Conv4 --method protonet --train_n_way 5 --n_shot 5 --test_n_way 5 --train_aug

# save-feature
python save_features.py --dataset ali_products --model ResNet50 --method baseline++ --train_aug

# test
python test.py --dataset ali_products --model ResNet50 --method baseline++ --train_aug