FROM juanmartinez/openjdk:8.0.242

LABEL maintainer "Juan Martinez <arcangelo@gmail.com>"
LABEL Description="Solr docker image" Version="8.5.0"

ARG SOLR_VERSION=8.5.0
ENV SOLR_DIR=/opt/solr
ENV INIT_DIR=/opt/init

RUN apt-get update \
    && apt-get install --no-install-recommends -y wget netcat procps \
    && wget https://archive.apache.org/dist/lucene/solr/${SOLR_VERSION}/solr-${SOLR_VERSION}.tgz \
    && mkdir -p $SOLR_DIR \
    && tar -xvzf solr-${SOLR_VERSION}.tgz -C ${SOLR_DIR} --strip-components=1 \
    && rm -fr solr-${SOLR_VERSION}.tgz \
    && apt-get remove -y wget \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p ${INIT_DIR}

ENV PATH=${PATH}:${SOLR_DIR}/bin

WORKDIR $SOLR_DIR

COPY scripts/bootstrap.sh ${INIT_DIR}/bootstrap.sh
RUN chmod +x ${INIT_DIR}/bootstrap.sh

CMD ${INIT_DIR}/bootstrap.sh
