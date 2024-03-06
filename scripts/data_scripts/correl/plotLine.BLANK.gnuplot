###################
# to be run in    #
# ~/DATA6/growbag #
# 29th April 2008 #
###################

#set term postscript enhanced color "Times" 22
set term png
#set term postscript enhanced monochrome "Times" 22
#set size 0.75, 0.75
#unset key
set ylabel "Biomass (Mg/ha)"
set xlabel "Predictor variable"
unset key
unset xtics
set yrange[mIn:mAx]
set xrange[0:]

set pointsize 2
set output "filename.png"

plot 'input'u 2:1

#!convert -rotate 90 noiseBias.eps noiseBias.gif

