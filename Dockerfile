# Use the rocker/r-base image as the base image
FROM rocker/r-ver

# Make a directory in the container
RUN mkdir /home/r-environment

# Install R dependencies
RUN R -e "install.packages(c('ggplot2', 'MASS', 'mgcv'))"

# # Copy our R script to the container
# COPY script.R /home/r-environment/script.R

# # Run the R script
# CMD R -e "source('/home/r-environment/script.R')"