#!/bin/bash

message="$(basename $PWD): $(date)"
echo "${message}" > RECORD
git add .
git commit -m "Adding to RECORD: ${message}"
git log -1
git push
