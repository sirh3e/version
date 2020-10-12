#!/bin/sh

./configure.sh TEST 1 20 3 0 \
    && make -j test-run \
    && ./configure.sh TEST 1 20 3 6 \
    && make -j test-run \
    && echo 'all test passed run successful' \
    && exit 0

echo 'one or more test failed'
exit 1