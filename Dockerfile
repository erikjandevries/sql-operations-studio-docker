FROM ubuntu:16.04

MAINTAINER Erik Jan de Vries (github.com/erikjandevries)

# Install Intel driver i915 and wget
RUN apt-get update && \
    apt-get install -y \
        libgl1-mesa-glx \
        libgl1-mesa-dri \
        wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN apt-get update && \
#    apt-get install -y \
#        htop \
#        tmux && \
#    apt-get clean && \
#    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN apt-get update && \
    apt-get install -y \
        libxss1 \
        libgconf-2-4 \
        libunwind8 \
        libnotify4 \
        libnss3 \
        libxkbfile1 \
        libsecret-1-0 \
        libgtk2.0 \
        libasound2 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#RUN wget -q -O sqlops-linux.deb https://sqlopsbuilds.blob.core.windows.net/release/0.30.6/sqlops-linux-0.30.6.deb
RUN wget -q -O sqlops-linux.deb https://go.microsoft.com/fwlink/?linkid=875607
RUN dpkg -i ./sqlops-linux.deb

RUN apt-get update && \
    apt-get install -y \
        git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create non privileged user
RUN useradd -ms /bin/bash johndoe
WORKDIR /home/johndoe
COPY ./scripts/run_and_monitor.sh .

RUN chown johndoe:johndoe ./run_and_monitor.sh

# Run SQL Operations Studio as non privileged user
USER johndoe

#ENTRYPOINT sqlops
ENTRYPOINT ./run_and_monitor.sh
