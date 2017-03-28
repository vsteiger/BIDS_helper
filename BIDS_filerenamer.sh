#!/bin/bash
#Setting up a BIDS Folder Structure

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


for i in $(eval echo "{$f_subj..$l_subj}")
do
  if [ $i -le $s_subj ]; then
    for j in $(eval echo "{$f_sess..$l_sess}")
    do
      if [ $j -le $s_sess ]; then
        mv sub-0${i}/ses-0${j}/anat/*.nii.gz sub-0${i}/ses-0${j}/anat/sub-0${i}_ses-0${j}_T1w.nii.gz
        mv sub-0${i}/ses-0${j}/dwi/*.nii.gz sub-0${i}/ses-0${j}/dwi/sub-0${i}_ses-0${j}_dwi.nii.gz
        mv sub-0${i}/ses-0${j}/dwi/*.bval sub-0${i}/ses-0${j}/dwi/sub-0${i}_ses-0${j}_dwi.bval
        mv sub-0${i}/ses-0${j}/dwi/*.bvec sub-0${i}/ses-0${j}/dwi/sub-0${i}_ses-0${j}_dwi.bvec
        mv sub-0${i}/ses-0${j}/func/*.nii.gz sub-0${i}/ses-0${j}/func/sub-0${i}_ses-0${j}_task-rest_bold.nii.gz
      else
        mv sub-0${i}/ses-${j}/anat/*.nii.gz sub-0${i}/ses-${j}/anat/sub-0${i}_ses-${j}_T1w.nii.gz
        mv sub-0${i}/ses-${j}/dwi/*.nii.gz sub-0${i}/ses-${j}/dwi/sub-0${i}_ses-${j}_dwi.nii.gz
        mv sub-0${i}/ses-${j}/dwi/*.bval sub-0${i}/ses-${j}/dwi/sub-0${i}_ses-${j}_dwi.bval
        mv sub-0${i}/ses-${j}/dwi/*.bvec sub-0${i}/ses-${j}/dwi/sub-0${i}_ses-${j}_dwi.bvec
        mv sub-0${i}/ses-${j}/func/*.nii.gz sub-0${i}/ses-${j}/func/sub-0${i}_ses-${j}_task-rest_bold.nii.gz
      fi
    done
  else
    for j in $(eval echo "{$f_sess..$l_sess}")
    do
      if [ $j -le $s_sess ]; then
        mv sub-${i}/ses-0${j}/anat/*.nii.gz sub-${i}/ses-0${j}/anat/sub-${i}_ses-0${j}_T1w.nii.gz
        mv sub-${i}/ses-0${j}/dwi/*.nii.gz sub-${i}/ses-0${j}/dwi/sub-${i}_ses-0${j}_dwi.nii.gz
        mv sub-${i}/ses-0${j}/dwi/*.bval sub-${i}/ses-0${j}/dwi/sub-${i}_ses-0${j}_dwi.bval
        mv sub-${i}/ses-0${j}/dwi/*.bvec sub-${i}/ses-0${j}/dwi/sub-${i}_ses-0${j}_dwi.bvec
        mv sub-${i}/ses-0${j}/func/*.nii.gz sub-${i}/ses-0${j}/func/sub-${i}_ses-0${j}_task-rest_bold.nii.gz
      else
        mv sub-${i}/ses-${j}/anat/*.nii.gz sub-${i}/ses-${j}/anat/sub-${i}_ses-${j}_T1w.nii.gz
        mv sub-${i}/ses-${j}/dwi/*.nii.gz sub-${i}/ses-${j}/dwi/sub-${i}_ses-${j}_dwi.nii.gz
        mv sub-${i}/ses-${j}/dwi/*.bval sub-${i}/ses-${j}/dwi/sub-${i}_ses-${j}_dwi.bval
        mv sub-${i}/ses-${j}/dwi/*.bvec sub-${i}/ses-${j}/dwi/sub-${i}_ses-${j}_dwi.bvec
        mv sub-${i}/ses-${j}/func/*.nii.gz sub-${i}/ses-${j}/func/sub-${i}_ses-${j}_task-rest_bold.nii.gz
      fi
    done
  fi
done
