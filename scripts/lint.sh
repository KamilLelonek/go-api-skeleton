#!/usr/bin/env bash

# git gofmt pre-commit hook
#
# You can use it as .git/hooks/pre-commit inside your repository
# and make sure it has execute permissions.
#
# This script does not handle file names that contain spaces.

gofiles=$(ls -R | grep "\.go$")
[ -z "$gofiles" ] && exit 0

unformatted=$(gofmt -l $gofiles)
[ -z "$unformatted" ] && exit 0

# Some files are not gofmt'd. Print message and fail.

echo >&2 "Go files must be formatted with gofmt. Please run:"
for fn in $unformatted; do
  echo >&2 "  gofmt -w $PWD/$fn"
done

exit 1
