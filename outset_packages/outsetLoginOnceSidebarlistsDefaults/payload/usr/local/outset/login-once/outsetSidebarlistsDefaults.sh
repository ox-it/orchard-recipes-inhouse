#!/bin/bash
#
# Set Sidebar preferences defaults (previously done in MCX) 
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

defaults write com.appleSidebarlists com.apple.NetworkBrowser.backToMyMacEnabled FALSE 
defaults write com.appleSidebarlists com.apple.NetworkBrowser.bonjourEnabled FALSE
defaults write com.appleSidebarlists com.apple.NetworkBrowser.connectedEnabled TRUE
