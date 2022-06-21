#!/bin/sh

. ${CUBA_SDK_SCRIPTS_DIR}/install_jmix.sh

python3 ${CUBA_SDK_SCRIPTS_DIR}/resolve_dependencies.py

. ${CUBA_SDK_SCRIPTS_DIR}/install_resolved_dependencies.sh

. ${CUBA_SDK_SCRIPTS_DIR}/install_jmix_gradle_plugin.sh

. ${CUBA_SDK_SCRIPTS_DIR}/export_jmix_artifacts.sh

exec "$@"
