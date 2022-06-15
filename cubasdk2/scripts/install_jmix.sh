#!/bin/sh

echo 'install_jmix execution started\n'

jmix_version=1.2.3

./${CUBA_SDK_DIR}/cuba-sdk-1.2.6/bin/cuba-sdk install jmix $jmix_version

echo 'install_jmix execution finished\n'