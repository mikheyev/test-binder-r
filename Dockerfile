FROM andrewosh/binder-base

MAINTAINER Julien Roussel <julien.roussel@gmail.com>

USER root

RUN apt-get update
RUN apt-get install -y locales

## Configure default locale
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
      && locale-gen en_US.utf8 \
      && /usr/sbin/update-locale LANG=en_US.UTF-8

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8

# Add dependency
RUN apt-get install -y less vim git r-base r-base-core r-base-dev r-recommended r-cran-ggplot2 libzmq3-dev

# Set default CRAN repo
RUN echo 'options("repos"="http://cran.rstudio.com")' >> /usr/lib/R/etc/Rprofile.site

# Install IRkernel
RUN Rscript -e "install.packages(c('rzmq','repr','IRkernel','IRdisplay'), repos = c('http://irkernel.github.io/', getOption('repos')))" -e "IRkernel::installspec()"
