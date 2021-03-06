#!/bin/sh

# hardcode devices in the script
# declare -a devices=("iPhone SE (2nd generation)" "sdk gphone x86 arm")

# more flexible - accepts read command line arguments as a list of devices
devices=("$@")

## script to trigger integration tests for each test file
target='test_driver/app.dart'
features='test_driver/features'

files=$(find $features -maxdepth 3 -type f);

for device in "${devices[@]}"
  do
  echo $device
  for file in $files
    do
    echo $file

    # --no-build is to speed up the tests.
    # TODO: specify devices
    flutter drive --no-build --target=$target --driver=$file -d $device
  done
done