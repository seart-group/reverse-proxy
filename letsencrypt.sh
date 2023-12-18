#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

cp -r /etc/letsencrypt/live/ ssl/
