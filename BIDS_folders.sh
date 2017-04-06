#!/bin/bash
#Initializing a BIDS Folder Structure for further analyses

echo
echo -n "Enter the name of the folder and press [ENTER]: "
read foldername

echo
echo -n "Enter the number of sessions and press [ENTER]: "
read sessions

echo
echo -n "Enter the number of subjects and press [ENTER]: "
read subs

echo "Renaming files according to BIDS Reference for Project $foldername with $subs Subjects and $sessions Sessions"

mkdir $foldername
cd $foldername

f_subj=1
s_subj=9
l_subj=$subs

f_sess=1
s_sess=9
l_sess=$sessions


for i in $(eval echo "{$f_subj..$l_subj}")
do
  if [ $i -le $s_subj ]; then
    for j in $(eval echo "{$f_sess..$l_sess}")
    do
      if [ $j -le $s_sess ]; then
        mkdir -p sub-0${i}/ses-0$j/{anat,dwi,func}
      else
        mkdir -p sub-0${i}/ses-$j/{anat,dwi,func}
      fi
    done
  else
    for j in $(eval echo "{$f_sess..$l_sess}")
    do
      if [ $j -le $s_sess ]; then
        mkdir -p sub-${i}/ses-0$j/{anat,dwi,func}
      else
        mkdir -p sub-${i}/ses-$j/{anat,dwi,func}
      fi
    done  
  fi
done
