#!/bin/bash

mpv $(ddgr --json -w youtube.com $1 | grep url | head -1 | cut -d\" -f4)
