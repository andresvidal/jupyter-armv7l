# Copyright (c) Andres Vidal.
# Distributed under the terms of the MIT License.
FROM arm32v7/python:3.8

LABEL created_by=https://github.com/andresvidal/jupyter-armv7l
ARG wheelhouse=https://github.com/andresvidal/jupyter-armv7l/raw/master/wheelhouse

# Install all OS dependencies for fully functional notebook server
# https://github.com/jupyter/docker-stacks/blob/master/minimal-notebook/Dockerfile
RUN apt-get update && apt-get install -yq --no-install-recommends \
    build-essential \
    emacs \
    git \
    inkscape \
    jed \
    libsm6 \
    libxext-dev \
    libxrender1 \
    lmodern \
    netcat \
    pandoc \
    python-dev \
    texlive-fonts-extra \
    texlive-fonts-recommended \
    texlive-plain-generic \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-xetex \
    tzdata \
    unzip \
    nano \
    wget \
    bzip2 \
    ca-certificates \
    locales \
    libblas-dev \
    liblapack-dev \
    gfortran \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

RUN pip install \
    $wheelhouse/kiwisolver-1.1.0-cp38-cp38-linux_armv7l.whl \
    $wheelhouse/matplotlib-3.1.1-cp38-cp38-linux_armv7l.whl \
    $wheelhouse/numpy-1.17.4-cp38-cp38-linux_armv7l.whl \
    $wheelhouse/scipy-1.3.2-cp38-cp38-linux_armv7l.whl \
    $wheelhouse/pandas-0.25.3-cp38-cp38-linux_armv7l.whl \
    $wheelhouse/pyzmq-18.1.1-cp38-cp38-linux_armv7l.whl \
    --upgrade jupyter

RUN jupyter notebook --generate-config

WORKDIR /notebooks
ENTRYPOINT ["jupyter", "notebook", "--ip=*", "--allow-root", "--no-browser"]
