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
service_notification "SPHINX" "try to stop"
echo "($RAKE_DO ts:stop)"
($RAKE_DO ts:stop) || (error_message "Sphinx can't be stopped")

########################################
# REDIS
########################################
service_notification "Redis" "try to stop"
echo "redis-cli -h localhost -p 6010 shutdown"
(redis-cli -h localhost -p 6010 shutdown) || (error_message "Redis can't be stopped")

#######################################
# DELAYED JOB
#######################################
service_notification "Delayed Job" "try to stop"
echo "($RVM_DO bin/delayed_job stop)"
($RVM_DO bin/delayed_job stop) || (error_message "DelayedJob can't be stopped")
