#!/bin/sh

cd ${CUBA_SDK_DIR}/cuba-sdk-1.2.6/bin

#init cuba-sdk
yes '' | ./cuba-sdk init
echo "task 'init cuba-sdk' finished successfully"

#install jmix
./cuba-sdk install jmix ${JMIX_VERSION}
echo "task 'install jmix' finished successfully\n"
