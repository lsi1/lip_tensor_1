FROM tensorflow/tensorflow:latest-gpu


# git & python3.6 dependencies
RUN apt-get update && \
    apt-get install -y git make build-essential libssl-dev zlib1g-dev libbz2-dev \
        libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
        xz-utils tk-dev libffi-dev liblzma-dev


# install pyenv
RUN mkdir -p /root/.ssh && \
    ssh-keyscan -H github.com >> /root/.ssh/known_hosts && \
    git clone https://github.com/pyenv/pyenv.git /root/.pyenv

ENV HOME       /root
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH       $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH


# install python 3.6.4
RUN pyenv install 3.6.4
RUN pyenv global 3.6.4


# upgrade pip and install pipenv
RUN pip install --upgrade pip && \
    pip install pipenv


RUN echo "export LC_ALL=C.UTF-8" >> ~/.bashrc && \
    echo "export LANG=C.UTF-8" >> ~/.bashrc
