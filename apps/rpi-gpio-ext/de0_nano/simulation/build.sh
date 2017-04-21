#!/bin/sh

#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------
#--                                                                         --
#--  This file is part of the DSP-Crowd project                             --
#--  https://www.dsp-crowd.com                                              --
#--                                                                         --
#--  Author(s):                                                             --
#--      - Johannes Natter, office@dsp-crowd.com                            --
#--                                                                         --
#-----------------------------------------------------------------------------
#--                                                                         --
#--  Copyright (C) 2017 Authors and www.dsp-crowd.com                       --
#--                                                                         --
#--  This program is free software: you can redistribute it and/or modify   --
#--  it under the terms of the GNU General Public License as published by   --
#--  the Free Software Foundation, either version 3 of the License, or      --
#--  (at your option) any later version.                                    --
#--                                                                         --
#--  This program is distributed in the hope that it will be useful,        --
#--  but WITHOUT ANY WARRANTY; without even the implied warranty of         --
#--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the           --
#--  GNU General Public License for more details.                           --
#--                                                                         --
#--  You should have received a copy of the GNU General Public License      --
#--  along with this program. If not, see <http://www.gnu.org/licenses/>.   --
#--                                                                         --
#-----------------------------------------------------------------------------
#-----------------------------------------------------------------------------

src_root=../src

vlib work
vmap work work

vcom ${src_root}/global_pkg.vhd
vcom ${src_root}/input_sync.vhd
vcom ${src_root}/input_debounce.vhd
vcom ${src_root}/frequency_divider.vhd
vcom ${src_root}/frequency_divider_tb.vhd
vcom ${src_root}/strobe_gen.vhd

vcom ${src_root}/altremote_pulsed.vhd
vcom ${src_root}/altremote_pulsed_tb.vhd
vcom ${src_root}/spi-slave.vhd
vcom ${src_root}/gpio-ext.vhd

vcom ${src_root}/tbd_rr_base.vhd
vcom ${src_root}/tbd_rr_base_tb.vhd
