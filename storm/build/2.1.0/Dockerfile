FROM juanmartinez/openjdk:8.0.242

LABEL maintainer "Juan Martinez <arcangelo@gmail.com>"
LABEL Description="Apache Storm docker image" Version="2.1.0"

ARG STORM_VERSION=2.1.0
ENV STORM_HOME=/opt/storm
ENV INIT_DIR=/opt/init

RUN apt-get update \
    && apt-get install --no-install-recommends -y wget python \
    && wget https://archive.apache.org/dist/storm/apache-storm-${STORM_VERSION}/apache-storm-${STORM_VERSION}.tar.gz \
    && mkdir -p $STORM_HOME \
    && tar -xvzf apache-storm-${STORM_VERSION}.tar.gz -C ${STORM_HOME} --strip-components=1 \
    && rm -rf apache-storm-${STORM_VERSION}.tar.gz \
    && apt-get remove -y wget \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p ${INIT_DIR}

WORKDIR $STORM_HOME

COPY scripts/bootstrap.sh ${INIT_DIR}/bootstrap.sh
RUN chmod +x ${INIT_DIR}/bootstrap.sh

CMD ${INIT_DIR}/bootstrap.sh
