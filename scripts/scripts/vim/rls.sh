#!/bin/bash

cd ~/fbcode && \
  exec /usr/local/fbpkg/nuclide/vscode-nuclide-server/production/vscode-extensions/rusty/server/run-rustls "/tmp/ralog" "/tmp/ralog"
