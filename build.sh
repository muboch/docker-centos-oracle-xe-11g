#!/bin/bash

rm -f dockerbuild.log >/dev/null
docker build --rm=true -t centos7/oracle-xe . 2>&1 | tee dockerbuild.log
