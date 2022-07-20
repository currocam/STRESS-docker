FROM ubuntu:focal

COPY . .
ADD https://bootstrap.pypa.io/pip/2.7/get-pip.py get-pip.py   

RUN apt-get update && \
    apt-get install -y python2 gcc python2-dev make && \
    python2 get-pip.py && \
    pip install -r requirements.txt && \
    cd ScientificPython && \
    python2 setup.py build && \
    python2 setup.py install && \
    cd ../MMTK && \
    python2 setup.py build && \
    python2 setup.py install && \
    cd ../STRESS/surface_residue/code_pack/ && \
    make clean && \
    make && \
    cd ../../interior_residue/networkTools/ && \
    make clean && \
    make

WORKDIR /STRESS    