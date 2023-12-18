#!/bin/bash

[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

cp /etc/letsencrypt/live/seart-dl4se.si.usi.ch/cert.pem \
    ssl/seart-dl4se.si.usi.ch/cert.pem
cp /etc/letsencrypt/live/seart-dl4se.si.usi.ch/privkey.pem \
    ssl/seart-dl4se.si.usi.ch/privkey.pem
cp /etc/letsencrypt/live/seart-ghs.si.usi.ch/cert.pem \
    ssl/seart-ghs.si.usi.ch/cert.pem
cp /etc/letsencrypt/live/seart-ghs.si.usi.ch/privkey.pem \
    ssl/seart-ghs.si.usi.ch/privkey.pem
