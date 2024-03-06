#!/bin/csh -f

set bin="$HOME/teaching/environmental_geography/2019/pandemic_week/scripts/allom"
set output="allom.dat"


gawk -f $bin/allom.awk > $output

# plot it
set plotFile="/tmp/plotAllom.$$.gnuplot"
sed -e s%filename%$output:r% -e s%input%$output% < $bin/plotAllom.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"

