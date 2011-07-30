#!/bin/sh

if [ $# -le 0 ]; then
	echo "Usage: $0 /path/to/spring [parameters]"
	exit 1
fi

if [ ! -x "$1" ]; then
	echo "Parameter 1 $1 isn't executable!"
	exit 1
fi
TMP=tmp
LOG=$TMP/test.log

(
echo file $1
echo set logging on $LOG
echo run $2 $3 $4 $5 $6 $7 $8 $9
echo bt full
echo quit
)>$TMP/gdbcmds

gdb -x $TMP/gdbcmds

if grep "" $LOG; then
	echo Error detected:
	FILENAME=$TMP/$(date +"%Y.%m.%d_%H-%M-%S").log
	mv $LOG $FILENAME
fi

