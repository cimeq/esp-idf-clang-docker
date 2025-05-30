# Base image will be set dynamically in the GitHub workflow
ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN idf_tools.py install esp-clang && \
    idf_tools.py install-python-env
