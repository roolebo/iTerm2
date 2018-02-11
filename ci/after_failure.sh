#!/usr/bin/env bash

set -x

if ls /tmp/failed-* 1> /dev/null 2>&1; then
  cp tests/imgcat /tmp
  cp ci/accept.sh /tmp
  export PATH=$PATH:$PWD/tests
  cd /tmp
  source /tmp/diffs > diffs.txt
  tar cvfz travis-fail-$TRAVIS_JOB_NUMBER.tgz failed-*.png diffs.txt accept.sh
  tools/dropbox_uploader.sh upload travis-fail-$TRAVIS_JOB_NUMBER.tgz 
fi

