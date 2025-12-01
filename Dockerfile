# Base image will be set dynamically in the GitHub workflow
ARG BASE_IMAGE=release-v5.5
FROM espressif/idf:${BASE_IMAGE}

LABEL org.opencontainers.image.source=https://github.com/lptr/esp-idf-clang-docker

RUN $IDF_PATH/tools/idf_tools.py install esp-clang && \
    $IDF_PATH/tools/idf_tools.py install-python-env

RUN apt update -y && apt upgrade -y && apt install gcovr clang-tidy-19 cmake -y
RUN apt install g++-14 gcc-14 -y 

# Install alternatives for G++
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-14 14
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-13 13

# Install alternatives for Gcc
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-14 14
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-13 13

#RUN useradd -m -s /bin/bash cicd
RUN groupadd -g 111 cicd && \
    useradd -m -u 111 -g cicd cicd
USER cicd
WORKDIR /home/cicd
#RUN chown -R cicd:cicd /home/cicd

WORKDIR /project
#RUN chown -R cicd:cicd /project

#USER cicd
ENV HOME=/home/cicd

