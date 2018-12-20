#!/bin/bash

# ==============================================================================
# wasta-xfce-core: wasta-xfce-core-postinst.sh
#
# This script is automatically run by the postinst configure step on
#   installation of wasta-xfce-common.  It can be manually re-run, but is
#   only intended to be run at package installation.
#
# 2015-06-16 rik: initial script
# 2015-06-22 rik: pulse audio: register volume change sound
# 2015-06-24 rik: hiding xfce poer manager from other desktops
#   - adding mintLocale and mintdrivers to xfce system settings
#   - hide xfce4-appfinder from all desktops (only launch via key combo)
# 2015-06-29 rik: fix mintdrivers desktop cleanup errors
# 2015-06-29 rik: xfce4-xscreenshooter - no display all desktops (gnome already
#   has one and it is adequate.
# 2016-07-29 rik: updating for 16.04
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Check to ensure running as root
# ------------------------------------------------------------------------------
#   No fancy "double click" here because normal user should never need to run
if [ $(id -u) -ne 0 ]
then
	echo
	echo "Exiting...."
	sleep 5s
	exit 1
fi

# ------------------------------------------------------------------------------
# Initial Setup
# ------------------------------------------------------------------------------

echo
echo "*** Beginning wasta-xfce-core-postinst.sh"
echo

# ------------------------------------------------------------------------------
# Configure Qt apps to use GTK+ theme by default
# ------------------------------------------------------------------------------
# ???NEEDED 16.04???
# if [ -e /etc/xdg/Trolltech.conf ];
# then
#     echo
#     echo "*** Ensuring GTK+ theme used for Qt apps"
#     echo
#     sed -i -e '$a style=GTK+' \
#         -i -e '\@style=@d' \
#         /etc/xdg/Trolltech.conf
# fi

# ------------------------------------------------------------------------------
# Finished
# ------------------------------------------------------------------------------
echo
echo "*** Finished with wasta-xfce-core-postinst.sh"
echo

exit 0
