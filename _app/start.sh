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
service_notification "SPHINX" "try to start"
echo "($RAKE_DO ts:start)"
($RAKE_DO ts:start) || (error_message "Sphinx can't be started")

#######################################
# REDIS
#######################################
service_notification "Redis" "try to start"
echo "(redis-server $RAILS_ROOT/config/redis_6010.config)"

mkdir -p $RAILS_ROOT/redis_db
(redis-server $RAILS_ROOT/config/redis_6010.config) || (error_message "Redis can't be started")

#######################################
# DELAYED JOB
#######################################
service_notification "Delayed Job" "try to start"
echo "($RVM_DO bin/delayed_job start -n 5)"
($RVM_DO bin/delayed_job start -n 5) || (error_message "DelayedJob can't be started")
