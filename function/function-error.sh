#!/usr/bin/env bash
#########################################
#Function:    Shell Script function
#Usage:       
#Author:      Taio
#E-Mail:      jiasir@icloud.com
#Version:     1.0
#########################################

# A slicker error handling routine

# The script name
PROGNAME=$(basename $0)


error_exit()
{

#	----------------------------------------------------------------
#	Function for exit due to fatal program error
#		Accepts 1 argument:
#			string containing descriptive error message
#	----------------------------------------------------------------

	# If $1 is unset, using default value
	echo "${PROGNAME}: ${1:-"Unknown Error"}" 1>&2
	exit 1
}

# Example call of the error_exit function.  Note the inclusion
# of the LINENO environment variable.  It contains the current
# line number.

echo "Example of error with line number and message"
error_exit "$LINENO: An error has occurred."