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
PROJECT_NAME=$( echo "$1" | tr '[a-z]' '[A-Z]' )

PROJECT_VERSION_MAJOR=$2
case "${PROJECT_VERSION_MAJOR}" in
  ''|*[!0-9]*) echo "PROJECT_VERSION_MAJOR is not a number"; exit 1;;
esac

PROJECT_VERSION_MINOR=$3
case "${PROJECT_VERSION_MINOR}" in
  ''|*[!0-9]*) echo "PROJECT_VERSION_MINOR is not a number"; exit 1;;
esac

PROJECT_VERSION_PATCH=$4
case "${PROJECT_VERSION_PATCH}" in
  ''|*[!0-9]*) echo "PROJECT_VERSION_PATCH is not a number"; exit 1;;
esac

PROJECT_VERSION_RELEASE_CANDIDATE=$5
case "${PROJECT_VERSION_RELEASE_CANDIDATE}" in
  ''|*[!0-9]*) echo "PROJECT_VERSION_RELEASE_CANDIDATE is not a number"; exit 1;;
esac

sed -E \
    -e "s/_VERSION_MAJOR [0-9]{1,}/_VERSION_MAJOR ${PROJECT_VERSION_MAJOR}/" \
    -e "s/_VERSION_MINOR [0-9]{1,}/_VERSION_MINOR ${PROJECT_VERSION_MINOR}/" \
    -e "s/_VERSION_PATCH [0-9]{1,}/_VERSION_PATCH ${PROJECT_VERSION_PATCH}/" \
    -e "s/_VERSION_RELEASE_CANDIDATE [0-9]{1,}/_VERSION_RELEASE_CANDIDATE ${PROJECT_VERSION_RELEASE_CANDIDATE}/" \
    -i "${VERSION_HEADER_FILE}"
