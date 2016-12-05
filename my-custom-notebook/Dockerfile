FROM all-spark-notebook

USER root

RUN apt-get update -y && \
  apt-get install -y  libssl-dev libssh2-1-dev libcurl3-dev && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN R -e 'install.packages(c("rjson", "tm", "wordcloud", "SnowballC", "ggplot2", "rcurl",  "plyr", "devtools", "dplyr", "ggplot2", "tidyr", "shiny", "rmarkdown", "forecast", "stringr", "rsqlite", "reshape2", "nycflights13", "caret", "rcurl", "randomforest") , repos=c("https://ftp.cixug.es/CRAN/"))'
RUN R -e 'devtools::install_github("IRkernel/IRkernel")' && \
   R -e 'IRkernel::installspec()'

USER $NB_USER

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip2 install -r requirements.txt
