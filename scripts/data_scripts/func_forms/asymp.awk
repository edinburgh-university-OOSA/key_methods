BEGIN{
  maxY=1-exp(max*k);


  for(i=0;i<n;i++){
    x=rand()*(max-min)+min
    noise=(rand()-0.5)*maxY/20.0;
    y=1.0-exp(k*x)+noise
    print x,y;
  }
}

