#!/bin/csh -f

set bin="$HOME/teaching/key_methods/key_src/scripts/data_scripts/correl"
set outRoot="correlIllus"

set nList="6 3 0.1 10 100 1 0.5 0.2 200 1000"
@ numb=40
set c=0
set m=1
set minB=0
set maxB=400


foreach nScale( $nList )
  set data="$outRoot.$nScale.dat"

  gawk -f $bin/line.awk -v min=$minB -v max=$maxB -v m=$m -v c=$c -v n=$numb -v nScale=$nScale > $data
  set correl=`gawk -f $bin/correl.awk` < $data

  set plotName="$outRoot.correl.$correl"

  set plotFile="/tmp/plotLine.$$.gnuplot"
  sed -e s%filename%$plotName% -e s%mIn%$minB%g -e s%mAx%$maxB%g -e s%input%$data% < $bin/plotLine.BLANK.gnuplot > $plotFile
  gnuplot $plotFile
  rm $plotFile

  echo "Drawn to $plotName.png correlation $correl"
end

