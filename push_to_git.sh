#!/bin/bash
while IFS='' read -r line;
do
    IFS=' ' read -a array <<< $line
    path=$(dirname ${array[1]})
    mkdir -p $path
    eval "cp ${array[0]} ${array[1]}"
done < "./file.list"

git add .
git commit -m "backup"
git push

