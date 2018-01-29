#!/bin/bash
#
# Set Locale preferences defaults (previously done in MCX) 
#
# Copyright (C) 2017 University of Oxford IT Services 
#     Chris Beard <christopher.beard(at)it.ox.ac.uk>
#
# This program is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License version 3 as published by the
# Free Software Foundation.
#
# $HeadURL$
# $LastChangedRevision$
# $LastChangedDate$
# $LastChangedBy$

# Sets region but not language
defaults write .GlobalPreferences AppleLocale en_GB
