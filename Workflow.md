Workflow
========

## Run RStudio in a Docker container

```bash
docker pull rocker/rstudio
docker run -d -p 8787:8787 -e PASSWORD=pass -v $(pwd):/home/rstudio/flounder rocker/rstudio
```
User name is `rstudio` and password is `pass`

RStudio can be accessed at `http://localhost:8787`

## Develop in RStudio
## Containerise the code
Once ready, containerise the code and run it in a Docker container