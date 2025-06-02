FROM nvidia/cuda:12.6.3-runtime-rockylinux9 AS builder

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

# Compile cmake
WORKDIR /setup
COPY ./setup/setup-compile-cmake.sh /setup/setup-compile-cmake.sh
RUN chmod +x /setup/*.sh && bash /setup/setup-compile-cmake.sh

# compile deps for colmap/glomap - cuda support
WORKDIR /setup
COPY ./setup/compile-deps-colmap-glomap.sh /setup/compile-deps-colmap-glomap.sh
RUN chmod +x /setup/*.sh && bash /setup/compile-deps-colmap-glomap.sh

# compile colmap
WORKDIR /setup
COPY ./setup/compile-colmap.sh /setup/compile-colmap.sh
# compile colmap
RUN chmod +x /setup/*.sh && bash /setup/compile-colmap.sh

# compile glomap
WORKDIR /setup
COPY ./setup/compile-glomap.sh /setup/compile-glomap.sh
# compile colmap
RUN chmod +x /setup/*.sh && bash /setup/compile-glomap.sh

RUN echo "Compile Done."

# source fresh container so we lower the image size

FROM nvidia/cuda:12.6.3-runtime-rockylinux9 AS runtime

# copy compiled bins and deps
WORKDIR /setup
COPY ./setup /setup

COPY --from=builder /colmap-install/ /usr/local/
COPY --from=builder /glomap-install/ /usr/local/
COPY --from=builder /usr/local/lib/ /usr/local/lib/
COPY --from=builder /tmp/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/ /opt/cudss/libcudss-linux-x86_64-0.3.0.9_cuda12-archive/

RUN chmod +x /setup/*.sh && bash /setup/post-compile.sh

# run
CMD ["bash","/setup/startup.sh"]