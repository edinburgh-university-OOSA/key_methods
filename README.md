# Key Meithods

Code for Key Methods course. This is currently for week 10's session using python to process lidar data to make a biomass map.



## Pre-process data

There is insufficient space on Noteable to store the full-res geotiffs. So we shapp coarsen them to 10 m resolution first. The mean elevation for the DTM and the maximum elevation for the DSM. This uses an Rscript:

    Rscript /home/shancoc2/teaching/key_methods/2020-21/week10/code/data/scripts/preProcess.R
    /home/shancoc2/teaching/key_methods/2020-21/week10/code/data/scripts/rename.csh

