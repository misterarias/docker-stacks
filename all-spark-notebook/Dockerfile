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
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9 && \
    echo 'deb https://ftp.cixug.es/CRAN/bin/linux/ubuntu xenial/' >> /etc/apt/sources.list
RUN apt-get update -y && \
    apt-get install -y  r-base r-base-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# R packages
# Pin r-base to a specific build number for https://github.com/jupyter/docker-stacks/issues/210#issuecomment-246081809
#    'r-irkernel=0.7*' \
RUN R -e 'install.packages(c("rjson", "tm", "wordcloud", "SnowballC", "ggplot2", "rcurl", "irkernel2"), repos=c("https://ftp.cixug.es/CRAN/"))'
#RUN conda config --add channels r && \
#    conda install  --yes --no-update-deps \
#    'r-ggplot2=2.1*' \
#    'r-tm' \
#    'r-rcurl=1.95*' && conda clean -tipsy

USER $NB_USER
WORKDIR $HOME


# Apache Toree kernel
RUN pip --no-cache-dir install --upgrade pip toree==0.1.0.dev7
RUN jupyter toree install --user
