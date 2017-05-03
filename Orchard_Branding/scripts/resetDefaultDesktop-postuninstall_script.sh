#!/bin/bash
#
# Undoes the changes made by script payload/usr/local/boot-once/setDefaultDesktopPicture.sh
# For inclusion in pkginfo postuninstall_script key of Orchard_Branding package.
#
# Copyright (C) 2017 Oxford University
#    Christopher Beard christopher.beard(at)it.ox.ac.uk>
#
# This program is free software; you can redistribute
# it and/or modify it under the terms of the GNU
# General Public License version 3 as published by
# the Free Software Foundation.
#
################################################################################!/bin/bash

OS_DESKTOPS='/Library/Desktop Pictures'
OS_VERSION=$(sw_vers -productVersion | /usr/bin/awk -F'.' '{ print $2 }') || { echo "Could not extract OS version."; exit 1; }

function restoreDefaultDesktop {
  local OS_DEFAULT=$1  

  # Stop if the default file is not a symlink
  [ ! -h "${OS_DESKTOPS}/${OS_DEFAULT}" ] &amp;&amp; { echo "ERROR: Default desktop file '${OS_DESKTOPS}/${OS_DEFAULT}' is not a symlink, exiting."; exit 1; }

  echo "Removing symlink '${OS_DESKTOPS}/${OS_DEFAULT}' to '${ORCHARD_DESKTOP}'"
  rm "${OS_DESKTOPS}/${OS_DEFAULT}"

  echo "Renaming 'Default - ${OS_DEFAULT}' back to ${OS_DESKTOPS}/${OS_DEFAULT}" 
  mv "${OS_DESKTOPS}/Default - ${OS_DEFAULT}" "${OS_DESKTOPS}/${OS_DEFAULT}"
}

case $OS_VERSION in
  10)
    echo "OS X 10.10 detected."
    restoreDefaultDesktop 'Yosemite.jpg'
    ;;
  11)
    echo "OS X 10.11 detected."
    restoreDefaultDesktop 'El Capitan.jpg'
    ;; 
  12)
    echo "macOS 10.12 detected." 
    restoreDefaultDesktop 'Sierra.jpg'
    ;;
  *)
    echo "ERROR: Unsupported macOS version."
    exit 1
    ;;
esac
