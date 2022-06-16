#!/bin/sh

jmix_version=1.2.3

#init cuba-sdk
yes '' | ./${CUBA_SDK_DIR}/cuba-sdk-1.2.6/bin/cuba-sdk init

#install jmix with required version
./${CUBA_SDK_DIR}/cuba-sdk-1.2.6/bin/cuba-sdk install jmix $jmix_version

echo 'install_jmix execution finished\n'