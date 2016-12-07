# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM pyspark-notebook

MAINTAINER Jupyter Project <jupyter@googlegroups.com>

USER root

# RSpark config
ENV R_LIBS_USER $SPARK_HOME/R/lib

# R pre-requisites
# (juan.arias.freire) install PCRE2 prior to R
#    apt-get install -y --no-install-recommends \
#    fonts-dejavu \ gfortran \ gcc  \ pcre2-utils \
RUN apt-get update && apt install -y apt-transport-https

# This is for ubuntu:
#RUN KEYSERVER=keyserver.ubuntu.com && KEY=E084DAB9 && DISTRO=ubuntu && CODENAME=xenial && \
RUN KEYSERVER=keyserver.ubuntu.com && KEY=381BA480 && DISTRO=debian && CODENAME=jessie-cran3 && \
    apt-key adv --keyserver ${KEYSERVER} --recv-keys ${KEY} && \
    echo "deb https://ftp.cixug.es/CRAN/bin/linux/${DISTRO} ${CODENAME}/" >> /etc/apt/sources.list && \
    apt-get update -y

# No longer applies: Pin r-base to a specific build number for https://github.com/jupyter/docker-stacks/issues/210#issuecomment-246081809
# FIX for libiconv.so.2 library link, needed for RCurl
RUN apt-get install -y  r-base r-base-dev  \
      libssl-dev libssh2-1-dev libcurl3-dev  \
      libiconv-hook-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    ln -s /usr/lib/libiconv_hook.so  /usr/lib/libiconv.so.2

RUN R -e 'install.packages(c("ggplot2", "RCurl", "devtools") , repos=c("https://ftp.cixug.es/CRAN/"))'
RUN R -e 'devtools::install_github("IRkernel/IRkernel")'

USER $NB_USER

# R kernel for jupyter, installed in user's home (if installed as root, $HOME/.local becomes unwritable)
RUN R -e 'IRkernel::installspec()'

# Apache Toree kernel
RUN pip --no-cache-dir install toree
RUN jupyter toree install --user
