#!/usr/bin/env bash


set -ex

NUM_DISPLAYS=$(yabai -m query --displays | jq length)
NUM_SPACES=$(yabai -m query --spaces | jq length)

for i in {1..10}
do
    if [[ "$i" -gt "$NUM_SPACES" ]]; then
        yabai -m space --create
        sleep 0.5
    fi
done

for i in {1..10}
do
    yabai -m space ${i} --label "s_${i}"
    sleep 0.5
done

oldIFS=$IFS
IFS=$'\n'
fixWindows=($(jq -n -r \
    --slurpfile spaces <(yabai -m query --spaces ) \
    --slurpfile windows <(yabai -m query --windows) \
    '$windows[][]
        | .["spaceLabel"] = (.space | $spaces[][. - 1].label)
        | "yabai -m window \(.id) --space \(.spaceLabel)"'
))
IFS=$oldIFS

# for c in  "${fixWindows[@]}" ; do
#     echo >&2 "would run: '$c'"
# done

function displayOfSpace {
    yabai -m query --spaces | jq ".[]|select(.label == \"$1\")|.display"
}

for i in {1..10}
do
    CURR_DISPLAY=$(( ( ${i} - 1 ) % ${NUM_DISPLAYS} + 1 ))
    if [[ "$(displayOfSpace "s_${i}")" != "$CURR_DISPLAY" ]] ; then
        yabai -m space "s_${i}" --display "$CURR_DISPLAY"
        sleep 0.5
    fi
done

if [[ "$1" == "--relabel" ]]; then
    for cmd in "${fixWindows[@]}"; do
        bash -c "$cmd"
    done
fi
