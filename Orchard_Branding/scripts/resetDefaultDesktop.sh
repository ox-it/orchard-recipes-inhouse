#!/bin/bash

OS_DESKTOPS='/Library/Desktop Pictures'
DEFAULT_DESKTOP='El Capitan.jpg'
ORCHARD_DESKTOP='/Library/Orchard/Artwork/Desktop_Pictures/Oxford-Crest-Centre.jpg'

# Remove link
rm "${OS_DESKTOPS}/${DEFAULT_DESKTOP}"
# Rename jpg to original
mv "${OS_DESKTOPS}/Default - ${DEFAULT_DESKTOP}" "${OS_DESKTOPS}/${DEFAULT_DESKTOP}"
