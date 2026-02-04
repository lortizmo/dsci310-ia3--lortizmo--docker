FROM rocker/rstudio:4.4.2

RUN R -e "install.packages('cowplot', repos='https://cloud.r-project.org')"
