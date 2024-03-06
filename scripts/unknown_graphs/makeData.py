

'''
Script to make some sample
data and plots for week 2
'''


#########################################

import numpy as np
import argparse
import matplotlib.pyplot as plt


#########################################

def readCommands():
  '''
  Get commandline arguments
  '''
  p = argparse.ArgumentParser(description=("An illustration of a command line parser"))
  p.add_argument("--output",dest="outName",type=str,default='test.png',help=("Output filename\nDefault=test.png"))
  p.add_argument("--numb", dest ="numb", type=int, default=20, help=("Number of points\nDefault = 20"))
  p.add_argument("--minB", dest ="minB", type=float, default=0, help=("Min biomass in Mg/ha\nDefault = 0 Mg/ha"))
  p.add_argument("--maxB", dest ="maxB", type=float, default=250, help=("Max biomass in Mg/ha\nDefault = 250 Mg/ha"))
  p.add_argument("--bias", dest ="bias", type=float, default=0, help=("Bias in Mg/ha\nDefault = 0 Mg/ha"))
  p.add_argument("--rmse", dest ="rmse", type=float, default=0, help=("RMSE in Mg/ha\nDefault = 250 Mg/ha"))
  p.add_argument("--m", dest ="m", type=float, default=1/0.12, help=("Line gradient"))
  p.add_argument("--c", dest ="c", type=float, default=0, help=("Line y interept"))
  p.add_argument("--form", dest ="form", type=str, default="line", help=("Format of line. Line, exg or log"))
  p.add_argument("--writePoints",dest="writePoints", action='store_true', default=False, help=("Write points to a file"))
  p.add_argument("--drawOneLine",dest="drawOneLine", action='store_true', default=False, help=("Draw a one to one lone"))
  p.add_argument("--noGraph",dest="drawGraph", action='store_false', default=True, help=("Do not draw a graph"))

  cmdargs = p.parse_args()
  return cmdargs


class fakeData():
  '''Class to hold data to demonstrate correlation'''

  def __init__(self,numb,minB,maxB,m,c,bias,rmse,form="line"):
    '''Class initialiser'''

    self.n=numb

    # y is biomass
    y=np.random.uniform(low=minB,high=maxB,size=self.n)
    rmseArr=np.random.normal(loc=bias,scale=rmse,size=self.n)

    # x is MCH
    if(form=="line"):
      x=(y+rmseArr-c)/m
    elif(form=="exp"):
      x=c*(1-np.exp(-m*(y+rmseArr-bias)))
    elif(form=="log"):
      x=(-1.0/m)*np.log(1-(y+rmseArr-bias)/c)  # c is amplitude. m is gradient
      x=x*25/np.max(x) # scale between 0 and 25 

    # delete negative number
    self.x=x[(y>=0.0)&(x>=0.0)]
    self.y=y[(y>=0.0)&(x>=0.0)]

    return


  #############################

  def plotPoints(self,outName,drawOneLine=False):
    '''Plot points'''

    plt.plot(self.x,self.y,'.')
    plt.xlim([0,None])
    plt.ylim([0,None])
    plt.ylabel("Biomass density (Mg/ha)")
    plt.xlabel("Mean canopy height (m)")

    if(drawOneLine): # add a 1-1 line
      if(np.max(self.y)<np.max(self.x)):
        maxVal=np.max(self.y)
      else:
        maxVal=np.max(self.x)
      plt.plot([0,maxVal],[0,maxVal])

    plt.savefig(outName)
    plt.close()
    print("Graph to",outName)

    return


  #############################

  def writePoints(self,outRoot):
    '''Write points to a file'''
    outNamen=outRoot.strip('.png')+".csv"

    f=open(outNamen,'w')
    line="CHM,AGBD\n"
    f.write(line)
    for i in range(0,self.x.shape[0]):
      line=str(self.x[i])+","+str(self.y[i])+"\n"
      f.write(line)

    f.close()
    print("Written to",outNamen)
    return


#########################################

if __name__ == '__main__':
  '''Main block'''

  # read command line
  cmd=readCommands()

  # generate data
  d=fakeData(cmd.numb,cmd.minB,cmd.maxB,cmd.m,cmd.c,cmd.bias,cmd.rmse,form=cmd.form)

  # plot it
  if(cmd.drawGraph):
    d.plotPoints(cmd.outName,drawOneLine=cmd.drawOneLine)

  # write points
  if(cmd.writePoints):

    d.writePoints(cmd.outName)

#########################################

