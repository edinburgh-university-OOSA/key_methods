#!/bin/csh -f

set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"

set m="0.02"
set outRoot="points"
set rmse=10
set numb=40


set output="$outRoot.m.$m.png"
python3 makeData.py --form exp --m $m --c 25 --output $output --rmse $rmse --numb $numb --writePoints

