#! /bin/bash
mv config config_bk.tmp
mv $1 config
mv config_bk.tmp config_old
