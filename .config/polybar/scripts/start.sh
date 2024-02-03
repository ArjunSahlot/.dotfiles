#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar primary-top &

# if '--only-primary' flag doesn't exist
if [ "$1" != "--only-primary" ]; then
    polybar external-top &
fi

