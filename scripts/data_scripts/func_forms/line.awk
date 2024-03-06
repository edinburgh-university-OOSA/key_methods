BEGIN{
  maxY=max*m+c;
  minY=min*x+c;

  for(i=0;i<n;i++){
    x=rand()*(max-min)+min
    noise=(rand()-0.5)*(maxY-minY)/6.0;
    y=m*x+c+noise
    print x,y;
  }
}

