FROM {{udfclient_deps}}

RUN mkdir -p /build_info/packages
COPY language_deps/packages /build_info/packages/language_deps

RUN apt-get -y update && \
    apt-get -y install software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt update && \
    apt-get -y install $(cat /build_info/packages/language_deps/apt_get_packages) && \
    locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 && \
    apt-get -y clean && \
    apt-get -y autoremove && \
    ldconfig

RUN curl -o get-pip.py https://bootstrap.pypa.io/get-pip.py && \
    python3.7 get-pip.py && \
    rm get-pip.py

COPY scripts /scripts
COPY language_deps/packages/pip3_packages /build_info/packages/language_deps
RUN /scripts/install_packages_batch.sh "PYTHON3-PIP" "python3.7 -m pip install --ignore-installed <<list>>" "<<package>>" " " /build_info/packages/language_deps/pip3_packages

ENV PYTHON2_PREFIX /usr
ENV PYTHON2_VERSION python2.7
ENV PYTHON3_PREFIX /usr
ENV PYTHON3_VERSION python3.7
ENV JAVA_PREFIX /usr/lib/jvm/java-11-openjdk-amd64

