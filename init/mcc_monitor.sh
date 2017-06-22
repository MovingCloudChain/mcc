#!/bin/bash
readonly PROG_DIR=$(readlink -m $(dirname $0))
mccd=$PROG_DIR/../mccd
log=$PROG_DIR/../logs/mcc_monitor.log

function auto_restart(){
	status=`$mccd status`
	if [ "$status" == "MCC server is not running" ];then
		$mccd restart
		echo "`date +%F' '%H:%M:%S`[error]	MCC server is not running and restarted" >> $log
	else
		echo "`date +%F' '%H:%M:%S`[info]	MCC server is running" >> $log
	fi	
}

auto_restart
