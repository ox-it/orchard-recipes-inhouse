#!/bin/bash
"""
disableSquirrelUpdates.sh

Script to disable most Squirrel updaters in Electron apps by
setting an environment variable. Note: does NOT work in Slack

Copyright (C) University of Oxford 2018
    Ben Goodstein <ben.goodstein at it.ox.ac.uk>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
"""

/bin/launchctl setenv DISABLE_UPDATE_CHECK 1
