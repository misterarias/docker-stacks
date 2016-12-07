FROM all-spark-notebook

USER root

RUN R -e 'install.packages(c("rjson", "tm", "wordcloud", "SnowballC",   "plyr", "dplyr", "tidyr", "shiny", "rmarkdown", "forecast", "stringr", "RSQLite", "reshape2", "nycflights13", "caret", "randomForest") , repos=c("https://ftp.cixug.es/CRAN/"))'

USER $NB_USER

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip2 install -r requirements.txt
