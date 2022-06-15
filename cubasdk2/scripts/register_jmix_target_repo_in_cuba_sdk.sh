#!/bin/sh

echo 'register_jmix_target_repo_in_cuba_sdk execution started\n'

yes 'jmix\nN\nhttp://nexus:8081/repository/jmix/\nN' | ./${CUBA_SDK_DIR}/cuba-sdk-1.2.6/bin/cuba-sdk repository add target

echo 'register_jmix_target_repo_in_cuba_sdk execution finished\n'
