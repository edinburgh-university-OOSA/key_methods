BEGIN{
  maxY=a*max^2+b*max+c;
  minY=0.0;

  for(i=0;i<n;i++){
    x=rand()*(max-min)+min
    noise=(rand()-0.5)*(maxY-minY)/6.0;
    y=a*x^2+b*x+c+noise;
    print x,y;
  }
}

