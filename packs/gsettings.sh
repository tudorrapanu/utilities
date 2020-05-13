#!/bin/bash

# Remember to run this script using the command "source ./filename.sh"

# Search these processes for the session variable 
# (they are run as the current user and have the DBUS session variable set)
compatiblePrograms=( cinnamon )

# Attempt to get a program pid
for index in ${compatiblePrograms[@]}; do
	PID=$(pidof -s ${index})
	if [[ "${PID}" != "" ]]; then
		break
	fi
done
if [[ "${PID}" == "" ]]; then
	echo "Could not detect active login session - using dbus-launch"
        /usr/bin/dbus-launch --exit-with-session /usr/bin/gsettings set "$1" "$2" "$3"
else
	QUERY_ENVIRON="$(tr '\0' '\n' < /proc/${PID}/environ | grep "DBUS_SESSION_BUS_ADDRESS" | cut -d "=" -f 2-)"
	if [[ "${QUERY_ENVIRON}" != "" ]]; then
		export DBUS_SESSION_BUS_ADDRESS="${QUERY_ENVIRON}"
		echo "Connected to dbus session ${DBUS_SESSION_BUS_ADDRESS}"
	        /usr/bin/gsettings set "$1" "$2" "$3"
	else
		echo "Could not find dbus session ID in user environment - using dbus-launch"
                /usr/bin/dbus-launch --exit-with-session /usr/bin/gsettings set "$1" "$2" "$3"
	fi
fi
