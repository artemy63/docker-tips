#!/bin/sh

echo 'entrypoint.sh execution started\n'

echo 'first step started\n'
. ${CUBA_SDK_DIR}/add_jmix_maven2_hosted_repo.sh
echo 'first step finished\n'

echo 'second step started\n'
. ${CUBA_SDK_DIR}/register_jmix_target_repo_in_cuba_sdk.sh
echo 'second step finished\n'

echo 'third step started\n'
. ${CUBA_SDK_DIR}/install_jmix.sh
echo 'third step finished\n'

echo 'entrypoint.sh execution finished\n'

exec "$@"
