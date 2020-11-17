#!/bin/bash

FBCODE=$(while [[ $PWD != "/" ]]; do [[ -f .buckconfig ]] && { realpath "$(pwd)"; break; }; cd .. ; done)
RUSTC_PATH=$(jq ".rustc" "$FBCODE/.rlsconfig")
RUSTC=$(BUCKROOT="$FBCODE" eval echo "$RUSTC_PATH")
RLS_PATH=$(jq ".rls" "$FBCODE/.rlsconfig")
RLS=$(BUCKROOT="$FBCODE" eval echo "$RLS_PATH")

RUSTC="$RUSTC" "$RLS"
