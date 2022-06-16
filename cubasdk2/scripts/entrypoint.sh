#!/bin/sh

. ${CUBA_SDK_SCRIPTS_DIR}/add_jmix_maven2_hosted_repo.sh

. ${CUBA_SDK_SCRIPTS_DIR}/install_jmix.sh

. ${CUBA_SDK_SCRIPTS_DIR}/export_jmix_artifacts.sh

exec "$@"
