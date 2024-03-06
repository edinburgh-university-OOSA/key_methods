#!/bin/csh -f

set bin="$HOME/teaching/key_methods/key_src/scripts/data_scripts/func_forms"

set outRoot="funcForm"

set minB=0
set maxB=400
@ numb=40

# linear
set output="$outRoot.line.dat"
set c=0
set m=1

gawk -f $bin/line.awk -v min=$minB -v max=$maxB -v m=$m -v c=$c -v n=$numb > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


# linear
set output="$outRoot.nline.dat"
set c=$maxB
set m=-1

gawk -f $bin/line.awk -v min=$minB -v max=$maxB -v m=$m -v c=$c -v n=$numb > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


# linear
set output="$outRoot.noise.dat"

gawk -f $bin/noise.awk -v min=$minB -v max=$maxB -v n=$numb > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


# exponential
set output="$outRoot.exp.dat"
set k=0.01

gawk -f $bin/exp.awk -v min=$minB -v max=$maxB -v k=$k -v n=$numb > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


# logarithmic
set output="$outRoot.log.dat"
set k=0.1

gawk -f $bin/log.awk -v min=$minB -v max=$maxB -v k=$k -v n=$numb > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


# asymptotic
set output="$outRoot.asymp.dat"
set k=-0.02

gawk -f $bin/asymp.awk -v min=$minB -v max=$maxB -v k=$k -v n=$numb > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


# quadratic
set output="$outRoot.quad.dat"
set a=2
set b=0.4
set c=0

gawk -f $bin/quad.awk -v min=$minB -v max=$maxB -v a=$a -v b=$b -v c=$c -v n=$numb > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"



# cubic
set output="$outRoot.cube.dat"
set a=-0.6
set b=0.04
set c=3
set d=0
set k=4

gawk -f $bin/cube.awk -v min=$minB -v max=$maxB -v a=$a -v b=$b -v c=$c -v d=$d -v k=$k -v n=$numb > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$output% < $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"



# log transform
set output="$outRoot.logtrans.dat"
set k=0.1
set maxX=`echo $maxB|gawk '{print log($1)}'`

gawk -f $bin/logtrans.awk -v min=$minB -v max=$maxB -v k=$k -v n=$numb > $output
set plotFile="/tmp/plotLine.$$.gnuplot"
sed -e s%filename%$output:r% -e s%mIn%$minB%g -e s%mAx%$maxX%g -e s%input%$output% -e s%"Biomass"%"Log biomass"%< $bin/plotLine.BLANK.gnuplot > $plotFile
gnuplot $plotFile
rm $plotFile
echo "Drawn to $output:r.png"


