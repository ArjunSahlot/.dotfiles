#!/bin/env bash

source ~/.config/polybar/scripts/.env

notifications=$(echo "user = \"$USER:$TOKEN\"" | curl -sf -K- https://api.github.com/notifications | jq ".[].unread" | grep -c true)

echo "$notifications"
