#!/bin/bash
RUN_ALL=""
for nb in $(echo base-notebook minimal-notebook scipy-notebook pyspark-notebook all-spark-notebook my-custom-notebook) ; do
  [ -z "$RUN_ALL" ] && printf "\nBuilding: %s, proceed?? [(y)es / (n)o / (a)ll / (q)uit]\n" "${nb}" && read "key" 2>&1 >/dev/null
  case "$key" in
    [aA]  ) RUN_ALL="yes" ;;
    [nN]  ) continue ;;
    [qQ]  ) exit -1 ;;
    *  ) ;;
  esac
  docker build -t "$nb" "${nb}/" || exit 1
done
