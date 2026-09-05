#!/usr/bin/env bash

sudo launchctl bootout system/org.nixos.linux-builder && \
  sudo rm -f /var/lib/linux-builder/nixos.qcow2 && \
  sudo launchctl bootstrap system /Library/LaunchDaemons/org.nixos.linux-builder.plist
