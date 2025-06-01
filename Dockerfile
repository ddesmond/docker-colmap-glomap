FROM nvidia/cuda:12.6.3-runtime-rockylinux9


ENV TZ=Europe/Zagreb

ARG USE_PERSISTENT_DATA

RUN mkdir -p /data && chmod -R 777 /data

WORKDIR /setup
COPY ./setup /setup

# Copy
RUN chmod +x /setup/*.sh

# Deps
RUN bash /setup/deps.sh

# ENV
ENV HOME=/root \
    PATH=/root/.local/bin:$PATH

# Pyenv
RUN curl https://pyenv.run | bash
ENV PATH=$HOME/.pyenv/shims:$HOME/.pyenv/bin:$PATH

ARG PYTHON_VERSION=3.10.12

# Python
RUN pyenv install $PYTHON_VERSION && \
    pyenv global $PYTHON_VERSION && \
    pyenv rehash && \
    pip install --no-cache-dir --upgrade pip setuptools wheel

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade -r /setup/requirements.txt


RUN echo "Done."

CMD ["bash","/setup/startup.sh"]