#!/bin/sh

kdeinit4
dh_auto_test
ret=$?
kdeinit4_shutdown
exit $ret
