#!/bin/sh
set -eu

tini -- xvfb-run -a wine "$@"
