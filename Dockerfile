# Base image will be set dynamically in the GitHub workflow
ARG BASE_IMAGE=latest
FROM ${BASE_IMAGE}

LABEL org.opencontainers.image.source=https://github.com/lptr/esp-idf-clang-docker

RUN $IDF_PATH/tools/idf_tools.py install esp-clang && \
    $IDF_PATH/tools/idf_tools.py install-python-env
