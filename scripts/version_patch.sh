#!/bin/sh

set -x

VERSION_HEADER_FILE=$1
if [ ! -f "${VERSION_HEADER_FILE}" ]
then
    echo "the version header file: ${VERSION_HEADER_FILE} does not exits"
    exit 1
fi

PROJECT_NAME=$2
if [ -z "${PROJECT_NAME}" ]
then
    echo "project name cannot be empty"
    exit 1
fi

VERSION_MAJOR=$3
VERSION_MINOR=$4
VERSION_PATCH=$5
VERSION_RELEASE_CANDIDATE=$6

sed -E \
    -e "s/_VERSION_MAJOR [0-9]{1,}/_VERSION_MAJOR ${VERSION_MAJOR}/" \
    -e "s/_VERSION_MINOR [0-9]{1,}/_VERSION_MINOR ${VERSION_MINOR}/" \
    -e "s/_VERSION_PATCH [0-9]{1,}/_VERSION_PATCH ${VERSION_PATCH}/" \
    -e "s/_VERSION_RELEASE_CANDIDATE [0-9]{1,}/_VERSION_RELEASE_CANDIDATE ${VERSION_RELEASE_CANDIDATE}/" \
    -i "${VERSION_HEADER_FILE}"
