# Key Methods

Code for Key Methods course. This is currently for week 10's session using python to process lidar data to make a biomass map.


## Convert MODIS

MODIS comes in HDF-EOS format, which cannot easily be ready by QGIS. This can be converted to geotiff with:

    scripts/convert_modis/convertMODIS.csh



## Pre-process data

There is insufficient space on Noteable to store the full-res geotiffs. So we shapp coarsen them to 10 m resolution first. The mean elevation for the DTM and the maximum elevation for the DSM. This uses an Rscript:

In

    /geos/netdata/key_methods/week10/ALS/res3m



Move the DTMs and DSMs to a subdirectory with that name.

Run
    Rscript /home/shancoc2/teaching/key_methods/2020-21/week10/code/data/scripts/preProcess1.R
    /home/shancoc2/teaching/key_methods/2020-21/week10/code/data/scripts/rename1.csh

And then in
    /geos/netdata/key_methods/week10/ALS/res10m

Run
    Rscript /home/shancoc2/teaching/key_methods/2020-21/week10/code/data/scripts/preProcess2.R
    /home/shancoc2/teaching/key_methods/2020-21/week10/code/data/scripts/rename2.csh


## data\_scripts

This contains scripts to generate the graphs in the slides. It is taken from [environmental geography](https://github.com/edinburgh-university-OOSA/env_geog_2019).
