# Use the rocker/r-base image as the base image
FROM rocker/rocker/rstudio:latest

# Set environment variables for RStudio
ENV PASSWORD=pass
ENV USER=rstudio

RUN R -e "install.packages(c('ggplot2', 'MASS', 'rmarkdown', 'tinytex', 'reshape2', 'glmmTMB', 'DHARMa', 'emmeans'), repos='http://cran.rstudio.com/')"

# Expose the RStudio port
EXPOSE 8787

# Start RStudio server
CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize=0"]

# # Copy our R script to the container
# COPY script.R /home/r-environment/script.R

# # Run the R script
# CMD R -e "source('/home/r-environment/script.R')"