#!/bin/bash
# chmod 744 script/app/*.sh

#######################################
# INCLUDE COMMON VARIABLES
#######################################
CURRENT_DIR=`dirname $0`
source $CURRENT_DIR/_vars.sh

#######################################
# SPHINX
#######################################
service_notification "SPHINX" "try to INIT"

echo "($RAKE_DO ts:configure)"
echo "($RAKE_DO ts:index)"

($RAKE_DO ts:configure && service_notification "SPHINX" "configured") || (error_message "Sphinx can't be configated")
($RAKE_DO ts:index     && service_notification "SPHINX" "indexed")    || (error_message "Sphinx can't be indexed")
