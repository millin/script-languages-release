FROM ubuntu:18.04

COPY ext/01_nodoc /etc/dpkg/dpkg.cfg.d/01_nodoc

RUN apt-get -y update && \
    apt-get -y install \
        locales \
        python3-pip \
        git \
        bash \
        curl && \
    locale-gen en_US.UTF-8 && \
    update-locale LC_ALL=en_US.UTF-8 && \
    apt-get -y clean && \
    apt-get -y autoremove && \
    ldconfig

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
RUN pip3 install pipenv
RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh
RUN virtualenv /venv
RUN echo "source /venv/bin/activate" >> ~/.bashrc
COPY Pipfile Pipfile
RUN bash -c "source /venv/bin/activate && pipenv install"
