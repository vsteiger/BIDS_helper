#!/bin/bash
#Setting up a BIDS Folder Structure

echo
echo -n "Enter the name of the folder and press [ENTER]: "
read foldername

echo
echo -n "Enter the number of subjects and press [ENTER]: "
read subs

echo "Renaming files according to BIDS Reference for Project $foldername "

cd $foldername

f_subj=1
s_subj=9
l_subj=$subs

for i in $(eval echo "{$f_subj..$l_subj}")
do
  if [ $i -le $s_subj ]; then
    mv sub-0${i}/anat/*.nii.gz sub-0${i}/anat/sub-0${i}_T1w.nii.gz
    mv sub-0${i}/dwi/*.nii.gz sub-0${i}/dwi/sub-0${i}_dwi.nii.gz
    mv sub-0${i}/dwi/*.bval sub-0${i}/dwi/sub-0${i}_dwi.bval
    mv sub-0${i}/dwi/*.bvec sub-0${i}/dwi/sub-0${i}dwi.bvec
    mv sub-0${i}/func/*.nii.gz sub-0${i}/func/sub-0${i}_task-rest_bold.nii.gz
  else
    mv sub-${i}/anat/*.nii.gz sub-${i}/anat/sub-${i}_T1w.nii.gz
    mv sub-${i}/dwi/*.nii.gz sub-${i}/dwi/sub-${i}_dwi.nii.gz
    mv sub-${i}/dwi/*.bval sub-${i}/dwi/sub-${i}_dwi.bval
    mv sub-${i}/dwi/*.bvec sub-${i}/dwi/sub-${i}dwi.bvec
    mv sub-${i}/func/*.nii.gz sub-${i}/func/sub-${i}_task-rest_bold.nii.gz
  fi
done
