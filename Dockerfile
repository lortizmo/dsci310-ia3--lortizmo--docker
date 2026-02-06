FROM rocker/rstudio:4.5.2

# install renv
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')"

# set working directory
WORKDIR /home/rstudio

# copy project files (including renv.lock)
COPY renv.lock .

# restore packages from renv.lock
# USER root
# RUN R -e "source('renv/activate.R'); renv::restore()"
RUN R -e "renv::restore()"
# USER rstudio
