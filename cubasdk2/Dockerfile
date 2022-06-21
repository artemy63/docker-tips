FROM ubuntu

ENV CUBA_SDK_DIR=/root/.haulmont/cli/sdk
ENV CUBA_SDK_SCRIPTS_DIR=/root/.haulmont/cli/sdk/scripts
ENV CUBA_SDK_M2_DIR=/root/.m2/repository

ENV JMIX_VERSION=1.2.4
ENV JMIX_GRADLE_PLUGIN_VERSION=1.2.0
ENV SPRING_BOOT_VERSION=2.7.0

RUN mkdir -p $CUBA_SDK_DIR \
    && mkdir -p $CUBA_SDK_SCRIPTS_DIR \
    && mkdir -p $CUBA_SDK_M2_DIR

# install required tools
RUN apt-get -qq update \
    && apt-get -y install wget \
    && apt-get -y install unzip \
    && apt-get -y install python3 \
    && apt-get -y install pip \
    && pip install requests --quiet

# copy predefined repositories settings
COPY cli/* $CUBA_SDK_DIR/
COPY scripts/* $CUBA_SDK_SCRIPTS_DIR/

#download
RUN wget https://github.com/cuba-platform/cuba-sdk/releases/download/1.2.6/cuba-sdk-1.2.6-linux.zip -q -O $CUBA_SDK_DIR/cuba-sdk.zip \
    && unzip -q $CUBA_SDK_DIR/cuba-sdk.zip -d $CUBA_SDK_DIR \
    && rm $CUBA_SDK_DIR/cuba-sdk.zip \
    && chmod +x $CUBA_SDK_DIR/cuba-sdk-1.2.6/bin/cuba-sdk \
    && chmod +x $CUBA_SDK_SCRIPTS_DIR/*.sh

CMD ["sh", "-c", "${CUBA_SDK_SCRIPTS_DIR}/entrypoint.sh"]