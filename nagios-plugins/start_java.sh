#!/usr/bin/env bash
#########################################
#Function:    Event handler script for restarting the web server on the local machine
#Usage:       Only use for nagios
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

case "$1" in
OK)
        ;;
WARNING)
        ;;
UNKNOWN)
        ;;
CRITICAL)
        case "$2" in
        SOFT)
                case "$3" in
                3)
                        echo -n "Starting Java service (3rd soft critical state)..."
                        sudo /opt/apache-tomcat-6.0.32/bin/startup.sh
                        ;;
                        esac
                ;;
        HARD)
                echo -n "Starting Java service..."
                sudo /opt/apache-tomcat-6.0.32/bin/startup.sh
                ;;
        esac
        ;;
esac
exit 0
