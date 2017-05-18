#!/bin/bash
#
# Moves aside existing default OS Desktop Picture and creates symlink with same
# name pointing to Orchard default Desktop Picture.
#
# Copyright (C) 2016 Oxford University
#    Christopher Beard christopher.beard(at)it.ox.ac.uk>
#
# This program is free software; you can redistribute
# it and/or modify it under the terms of the GNU
# General Public License version 3 as published by
# the Free Software Foundation.
#
###############################################################################
OS_DESKTOPS='/Library/Desktop Pictures'
ORCHARD_DEFAULT='Oxford-Crest-Centre.jpg'
OS_VERSION=$(sw_vers -productVersion | /usr/bin/awk -F'.' '{ print $2 }') || { echo "Could not extract OS version."; exit 1; }
BREADCRUMB="/Library/Orchard/desktopPictureChanged"

function applyOrchardDesktop {
  local OS_DEFAULT=$1

  echo "Renaming '${OS_DESKTOPS}/${OS_DEFAULT}' to 'Default - ${OS_DEFAULT}'"
  mv "${OS_DESKTOPS}/${OS_DEFAULT}" "${OS_DESKTOPS}/Default - ${OS_DEFAULT}"

  echo "Creating symlink in '${OS_DESKTOPS}' from '${OS_DEFAULT}' to '${ORCHARD_DEFAULT}'"
  ln -s "${OS_DESKTOPS}/${ORCHARD_DEFAULT}" "${OS_DESKTOPS}/${OS_DEFAULT}"

  echo "Dropping breadcrumb '${BREADCRUMB}' to tell script not to make changes on next run (when package is updated)"
  touch "${BREADCRUMB}"
}

if [ -e "${BREADCRUMB}" ]; then
  echo "Breadcrumb '${BREADCRUMB}' exists, exiting without making changes"
  exit 0
fi

case $OS_VERSION in
  10)
    echo "OS X 10.10 detected."
    applyOrchardDesktop 'Yosemite.jpg'
    ;;
  11)
    echo "OS X 10.11 detected."
    applyOrchardDesktop 'El Capitan.jpg'
    ;;
  12)
    echo "macOS 10.12 detected."
    applyOrchardDesktop 'Sierra.jpg'
    ;;
  *)
    echo "ERROR: Unsupported macOS version."
    exit 1
    ;;
esac
