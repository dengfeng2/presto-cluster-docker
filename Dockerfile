FROM ubuntu:20.04

COPY tsinghua.list /etc/apt/sources.list.d/
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
RUN apt update && \
    apt install -y python3 && \
    apt install -y openjdk-8-jdk && \
    ln -s /usr/bin/python3 /usr/bin/python

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV PATH=$PATH:${JAVA_HOME}/bin

# must give the name of server package
RUN mkdir -p /opt
ARG PRESTO_SERVER_PACKAGE
ADD ${PRESTO_SERVER_PACKAGE}.tar.gz /opt/
RUN ln -s /opt/${PRESTO_SERVER_PACKAGE} /opt/presto

# must mount /trino-etc when docker run
ENTRYPOINT ["/opt/presto/bin/launcher", "--etc-dir=/presto-etc", "run"]
