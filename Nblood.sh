#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="Nblood"
rp_module_desc="Nblood - Blood source port"
rp_module_licence="GPL3 https://github.com/OpenMW/osg/blob/3.4/LICENSE.txt"
rp_module_help="you need to put the 
BLOOD.INI, 
BLOOD.RFF, 
BLOOD000.DEM, ..., BLOOD003.DEM (optional), 
GUI.RFF, 
SOUNDS.RFF, 
SURFACE.DAT, 
TILES000.ART, ..., TILES017.ART, 
VOXEL.DAT in $romdir/ports/Nblood

Cryptic Passage
CP01.MAP, ..., CP09.MAP,
CPART07.AR_, 
CPART15.AR_, 
CPBB01.MAP, ..., CPBB04.MAP, 
CPSL.MAP, 
CRYPTIC.INI 
CRYPTIC.SMK 
CRYPTIC.WAV "
rp_module_section="exp"
rp_module_flags=""


function depends_Nblood() {
   getDepends cmake build-essential build-essential nasm libgl1-mesa-dev libglu1-mesa-dev libsdl1.2-dev libsdl-mixer1.2-dev libsdl2-dev libsdl2-mixer-dev flac libflac-dev libvorbis-dev libvpx-dev libgtk2.0-dev freepats
  
}

function sources_Nblood() {
	gitPullOrClone "$md_build" https://github.com/Exarkuniv/NBlood.git
}

function build_Nblood() {
    cd $md_build
   make blood
	md_ret_require="$md_build"
}

function install_Nblood() {
    md_ret_files=(        
        'nblood'
		'nblood.pk3'
		'settings.cfg'
		'nblood.cfg'
    )
}
	
function configure_Nblood() {
	mkdir "$home/.config/nblood"
	cp -v settings.cfg "$home/.config/nblood"
	cp -v nblood.cfg "$home/.config/nblood"
	
	mkRomDir "ports/Nblood"
	mkRomDir "ports/Nblood/CP"
	
	addPort "$md_id" "nblood" "Nblood - Blood source port" "$md_inst/nblood  -j=/home/pi/RetroPie/roms/ports/Nblood"	
	addPort "$md_id" "nblood" "Nblood - Cryptic Passage " "$md_inst/nblood -ini CRYPTIC.INI -j=/home/pi/RetroPie/roms/ports/Nblood/CP"
	

}
