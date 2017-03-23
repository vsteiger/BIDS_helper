#!/bin/bash
#Setting up a BIDS Folder Structure

echo
echo -n "Enter the name of the folder and press [ENTER]: "
read foldername

echo
echo -n "Enter the number of subjects and press [ENTER]: "
read subs

echo "Building BIDS Folder structure in $foldername "

mkdir $foldername
cd $foldername

f_subj=1
s_subj=9
l_subj=$subs

for i in $(eval echo "{$f_subj..$l_subj}")
do
  if [ $i -le $s_subj ]; then
    mkdir -p sub-0${i}/{anat,dwi,func}
  else
    mkdir -p sub-${i}/{anat,dwi,func}
  fi
done
