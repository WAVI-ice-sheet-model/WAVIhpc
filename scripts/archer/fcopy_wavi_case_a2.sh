#! /bin/bash
# make a new case by copying an old case on ARCHER2
# (without copying results files or unnecessary binaries)
#
# e.g. copy_wavi_case_a2.sh MISMIP_032 MISMIP_033

WC=$PWD

mkdir $WC/$2
mkdir $WC/$2/run
mkdir $WC/$2/scripts

cp -ri $WC/$1/code $WC/$2
cp -ri $WC/$1/input $WC/$2
cp -i $WC/$1/scripts/*.sh $WC/$2/scripts/.

# Changes the JOBNO in sub*.sh scripts if the two JOBIDS
# contain an '_'
cd $WC/$2/scripts

var1u=`echo $1 | grep -b -o '_' | awk 'BEGIN {FS=":"}{print $1}'`
var1u=`expr $var1u+1`

var2u=`echo $2 | grep -b -o '_' | awk 'BEGIN {FS=":"}{print $1}'`
var2u=`expr $var2u+1`

IDstring="JOBNO="

var1old=$IDstring${1:$var1u}
var2new=$IDstring${2:$var2u}

perl -pi -e "s/$var1old/$var2new/g" sub*.sh
perl -pi -e "s/$var1old/$var2new/g" rsync*.sh

