# Jupyter Notebook for Raspberry Pi 3 (ARMv7l) - Docker +18.06.1-ce

This builds a Docker image containing Jupyter applications and interactive computing tools based on Python 3.8 for ARMv7 architectures, like the popular RaspberryPi 3 or XU4. Some of the packages included are Pandas, Numpy, Scipy, and matplotlib. These compute intesive packages are also provided as precompiled wheels for faster building. 

## Quick Start

**Example 1:** This command pulls the andresvidal/jupyter-armv7l image from Docker Hub if it is not already present on the local host. It then starts a container running a Jupyter Notebook server and exposes the server on host port 8888. The server logs appear in the terminal. Visiting http://<hostname>:8888/?token=<token> in a browser loads the Jupyter Notebook dashboard page, where hostname is the name of the computer running docker and token is the secret token printed in the console. The container remains intact for restart after the notebook server exits.

    docker run -p 8888:8888 andresvidal/jupyter-armv7l

**Example 3:** This command pulls the andresvidal/jupyter-armv7l image from Docker Hub if it is not already present on the local host. It then starts an ephemeral container running a Jupyter Notebook server and exposes the server on host port 10000. The command mounts the current working directory on the host as /notebooks in the container. The server logs appear in the terminal. Visiting http://<hostname>:10000/?token=<token> in a browser loads Jupyter, where hostname is the name of the computer running docker and token is the secret token printed in the console. Docker destroys the container after notebook server exit, but any files written to /notebooks in the container remain intact on the host.

    docker run --rm -p 10000:8888 -v "$PWD":/notebooks andresvidal/jupyter-armv7l

## Installed Versions
Precompiled wheels for compute intense packages:

    wheelhouse/kiwisolver-1.1.0-cp38-cp38-linux_armv7l.whl
    wheelhouse/matplotlib-3.1.1-cp38-cp38-linux_armv7l.whl
    wheelhouse/numpy-1.17.4-cp38-cp38-linux_armv7l.whl
    wheelhouse/pandas-0.25.3-cp38-cp38-linux_armv7l.whl
    wheelhouse/pyzmq-18.1.1-cp38-cp38-linux_armv7l.whl
    wheelhouse/scipy-1.3.2-cp38-cp38-linux_armv7l.whl

The latest pip-supported Jupyter is installed:

    $ jupyter --version
    jupyter core     : 4.6.1
    jupyter-notebook : 6.0.2
    qtconsole        : 4.6.0
    ipython          : 7.9.0
    ipykernel        : 5.1.3
    jupyter client   : 5.3.4
    jupyter lab      : not installed
    nbconvert        : 5.6.1
    ipywidgets       : 7.5.1
    nbformat         : 4.4.0
    traitlets        : 4.3.3