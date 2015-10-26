FROM andrewosh/binder-base

MAINTAINER Julien Roussel <julien.roussel@gmail.com>

USER root

# Add dependency
RUN apt-get update
RUN apt-get install -y git r-base r-base-core r-base-dev

USER main

# Install R kernel
ADD install-packages.R install-packages.R
RUN R CMD BATCH install-packages.R