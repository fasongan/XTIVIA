#!/bin/bash

threshold=$1
source_s3=$2
dest_s3=$3

AWS_ID=
AWS_key=

#list files in s3 bucket
aws s3 ls $source_s3 --recursive --human-readable --summarize >> source_files

for file in $(cat source_files) ;
do  
size=`cat file | awk -F " " '{ print $3 }'`
if [ $threshold -gt 0 ] ; then

path=`cat file | awk -F " " '{ print $5 }'`
#copy the files to destination s3 bucket
aws s3 cp $source_s3/$path $dest_s3

fi

