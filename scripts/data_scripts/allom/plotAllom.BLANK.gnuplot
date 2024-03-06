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
set xlabel "DBH (cm)"
set ylabel "Biomass (kg)"
unset key

set output "filename.png"

set arrow from 10,0 to 10,6000 dt 1 lt -1 nohead

plot 'input'u 1:2w l lw 2

#!convert -rotate 90 noiseBias.eps noiseBias.gif

