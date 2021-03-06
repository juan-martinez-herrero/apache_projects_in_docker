FROM juanmartinez/hadoop:2.7.7

ARG KYLIN_VERSION=2.4.1
ARG SPARK_VERSION=2.3.1
ARG HIVE_VERSION=1.2.2
ARG HBASE_VERSION=1.3.6

ENV KYLIN_HOME=/opt/kylin
ENV HBASE_HOME=/opt/hbase
ENV HIVE_HOME=/opt/hive
ENV SPARK_HOME=/opt/spark
ENV INIT_DIR=/opt/init

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget netcat hostname \
    && wget https://archive.apache.org/dist/kylin/apache-kylin-${KYLIN_VERSION}/apache-kylin-${KYLIN_VERSION}-bin-hbase1x.tar.gz \
    && mkdir -p $KYLIN_HOME \
    && tar -xvzf apache-kylin-${KYLIN_VERSION}-bin-hbase1x.tar.gz -C ${KYLIN_HOME} --strip-components=1 \
    && rm -fr apache-kylin-${KYLIN_VERSION}-bin-hbase1x.tar.gz \
    && wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
    && mkdir -p $SPARK_HOME \
    && tar -xzvf spark-${SPARK_VERSION}-bin-without-hadoop.tgz -C ${SPARK_HOME} --strip-components=1 \
    && rm -fr spark-${SPARK_VERSION}-bin-without-hadoop.tgz \
    && wget https://archive.apache.org/dist/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz \
    && mkdir -p $HIVE_HOME \
    && tar -xzvf apache-hive-${HIVE_VERSION}-bin.tar.gz -C ${HIVE_HOME} --strip-components=1 \
    && rm -fr apache-hive-${HIVE_VERSION}-bin.tar.gz \
    && wget https://archive.apache.org/dist/hbase/hbase-${HBASE_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz \
    && mkdir -p $HBASE_HOME \
    && tar -xzvf hbase-${HBASE_VERSION}-bin.tar.gz -C ${HBASE_HOME} --strip-components=1 \
    && rm -fr hbase-${HBASE_VERSION}-bin.tar.gz \
    && apt-get remove -y wget \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p ${INIT_DIR}

ENV PATH=$PATH:$SPARK_HOME/bin:$HIVE_HOME/bin:$HBASE_HOME/bin:$KYLIN_HOME/bin

WORKDIR $KYLIN_HOME

COPY scripts/bootstrap.sh /opt/init/bootstrap.sh
COPY scripts/kylin.sh $KYLIN_HOME/bin/kylin.sh
RUN chmod +x /opt/init/bootstrap.sh
RUN chmod +x $KYLIN_HOME/bin/kylin.sh

CMD /opt/init/bootstrap.sh
