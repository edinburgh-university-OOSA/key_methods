#!/bin/csh -f

set inDir="."
set outDir="."


set list="/tmp/modisToCOnvert.$$.dat"
pushd $inDir/
ls *.hdf|gawk '{for(i=1;i<=NF;i++)printf("%s/%s\n",dir,$i)}' dir="$inDir" > $list
popd


@ nFiles=`wc -l` < $list
@ i=1

while( $i <= $nFiles )
  set input=`gawk -v i=$i '{if(i==NR)print $1}'` < $list
  set outRoot=`echo $input:r|sed -e s%$inDir%$outDir%`

  gdal_translate -sds $input $outRoot.tif

  @ i++
end


if( -e $list )rm $list

