FROM ubuntu

ENV CUBA_SDK_DIR=/root/.haulmont/cli/sdk

RUN mkdir -p $CUBA_SDK_DIR

# install required tools
RUN apt-get -qq update \
    && apt-get -y install wget \
    && apt-get -y install unzip

# copy predefined repositories settings
COPY cli/* $CUBA_SDK_DIR/

#download, unzip and init cuba-sdk
RUN wget https://github.com/cuba-platform/cuba-sdk/releases/download/1.2.6/cuba-sdk-1.2.6-linux.zip -q -O $CUBA_SDK_DIR/cuba-sdk.zip \
    && unzip -q $CUBA_SDK_DIR/cuba-sdk.zip -d $CUBA_SDK_DIR \
    && rm $CUBA_SDK_DIR/cuba-sdk.zip \
    && chmod +x $CUBA_SDK_DIR/cuba-sdk-1.2.6/bin/cuba-sdk \
    && yes '' | ./cuba-sdk init \
    && yes '' | ./cuba-sdk setup-nexus



