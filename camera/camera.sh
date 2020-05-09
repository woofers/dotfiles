#!/usr/bin/env bash
DEVICE=/dev/video1
v4l2-ctl -d $DEVICE --set-ctrl=brightness=120
v4l2-ctl -d $DEVICE --set-ctrl=contrast=140
v4l2-ctl -d $DEVICE --set-ctrl=saturation=115
v4l2-ctl -d $DEVICE --set-ctrl=saturation=120
v4l2-ctl -d $DEVICE --set-ctrl=saturation=125
v4l2-ctl -d $DEVICE --set-ctrl=saturation=128
v4l2-ctl -d $DEVICE --set-ctrl=saturation=120
v4l2-ctl -d $DEVICE --set-ctrl=sharpness=140
v4l2-ctl -d $DEVICE --set-ctrl=exposure_auto=1
v4l2-ctl -d $DEVICE --set-ctrl=focus_absolute=30
v4l2-ctl -d $DEVICE --set-ctrl=focus_auto=0
