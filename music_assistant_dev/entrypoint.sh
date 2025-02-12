#!/bin/sh

branch=$(cat /data/options.json | jq -r .branch)
fork=$(cat /data/options.json | jq -r .fork)

echo ""
echo "-----------------------------------------------------------"
echo "Music Assistant dev/nightly version"
echo "-----------------------------------------------------------"
echo ""
echo "Installing latest version from $fork, branch $branch in $VIRTUAL_ENV"
echo ""
source $VIRTUAL_ENV/bin/activate
uv pip install \
    --no-cache \
    --link-mode=copy \
    "$fork@$branch"

echo ""
echo ""
mass --config /data
