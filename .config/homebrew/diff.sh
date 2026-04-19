#!/bin/bash

cat Brewfile.personal Brewfile.work \
| grep -v '^[[:space:]]*$' \
| grep -v '^[[:space:]]*#' \
| sort \
| uniq -u \
> Brewfile