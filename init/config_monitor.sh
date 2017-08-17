#!/bin/bash
#auth:lumpo
#date:2016-07-15

readonly INIT_DIR=$(readlink -m $(dirname $0))

function add_cron() {
$ct_file="/etc/crontab"

if [ -f "$ct_file" ] && grep -q "mcc_monitor" "$ct_file"; then
        echo "Add mcc_monitor crontab err, please add it manually!" && exit 2;
        elif [ ! -f "$testf" ]; then echo "Error:  /etc/crontab Does not exist!" && exit 2;
	else
        echo "*/1 **** root $INIT_DIR/mcc_monitor.sh" >> "$ct_file";
fi

}

function main() {
	add_cron
	echo "Configure mcc_monitor crontab done."
}

main
