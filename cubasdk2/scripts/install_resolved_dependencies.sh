#!/usr/bin/env bash

cd "${CUBA_SDK_DIR}"/cuba-sdk-1.2.6/bin

while IFS= read -r line; do
  ./cuba-sdk install lib $line
done <"${CUBA_SDK_SCRIPTS_DIR}/resolved_dependencies"
echo "task 'install resolved dependencies' finished successfully"
