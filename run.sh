#!/bin/sh

set -e #abort on error

if [ $# -le 0 ]; then
	echo "Usage: $0 /path/to/spring [parameters]"
	exit 1
fi

DATESTR=$(date +"%Y.%m.%d_%H-%M-%S")

if [ ! -x "$1" ]; then
	echo "Parameter 1 $1 isn't executable!"
	exit 1
fi

TMP=tmp
LOG=$TMP/$DATESTR.log

GDBCMDS=$TMP/$DATESTR.gdbcmds

(
echo file $1
echo run $2 $3 $4 $5 $6 $7 $8 $9
echo bt full
echo quit
)>$GDBCMDS

echo Starting Test, logging to $LOG
time gdb -x $GDBCMDS >$LOG 2>&1 2>/dev/null

if grep -v "Program exited normally." $LOG; then
	echo -n "failed"
else
	echo -n "ok"
fi

