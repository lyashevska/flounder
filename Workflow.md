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
<container-id> can be found using `docker ps` as shown below.

For example to install packages "ggplot2", "MASS", "mgcv", "rmarkdown", "tinytex" I would run the following commands:

```bash
docker exec $(docker ps | grep "rocker/rstudio" | awk '{print $1}') R -e 'install.packages(c("ggplot2", "MASS", "rmarkdown", "tinytex", "reshape2", "glmmTMB", "DHARMa", "emmeans"))'
```

### Explanation of the Command

- **`docker exec`**: This command allows you to run commands in a running container.
- **`$(docker ps | grep "rocker/rstudio" | awk '{print $1}')`**: This part dynamically retrieves the container ID of the running `rocker/rstudio` container. 
  - `docker ps`: Lists all running containers.
  - `grep "rocker/rstudio"`: Filters the list to find the specific container.
  - `awk '{print $1}'`: Extracts the first column, which is the container ID.
- **`R -e 'install.packages(...)'`**: This runs the R command to install the specified packages.


RStudio can be accessed at `http://localhost:8787`
User name is `rstudio` and password is `pass`

## 2. Develop in RStudio
## 3. Containerise the code

Notice that ```docker exec``` is used to install packages in the container. This is not a good practice, as all packages will be lost when the container is stopped and removed. Instead, we should create a Dockerfile and build an image with all the required packages. 
