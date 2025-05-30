# Base image will be set dynamically in the GitHub workflow
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN $IDF_PATH/tools/idf_tools.py install esp-clang && \
    $IDF_PATH/tools/idf_tools.py install-python-env
