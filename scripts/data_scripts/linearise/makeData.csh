#!/bin/csh -f

set bin="$HOME/teaching/environmental_geography/2019/pandemic_week/env_geog/data_scripts/linearise"
set outRoot="linearise"

set minB=0
set maxB=400
@ numb=37


# logarithmic, low noise
set output="$outRoot.1.txt"
set nScale=20
set k=0.1

gawk -f $bin/log.awk -v min=$minB -v max=$maxB -v k=$k -v n=$numb -v nScale=$nScale > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


# logarithmic, high noise
set output="$outRoot.2.txt"
set nScale=5
set k=0.025

gawk -f $bin/log.awk -v min=$minB -v max=$maxB -v k=$k -v n=$numb -v nScale=$nScale > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


# exponential, low noise
set output="$outRoot.3.txt"
set k=0.01
set nScale=20

gawk -f $bin/exp.awk -v min=$minB -v max=$maxB -v k=$k -v n=$numb -v nScale=$nScale > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


# exponential, high noise
set output="$outRoot.4.txt"
set k=0.02
set nScale=10

gawk -f $bin/exp.awk -v min=$minB -v max=$maxB -v k=$k -v n=$numb -v nScale=$nScale > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"

