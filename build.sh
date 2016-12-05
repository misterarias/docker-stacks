#!/bin/bash
RUN_ALL=""
for nb in $(echo base-notebook minimal-notebook scipy-notebook pyspark-notebook all-spark-notebook) ; do
  [ -z "$RUN_ALL" ] && printf "\nBuilding: %s, proceed?? [s/n/A]\n" "${nb}" && read "key"
  [ "$key" == "A" ] && RUN_ALL="yes"
  [ "$key" == "s" -o ! -z "$RUN_ALL" ] && docker build -t "$nb" "${nb}/"
done
