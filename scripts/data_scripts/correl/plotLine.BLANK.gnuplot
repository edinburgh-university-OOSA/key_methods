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
set xlabel "Biomass (Mg/ha)"
set ylabel "Predictor variable"
unset key
unset ytics
set xrange[mIn:mAx]

set pointsize 2
set output "filename.png"

plot 'input'u 1:2

#!convert -rotate 90 noiseBias.eps noiseBias.gif

