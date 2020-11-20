#!bin.csh -f

set fileList=`ls coarsen*_1M_DTM_PHASE1.tif`

foreach file( $fileList )
  set newName=`echo $file|sed -e s%"_1M_DTM"%"_10M_DTM"%`

  mv $file $newName
  echo "$newName"
end

