#!/bin/csh -f

set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"

set outRoot="extentExamp"
set rmseList="50"
set numb=80


foreach rmse( $rmseList )
  set output="$outRoot.rmse.$rmse.png"

  python3 $bin/makeData.py --numb $numb --rmse $rmse --output $output --writePoints
end

