FROM rocker/r-ver:3.6.1
LABEL maintainer="Manu"
RUN export DEBIAN_FRONTEND=noninteractive; apt-get -y update \
  && apt-get install -y libcurl4-openssl-dev \
	libssl-dev \
	make
RUN ["install2.r", "askpass", "assertthat", "codetools", "curl", "digest", "fs", "future", "gargle", "globals", "glue", "googleAuthR", "googleCloudStorageR", "googleComputeEngineR", "httr", "jsonlite", "listenv", "memoise", "mime", "openssl", "R6", "Rcpp", "rlang", "yaml", "zip"]
WORKDIR /payload/
COPY ["./", "./"]
CMD ["R", "--vanilla", "-f", "schedule.R"]
