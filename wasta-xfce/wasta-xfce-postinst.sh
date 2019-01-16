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
# Setup default xfce layout
# ------------------------------------------------------------------------------
# use xfce4-redmond-lite if nothing already set
if ! [ -d /etc/xdg/xdg-xfce/xfce4/xfconf ];
then
    echo
    echo "*** Setting xfce4-wasta-default as default xfce layout"
    echo
    mkdir -p /etc/xdg/xdg-xfce
    ln -sf $DIR/resources/xfce4-wasta-default /etc/xdg/xdg-xfce/xfce4
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
