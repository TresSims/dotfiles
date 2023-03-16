#! /usr/bin/fish

set -Ux HFS /opt/hfs19.5/

set -Ux H $HFS
set -Ux HB $H/bin
set -Ux HDSO $H/dsolib
set -Ux HH $H/houdini
set -Ux HHC $HH/config
set -Ux HHP $HH/python3.7lib
set -Ux HT $H/toolkit
set -Ux HSB $HH/sbin

if ! type -f houdini
        set -Ux fish_user_paths $fish_user_paths $HB
end

if ! type -f sesinetd
        set -Ux fish_user_paths $fish_user_paths $HSB
end
