#!/bin/sh

set -e

RESOLUTION="${1:-1440x900}"

rm -f /tmp/.X1-lock /tmp/.X11-unix/X1
vncserver :1 -geometry "${RESOLUTION}" -depth 24 && tail -F /root/.vnc/*.log
