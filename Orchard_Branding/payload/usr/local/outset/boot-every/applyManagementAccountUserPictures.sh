#!/bin/bash

# Sets account User Picture for:
# - Orchard management account (orchard)
# - Site admin (sadmin)
# - Local admin (ladmin)
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

ORCHARD_SHORTNAME='orchard'
ORCHARD_PICTURE='/Library/Orchard/Artwork/User_Pictures/orchard_user_picture.png'
SADMIN_SHORTNAME='sadmin'
SADMIN_PICTURE='/Library/Orchard/Artwork/User_Pictures/sadmin_user_picture.png'
LADMIN_SHORTNAME='ladmin'
LADMIN_PICTURE='/Library/Orchard/Artwork/User_Pictures/ladmin_user_picture.png'

function applyUserPicture {
  local SHORTNAME=$1
  local PICTURE=$2
  echo "INFO: Applying user picture to account '${SHORTNAME}':"
  # Test first if user exists
  if ( dscl . -read /Users/${SHORTNAME} >/dev/null 2>&1 ); then
    # Remove any existing picture
    dscl . delete /Users/${SHORTNAME} jpegphoto
    dscl . delete /Users/${SHORTNAME} Picture
    dscl . create /Users/${SHORTNAME} Picture "${PICTURE}"
    [[ $? -eq 0 ]] || { echo "ERROR: Problem modifying 'Picture' attribute of '${SHORTNAME}' account."; return;}
    echo "INFO: '${SHORTNAME}' account Picture attribute updated to ${PICTURE}"
  else
    echo "WARNING: User '${SHORTNAME}' does not exist."
  fi
}

applyUserPicture "${ORCHARD_SHORTNAME}" "${ORCHARD_PICTURE}"
applyUserPicture "${SADMIN_SHORTNAME}" "${SADMIN_PICTURE}"
applyUserPicture "${LADMIN_SHORTNAME}" "${LADMIN_PICTURE}"
