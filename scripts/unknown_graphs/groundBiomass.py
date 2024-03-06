

#############################################
# import packages

import sys
sys.path.append("/home/shancoc2/src/env_geog/prep_data/week1")
sys.path.append("/home/shancoc2/src/OOSA-code-public/week5/rasters")
from makeGround import *
from readTiff import tiffHandle
from pyproj import Proj, transform


#############################################

if __name__ == "__main__":
  def readCommands():
    '''
    Get commandline arguments
    '''
    p = argparse.ArgumentParser(description=("An illustration of a command line parser"))
    p.add_argument("--output",dest="outName",type=str,default='test.csv',help=("Output filename\nDefault=test.csv"))
    p.add_argument("--nPlots", dest ="nPlots", type=int, default=1, help=("Number of plots\nDefault = 1"))
    p.add_argument("--chm",dest="chmName",type=str,help=("Input CHM filename"))
    p.add_argument("--bias", dest ="bias", type=float, default=0, help=("Bias in Mg/ha\nDefault = 0 Mg/ha"))
    p.add_argument("--rmse", dest ="rmse", type=float, default=0, help=("RMSE in Mg/ha\nDefault = 0 Mg/ha"))
    p.add_argument("--minX", dest ="minX", type=float, default=-100000000,help=("Minimum x"))
    p.add_argument("--minY", dest ="minY", type=float, default=-100000000,help=("Minimum y"))
    p.add_argument("--maxX", dest ="maxX", type=float, default=100000000,help=("Maximum x"))
    p.add_argument("--maxY", dest ="maxY", type=float, default=100000000,help=("Maximum y"))
    cmdargs = p.parse_args()
    return cmdargs


#############################################

def setBiomass(chm,nPlots,bias,rmse,minX,minY,maxX,maxY):
  '''set biomass from CHM'''

  # linear biomass model
  m=1/0.12
  c=0.0

  # data pixels
  inds=np.where(chm.data<200)

  # find bounds
  maxCHM=np.max(chm.data[inds])

  # pick random heights across range
  heights=np.random.uniform(size=nPlots,low=0.0,high=maxCHM)

  # set coordinates for slciing
  allX=np.zeros((chm.nY,chm.nX),dtype=float)
  for i in range(0,chm.nX):
    allX[:,i]=chm.xOrigin+i*chm.pixelWidth

  allY=np.zeros((chm.nY,chm.nX),dtype=float)
  for j in range(0,chm.nY):
      allY[j,:]=chm.yOrigin+j*chm.pixelHeight

  # allocate array
  biomass=np.zeros(nPlots,dtype=float)
  x=np.zeros(nPlots,dtype=float)
  y=np.zeros(nPlots,dtype=float)

  # find indices closest to these
  xInds=np.empty(nPlots,dtype=int)
  yInds=np.empty(nPlots,dtype=int)
  for i in range(0,nPlots):
    # find all heights within 1 m
    possInds=np.where((np.abs(chm.data-heights[i])<=1.0)&(allX>=minX)&(allX<=maxX)&(allY>=minY)&(allY<=maxY))

    if(len(possInds[0])>1):
      ind=np.random.randint(size=1,low=0,high=len(possInds[0])-1)
      xInd=possInds[1][ind]
      yInd=possInds[0][ind]
    else:
      indsUse=np.abs(chm.data-heights[i]).argmin()
      yInd=indsUse%chm.data.shape[0]
      xInd=indsUse//chm.data.shape[0]

    biomass[i]=m*heights[i]+c
    x[i]=xInd*chm.pixelWidth+chm.xOrigin
    y[i]=yInd*chm.pixelHeight+chm.yOrigin

  # add noise
  rmseArr=np.random.normal(loc=bias,scale=rmse,size=nPlots)
  biomass=biomass+rmseArr

  return(biomass,x,y)


#############################################

def writeCoords(x,y,biomasses,outName):
  '''Write coordinates to a csv file'''

  thisName=outName.strip(".csv")+".coords.csv"

  f=open(thisName,'w')
  line="plot,lon,lat\n"
  f.write(line)

  for i in range(0,x.shape[0]):
    line=str(i+1)+","+str(x[i])+","+str(y[i])+"\n" #","+str(biomasses[i])+"\n"
    f.write(line)

  f.close()
  print("Written to",thisName)
  return


#############################################

def reprojectVect(x,y,outEPSG,inEPSG):
  '''Reproject vector data'''

  # set projections
  inProj=Proj("epsg:"+str(inEPSG))
  outProj=Proj("epsg:"+str(outEPSG))

  # reproject data
  lat,lon=transform(inProj,outProj,x,y)

  return(lon,lat)


#############################################

if __name__ == "__main__":
  '''main block'''

  # read commands
  cmd=readCommands()

  # read geotiff
  chm=tiffHandle(cmd.chmName)

  # set biomass values
  biomasses,x,y=setBiomass(chm,cmd.nPlots,cmd.bias,cmd.rmse,cmd.minX,cmd.minY,cmd.maxX,cmd.maxY)

  # scale biomass to total kg
  biomasses=biomasses*1000.0*20**2/100**2

  # reproject coordinates
  x,y=reprojectVect(x,y,4326,27700)

  # set plot data data
  data=generateData(biomasses)

  # write data
  data.writeCSV(cmd.outName)

  # write coordinates
  writeCoords(x,y,biomasses,cmd.outName)

