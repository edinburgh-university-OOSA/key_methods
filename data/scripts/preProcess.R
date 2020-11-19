


# load packages
library(rgdal)
library(sp)
library(raster)


# list files
inDir="/geos/netdata/prac_geochem/week8/DTM_raw"

fileList=list.files(path=inDir, pattern = "*.tif")


for(filename in fileList){
  wholeName=paste(inDir,filename,sep='/')

  # read data
  data <- raster(wholeName)

  # coarsen the resolution to get MCH
  endRes=10  # 10 m resolutio
  coarseFact=round(endRes/res(data)[1])
  coarseData <- aggregate(data, fact=coarseFact)

  # write to a new geotiff
  outName=paste('Coarsen',filename,sep=".")
  writeRaster(coarseData,outName, format="GTiff",overwrite=TRUE)
  print(outName)
}


