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
ORCHARD_DESKTOP='/Library/Orchard/Artwork/Desktop_Pictures/Oxford-Crest-Centre.jpg'

function applyOrchardDesktop {
  local OS_DEFAULT=$1

  # Stop if the default file is already a symlink
  [ -h "${OS_DESKTOPS}/${OS_DEFAULT}" ] && { echo "Default desktop file '${OS_DESKTOPS}/${OS_DEFAULT}' is already a symlink, exiting."; exit 1; }

  echo "Renaming ${OS_DESKTOPS}/${OS_DEFAULT} to 'Default - ${OS_DEFAULT}'"
  mv "${OS_DESKTOPS}/${OS_DEFAULT}" "${OS_DESKTOPS}/Default - ${OS_DEFAULT}"

  echo "Creating symlink ${OS_DESKTOPS}/${OS_DEFAULT} to ${ORCHARD_DESKTOP}"
  ln -s "${ORCHARD_DESKTOP}" "${OS_DESKTOPS}/${OS_DEFAULT}"
}

OS_VERSION=$(sw_vers -productVersion | /usr/bin/awk -F'.' '{ print $2 }') || { echo "Could not extract OS version."; exit 1; }

case $OS_VERSION in
  10)
    echo "OS X 10.10 detected."
    applyOrchardDesktop 'Yosemite.jpg'
    ;;
  11)
    echo "OS X 10.11 detected."
    applyOrchardDesktop 'El Capitan.jpg'
    ;;
  *)
    echo "ERROR: Unsupported Mac OS X version."
    exit 1
    ;;
esac
