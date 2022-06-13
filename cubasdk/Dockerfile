FROM sonatype/nexus3:latest

ENV CUBA_SDK_DIR=/usr/local/.haulmont/cli/sdk

#in order to install unzip and get rights to create folders
USER root
RUN mkdir -p $CUBA_SDK_DIR

RUN yum -q -y install unzip  \
    && yum -q -y install wget

#download and unzip cuba-sdk
RUN wget https://github.com/cuba-platform/cuba-sdk/releases/download/1.2.6/cuba-sdk-1.2.6-linux.zip -q -O $CUBA_SDK_DIR/cuba-sdk.zip \
    && unzip $CUBA_SDK_DIR/cuba-sdk.zip -d $CUBA_SDK_DIR/sdk \
    && rm $CUBA_SDK_DIR/cuba-sdk.zip \
    && chmod +x $CUBA_SDK_DIR/sdk/cuba-sdk-1.2.6/bin

USER nexus
