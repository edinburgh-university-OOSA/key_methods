#!/bin/csh -f

set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"

set mList="0.02 0.01 0.04"
set outRoot="exp"
set rmse=10
set numb=40


foreach m ( $mList )
  set output="$outRoot.m.$m.png"
  python3 makeData.py --form exp --m $m --c 25 --output $output --rmse $rmse --numb $numb
end

