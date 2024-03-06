#!/bin/csh -f

set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"

set m=1
set cList="250 255 260 265 270 290 300 350 400 500 1000"
set outRoot="log"
set rmse=10
set numb=40


foreach c ( $cList )
  set output="$outRoot.c.$c.png"
  python3 makeData.py --form log --m $m --c $c --output $output --rmse $rmse --numb $numb
end

