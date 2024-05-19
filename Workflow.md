Workflow
========

## 1. Run RStudio in a Docker container

```bash
docker pull rocker/rstudio
docker run -d -p 8787:8787 -e PASSWORD=pass -v $(pwd):/home/rstudio/flounder rocker/rstudio
```
Istall any required packages using the following command:

```bash
docker exec <container-id> R -e "install.packages('<package-name>')"
```
Where `<package-name>` is the name of the package you want to install and `<container-id>` is the id of the container. The container id can be found by running `docker ps`.

For example to install packages "ggplot2", "MASS", "mgcv", "rmarkdown", "tinytex" I would run the following commands:

```bash
docker exec $(docker ps -q) R -e 'install.packages(c("ggplot2", "MASS", "rmarkdown", "tinytex", "reshape2", "glmmTMB", "DHARMa"))'
```
Where `docker ps -q` is the container id.

RStudio can be accessed at `http://localhost:8787`
User name is `rstudio` and password is `pass`

## 2. Develop in RStudio
## 3. Containerise the code

Notice that ```docker exec``` is used to install packages in the container. This is not a good practice, as all packages will be lost when the container is stopped and removed. Instead, we should create a Dockerfile and build an image with all the required packages. 
