# orchard-recipes-inhouse
In-house recipes used by the Orchard team at Oxford University for general purpose packaging

## Fonts_Freefonts

AutoPkg recipe to create a package containing one or more fonts. We use this in Orchard to package a number of free licensed / freeware fonts for distribution. We also use it in a private repo for distributing copyright fonts.

Fonts to be packaged should be placed in `<RECIPE-DIR>/payload/Library/Fonts` and the package is created in `<RECIPE-DIR>/build`. The recipe sets correct permissions on the font files.

## Orchard_Branding

We use [outset](https://github.com/chilcote/outset) in Orchard to run scripts at boot, including some to apply branding graphics like desktops and user pictures. (outset can also run scripts at login and more. Graham Gilbert has an [AutoPkg recipe](https://github.com/grahamgilbert/autopkg-recipes/tree/master/outset) for outset.) 

`Orchard_Branding.pkg.recipe` - This is an AutoPkg recipe to package the following:
- custom Desktop Pictures and User Pictures (i.e. account icons), with the correct permissions for them to be able to be moved into the local Library. 
- scripts run by outset at boot to apply the graphics: `setDefaultDesktopPicture.sh` (boot-once), `applyManagementAccountUserPictures.sh` (boot-every). 

The pkg gets a manually-updated version number, we're using the date in `yyyymmdd`.

`Orchard_Branding.munki.recipe` - AutoPkg recipe to run the .pkg.recipe and import the package to a munki repo. 
- Includes a 'requires' dependency for outset. 
- pkginfo includes a post-uninstall script which undoes the outset script `setDefaultDesktopPicture.sh`. The code can be found in `scripts/resetDefaultDesktop-postuninstall_script.sh`.
