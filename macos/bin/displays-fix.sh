#!/usr/bin/env bash


set -x

NUM_DISPLAYS=$(yabai -m query --displays | jq length)
NUM_SPACES=$(yabai -m query --spaces | jq length)

for i in {1..10}
do
    if [[ "$i" -gt "$NUM_SPACES" ]]; then
        yabai -m space --create
        sleep 0.5
    fi
done

if [[ "$1" == "--relabel" ]]; then
    for i in {1..10}
    do
        yabai -m space ${i} --label "s_${i}"
        sleep 0.5
    done
fi

for i in {1..10}
do
    yabai -m space "s_${i}" --display $(( ( ${i} - 1 ) % ${NUM_DISPLAYS} + 1 ))
    sleep 0.5
done
