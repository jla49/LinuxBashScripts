#!/bin/bash

# This checks if the number of arguments is correct
if [[ $# != 2 ]]
then
 echo "backup.sh target_directory_name destination_directory_name"
 exit
fi

# This checks if argument 1 and argument 2 are valid directory paths
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
 echo "Invalid directory path provided"
 exit
fi

# TASK 1
targetDirectory=$1
destinationDirectory=$2

echo $targetDirectory
echo $destinationDirectory

currentTS=$(date +%s)
echo $currentTS

backupFileName="backup-$currentTS.tar.gz"

echo $backupFileName

# TASK 5
origAbsPath=`pwd`

# TASK 6
cd $destinationDirectory
destinationDirectory=`pwd`

# TASK 7
cd $origAbsPath
cd $targetDirectory

echo `pwd`

# TASK 8
yesterdayTS=$(($currentTS - 24 * 60 * 60))

echo $yesterdayTS

declare -a toBackup

# TASK 9
for file in $(ls)
do
 #TASK 10
 if [[ $`date -r $file +%s` > $yesterdayTS ]]
 then
  toBackup+=$file
 fi
done

tar -czvf $backupFileName ${toBackup[@]}

mv $backupFileName $destAbsPath
