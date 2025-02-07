FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y
RUN apt-get install -y sudo
RUN apt-get install -y curl
RUN apt-get install -y wget
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y build-essential
RUN apt-get install -y pkg-config
RUN apt-get install -y libhdf5-dev 
RUN apt-get install -y libhdf5-serial-dev
RUN apt-get install -y libhdf5-103
RUN apt-get install -y python3-h5py

RUN sudo apt update -y
RUN apt-get install -y texlive-xetex --fix-missing
RUN apt-get install -y texlive-fonts-recommended

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh && \
  bash Miniforge3-Linux-aarch64.sh -b -p /opt/miniforge3 && \
  rm Miniforge3-Linux-aarch64.sh && \
  /bin/bash -c "source /opt/miniforge3/bin/activate"
ENV PATH /opt/anaconda3/bin:$PATH

RUN pip install ipython
RUN pip install ipykernel
RUN pip install jupyter

RUN pip install matplotlib
RUN pip install pandas
RUN pip install tensorflow
RUN pip install torch --index-url https://download.pytorch.org/whl/cpu
RUN pip install torchdata --index-url https://download.pytorch.org/whl/cpu
RUN pip install torchvision --index-url https://download.pytorch.org/whl/cpu
RUN pip install torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install seaborn
RUN pip install transformers
RUN pip install accelerate
RUN pip install sentencepiece
RUN pip install nltk
RUN pip install rouge-score
RUN pip install bert-score
RUN pip install tf-keras
RUN pip install datasets

RUN useradd -m maxim
RUN echo 'maxim:maxim' | chpasswd
RUN usermod -aG sudo maxim
RUN sed -i 's/^%sudo.*/%sudo ALL=(ALL:ALL) NOPASSWD:ALL/' /etc/sudoers
USER maxim
WORKDIR /home/maxim

RUN echo 'export PATH=$PATH:/home/maxim/.local/lib/python3.10/site-packages:/home/maxim/.local/bin' >> ~/.bashrc

CMD ["/bin/bash"]
