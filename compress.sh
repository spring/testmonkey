#!/bin/sh
7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m -ms=on	logs.7z logs
cd logs
grep "#0 " *.log |cut -b -24,50-
