#!/bin/bash

if [ ! -d ./logs ]; then
    mkdir ./logs
fi

while read line; do
    #file1=$(echo $line | cut -d ',' -f1)
    #file2=$(echo $line | cut -d ',' -f2)
    #name=$(echo $line | cut -d ',' -f3)
    #WL=$(echo $line | cut -d ',' -f4)
    cmd="sbatch scripts/DeeptoolsBamCov.sbatch $line"
    echo $cmd
    $cmd
done < $1
