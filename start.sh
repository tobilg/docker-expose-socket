#!/bin/sh

exec socat TCP-LISTEN:12375,reuseaddr,fork UNIX-CLIENT:/var/run/docker.sock