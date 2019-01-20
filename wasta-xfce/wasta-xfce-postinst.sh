#!/bin/bash

# ==============================================================================
# wasta-xfce: wasta-xfce-postinst.sh
#
# This script is automatically run by the postinst configure step on
#   installation of wasta-xfce-common.  It can be manually re-run, but is
#   only intended to be run at package installation.
#
# 2018-12-20 rik: initial script
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
echo "*** Beginning wasta-xfce-postinst.sh"
echo

# Setup Diretory for later reference
DIR=/usr/share/wasta-xfce

# ------------------------------------------------------------------------------
# Arc-Theme fixes so usable for windowck plugin
# ------------------------------------------------------------------------------
if [ -e "/usr/share/themes/Arc-Darker" ];
then
    if ! [ -e "/usr/share/themes/Arc-Darker/unity/close_focused_normal.png" ];
    then
        echo
        echo "*** Making Arc-Darker theme compatible with windowck plugin"
        echo
        ln -s /usr/share/themes/Arc-Darker/unity/close_focused_normal.svg \
            /usr/share/themes/Arc-Darker/unity/close_focused_normal.png
    fi
fi

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
echo "*** Finished with wasta-xfce-postinst.sh"
echo

exit 0
