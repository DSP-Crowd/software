set_global_assignment -entity "altremote" -library "lib_altremote" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "altremote" -library "lib_altremote" -name IP_TOOL_VERSION "14.0"
set_global_assignment -entity "altremote" -library "lib_altremote" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_altremote" -name SPD_FILE [file join $::quartus(sip_path) "../altremote.spd"]
set_global_assignment -library "lib_altremote" -name MISC_FILE [file join $::quartus(sip_path) "../../altremote.qsys"]

set_global_assignment -library "lib_altremote" -name MISC_FILE [file join $::quartus(sip_path) "altremote.vhd"]
set_global_assignment -library "lib_altremote" -name MISC_FILE [file join $::quartus(sip_path) "submodules/altremote_remote_update_0.vhd"]
