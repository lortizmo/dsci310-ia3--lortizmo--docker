FROM rocker/rstudio:4.4.2

# install renv
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')"

# set working directory
WORKDIR /home/rstudio/project

# copy project files (including renv.lock)
COPY . .

# restore packages from renv.lock
USER root
RUN R -e "renv::restore()"
USER rstudio
