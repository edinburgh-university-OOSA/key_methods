BEGIN{
  b0=-1.694;
  b1=10.825;
  b2=11.816;

  res=1.0;
  dbh=0.01;
  while(dbh<=200.0){
    y=exp(b0+b1*dbh/(dbh+b2));

    print dbh,y;
    dbh+=res;
  }
}

