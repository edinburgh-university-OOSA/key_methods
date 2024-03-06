BEGIN{
  meanX=meanY=0.0;
  numb=0;
}

{
  x[numb]=$1;
  y[numb]=$2;

  meanX+=x[numb];
  meanY+=y[numb];

  numb++;
}

END{
  meanX/=numb;
  meanY/=numb;

  p1=0.0;
  p2=0.0;
  p3=0.0;

  for(i=0;i<numb;i++){
    p1+=(x[i]-meanX)*(y[i]-meanY);
    p2+=(x[i]-meanX)^2;
    p3+=(y[i]-meanY)^2;
  }

  correl=p1/(sqrt(p2)*sqrt(p3));

  print correl;
}

