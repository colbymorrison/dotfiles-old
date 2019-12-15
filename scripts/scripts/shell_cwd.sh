#!/bin/bash
[[ -f /tmp/whereami ]] && termite -d $(cat /tmp/whereami)
