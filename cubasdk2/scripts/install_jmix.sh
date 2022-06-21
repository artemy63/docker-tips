#!/bin/sh

cd ${CUBA_SDK_DIR}/cuba-sdk-1.2.6/bin

#init cuba-sdk
yes '' | ./cuba-sdk init

#install jmix
./cuba-sdk install jmix ${JMIX_VERSION}

echo 'task install_jmix finished\n'
