
import numpy as np
import matplotlib.pyplot as plt


if __name__=="__main__" :
  inName='oints.m.0.02.txt'
  outName='logTrans.png'

  # read data
  x,y=np.loadtxt(inName,unpack=True,usecols=(0,1))

  # log transform x
  temp=np.log(y)
  y=temp

  # plot it
  plt.plot(x,y,'.')
  plt.xlabel("Mean canopy height (m)")
  plt.ylabel("Log( Biomass density (Mg/ha) )")
  plt.savefig(outName)
  plt.close()
  plt.clf()

  print("Drawn to",outName)

