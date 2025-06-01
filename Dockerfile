FROM nvidia/cuda:12.6.3-runtime-rockylinux9

ENV TZ=Europe/Zagreb

RUN mkdir -p /data && chmod -R 777 /data

WORKDIR /setup
COPY ./setup/deps.sh /setup/deps.sh

# Copy
RUN chmod +x /setup/*.sh

# Deps
RUN bash /setup/deps.sh

# ENV
ENV HOME=/root \
    PATH=/root/.local/bin:/usr/local:$PATH

## Pyenv
#RUN curl https://pyenv.run | bash
#ARG PYTHON_VERSION=3.10.12
#ENV PATH=$HOME/.pyenv/shims:$HOME/.pyenv/bin:$PATH
#
#RUN pyenv install $PYTHON_VERSION && \
#    pyenv global $PYTHON_VERSION && \
#    pyenv rehash && \
#    pip install --no-cache-dir --upgrade pip setuptools wheel


WORKDIR /setup
COPY ./setup/setup-compile-deps.sh /setup/setup-compile-deps.sh
RUN chmod +x /setup/*.sh && bash /setup/setup-compile-deps.sh

# Install Python dependencies
# RUN pip install --no-cache-dir --upgrade -r /setup/requirements.txt

WORKDIR /setup
COPY ./setup/setup-compile-cmake.sh /setup/setup-compile-cmake.sh
RUN chmod +x /setup/*.sh && bash /setup/setup-compile-cmake.sh


WORKDIR /setup
COPY ./setup/compile-colmap.sh /setup/compile-colmap.sh
# compile colmap
RUN chmod +x /setup/*.sh && bash /setup/compile-colmap.sh



#RUN bash /setup/compile-glomap.sh



RUN echo "Setup Done."

CMD ["bash","/setup/startup.sh"]