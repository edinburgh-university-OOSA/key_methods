BEGIN{
  offset=-800;

  maxY=a*(k*max+offset)^3+b*(k*max+offset)^2+c*(k*max+offset)+d;
  minY=0.0;

  for(i=0;i<n;i++){
    x=rand()*(max-min)+min
    noise=50000000.0*(rand()-0.5);
    y=a*(k*x+offset)^3+b*(k*x+offset)^2+c*(k*x+offset)+d+noise;
    print x,y;
  }
}

