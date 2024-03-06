

import numpy as np
import matplotlib.pyplot as plt



if __name__ == "__main__":

  inName='extentExamp.rmse.50.txt'
  outName="extentExample.png"

  # read data
  x,y=np.loadtxt(inName,unpack=True,usecols=(0,1))

  # plot it
  plt.plot(x,y,'.')
  plt.xlabel('Mean canopy height (m)')
  plt.ylabel('Biomass density (Mg/ha)')
  plt.xlim(13,18)
  plt.savefig(outName)
  plt.close()

  print('Written to',outName)

