#!/bin/bash

FBCODE=$(while [[ $PWD != "/" ]]; do [[ -f .buckconfig ]] && { realpath "$(pwd)"; break; }; cd .. ; done)
RUSTFMT_PATH=$(jq ".rustfmt" "$FBCODE/.rlsconfig")
RUSTFMT=$(BUCKROOT="$FBCODE" eval echo "$RUSTFMT_PATH")

exec "$RUSTFMT" | tail -n +2
