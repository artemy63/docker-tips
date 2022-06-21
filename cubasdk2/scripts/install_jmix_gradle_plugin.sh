#!/bin/sh

cd ${CUBA_SDK_DIR}/cuba-sdk-1.2.6/bin

#remove all source repositories in order to install gradle plugin from https://plugins.gradle.org/m2/
./cuba-sdk repository remove source jmix-nexus
./cuba-sdk repository remove source cuba-nexus3
./cuba-sdk repository remove source jmix-global
./cuba-sdk repository remove source central
./cuba-sdk repository remove source cuba-nexus2

./cuba-sdk install lib io.jmix.gradle:jmix-gradle-plugin:${JMIX_GRADLE_PLUGIN_VERSION}
echo "task 'install jmix gradle plugin' finished successfully\n"
