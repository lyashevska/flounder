Workflow
========

## Run RStudio in a Docker container
```bash
docker pull rocker/rstudio
docker run -d -p 8787:8787 -e PASSWORD=yourpasswordhere rocker/rstudio
```
## Develop in RStudio
## Containerise the code
Once ready, containerise the code and run it in a Docker container