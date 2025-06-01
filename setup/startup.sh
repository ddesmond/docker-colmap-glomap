#!/bin/bash
echo "_____ Startup _____"
if [ -e /.colmap-init ]; then
  bash /setup/setup.sh
  bash /setup/run.sh
else
  bash /setup/run.sh
fi