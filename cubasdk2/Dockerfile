FROM ubuntu

ENV CUBA_SDK_DIR=/root/.haulmont/cli/sdk

RUN mkdir -p $CUBA_SDK_DIR

#RUN apk update \
#    && apk add wget \
#    && apk add unzip \
RUN apt-get -qq update \
    && apt-get -y install wget \
    && apt-get -y install unzip

##download and unzip gradle
#RUN wget https://services.gradle.org/distributions/gradle-6.6.1-bin.zip -q -O $CUBA_SDK_DIR/gradle.zip \
#    && unzip -q $CUBA_SDK_DIR/gradle.zip -d $CUBA_SDK_DIR \
#    && rm $CUBA_SDK_DIR/gradle.zip

#download and unzip cuba-sdk
RUN wget https://github.com/cuba-platform/cuba-sdk/releases/download/1.2.6/cuba-sdk-1.2.6-linux.zip -q -O $CUBA_SDK_DIR/cuba-sdk.zip \
    && unzip -q $CUBA_SDK_DIR/cuba-sdk.zip -d $CUBA_SDK_DIR \
    && rm $CUBA_SDK_DIR/cuba-sdk.zip \
    && chmod +x $CUBA_SDK_DIR/cuba-sdk-1.2.6/bin/cuba-sdk

COPY cli/* $CUBA_SDK_DIR/


