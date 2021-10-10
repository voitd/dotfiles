#!/usr/bin/env bash

find /System/Library/CoreServices /System/Applications /Applications /System/Applications/Utilities -maxdepth 1 -name "*.app" | fzf | xargs -I {} open "{}"
