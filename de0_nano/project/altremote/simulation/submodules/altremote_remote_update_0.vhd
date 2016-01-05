--altremote_update CBX_AUTO_BLACKBOX="ALL" CBX_SINGLE_OUTPUT_FILE="ON" check_app_pof="false" config_device_addr_width=24 DEVICE_FAMILY="Cyclone IV E" in_data_width=24 is_epcq="false" operation_mode="remote" out_data_width=29 busy clock data_in data_out param read_param read_source reconfig reset reset_timer write_param
--VERSION_BEGIN 14.0 cbx_altremote_update 2014:06:05:09:45:41:SJ cbx_cycloneii 2014:06:05:09:45:41:SJ cbx_lpm_add_sub 2014:06:05:09:45:41:SJ cbx_lpm_compare 2014:06:05:09:45:41:SJ cbx_lpm_counter 2014:06:05:09:45:41:SJ cbx_lpm_decode 2014:06:05:09:45:41:SJ cbx_lpm_shiftreg 2014:06:05:09:45:41:SJ cbx_mgl 2014:06:05:10:17:12:SJ cbx_nightfury 2014:06:05:09:45:41:SJ cbx_stratix 2014:06:05:09:45:41:SJ cbx_stratixii 2014:06:05:09:45:41:SJ  VERSION_END


-- Copyright (C) 1991-2014 Altera Corporation. All rights reserved.
--  Your use of Altera Corporation's design tools, logic functions 
--  and other software and tools, and its AMPP partner logic 
--  functions, and any output files from any of the foregoing 
--  (including device programming or simulation files), and any 
--  associated documentation or information are expressly subject 
--  to the terms and conditions of the Altera Program License 
--  Subscription Agreement, the Altera Quartus II License Agreement,
--  the Altera MegaCore Function License Agreement, or other 
--  applicable license agreement, including, without limitation, 
--  that your use is for the sole purpose of programming logic 
--  devices manufactured by Altera and sold by Altera or its 
--  authorized distributors.  Please refer to the applicable 
--  agreement for further details.



 LIBRARY cycloneive;
 USE cycloneive.all;

 LIBRARY lpm;
 USE lpm.all;

--synthesis_resources = cycloneive_rublock 1 lpm_counter 2 reg 62 
 LIBRARY ieee;
 USE ieee.std_logic_1164.all;

 ENTITY  altremote_remote_update_0 IS 
	 PORT 
	 ( 
		 busy	:	OUT  STD_LOGIC;
		 clock	:	IN  STD_LOGIC;
		 data_in	:	IN  STD_LOGIC_VECTOR (23 DOWNTO 0) := (OTHERS => '0');
		 data_out	:	OUT  STD_LOGIC_VECTOR (28 DOWNTO 0);
		 param	:	IN  STD_LOGIC_VECTOR (2 DOWNTO 0) := (OTHERS => '0');
		 read_param	:	IN  STD_LOGIC := '0';
		 read_source	:	IN  STD_LOGIC_VECTOR (1 DOWNTO 0) := (OTHERS => '0');
		 reconfig	:	IN  STD_LOGIC := '0';
		 reset	:	IN  STD_LOGIC;
		 reset_timer	:	IN  STD_LOGIC := '0';
		 write_param	:	IN  STD_LOGIC := '0'
	 ); 
 END altremote_remote_update_0;

 ARCHITECTURE RTL OF altremote_remote_update_0 IS

	 ATTRIBUTE synthesis_clearbox : natural;
	 ATTRIBUTE synthesis_clearbox OF RTL : ARCHITECTURE IS 1;
	 ATTRIBUTE ALTERA_ATTRIBUTE : string;
	 ATTRIBUTE ALTERA_ATTRIBUTE OF RTL : ARCHITECTURE IS "suppress_da_rule_internal=c104;suppress_da_rule_internal=C101;suppress_da_rule_internal=C103";

	 SIGNAL	 check_busy_dffe	:	STD_LOGIC_VECTOR(0 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe1a0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe1a1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 wire_dffe1a_ena	:	STD_LOGIC_VECTOR(1 DOWNTO 0);
	 SIGNAL	 dffe2a0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe2a1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe2a2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 wire_dffe2a_ena	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	 SIGNAL	 dffe3a0	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe3a1	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe3a2	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 wire_dffe3a_ena	:	STD_LOGIC_VECTOR(2 DOWNTO 0);
	 SIGNAL	 dffe7a	:	STD_LOGIC_VECTOR(28 DOWNTO 0)
	 -- synopsys translate_off
	  := "00000000000000000000000000000"
	 -- synopsys translate_on
	 ;
	 SIGNAL	 wire_dffe7a_ena	:	STD_LOGIC_VECTOR(28 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range277w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range325w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range330w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range335w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range340w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range345w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range350w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range355w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range360w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range365w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range370w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range282w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range375w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range380w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range385w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range390w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range395w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range400w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range405w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range410w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range415w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range285w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range290w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range295w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range300w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range305w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range310w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range315w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_dffe7a_w_q_range320w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL	 dffe8	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 dffe9a	:	STD_LOGIC_VECTOR(6 DOWNTO 0)
	 -- synopsys translate_off
	  := (OTHERS => '0')
	 -- synopsys translate_on
	 ;
	 SIGNAL	 wire_dffe9a_ena	:	STD_LOGIC_VECTOR(6 DOWNTO 0);
	 SIGNAL	 idle_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 idle_write_wait	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 read_address_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 wire_read_address_state_ena	:	STD_LOGIC;
	 SIGNAL	 read_data_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 read_init_counter_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 read_init_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 read_post_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 read_pre_data_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 read_source_update_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 write_data_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 write_init_counter_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 write_init_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 write_load_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 write_post_data_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 write_pre_data_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 write_source_update_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL	 write_wait_state	:	STD_LOGIC
	 -- synopsys translate_off
	  := '0'
	 -- synopsys translate_on
	 ;
	 SIGNAL  wire_cntr5_w_lg_w_q_range39w42w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_cntr5_w_lg_w_q_range40w41w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_cntr5_q	:	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  wire_cntr5_w_q_range39w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_cntr5_w_q_range40w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_cntr6_q	:	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  wire_sd4_regout	:	STD_LOGIC;
	 SIGNAL  wire_w1042w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1072w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1054w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1049w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1116w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1076w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1082w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1139w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1108w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1061w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1131w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1122w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1144w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1098w1099w1100w1101w1103w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1098w1124w1125w1126w1127w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1064w1110w1111w1112w1113w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1064w1065w1066w1067w1068w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1064w1065w1133w1134w1135w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1084w1092w1093w1094w1095w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1084w1085w1086w1087w1088w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1028w1031w1034w1037w1040w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1028w1031w1034w1070w1071w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1028w1031w1051w1052w1053w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1046w1047w1048w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1046w1047w1115w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1046w1074w1075w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1079w1080w1081w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1079w1137w1138w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1056w1057w1105w1106w1107w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1056w1057w1058w1059w1060w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1056w1057w1058w1129w1130w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1056w1118w1119w1120w1121w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_lg_w1056w1118w1141w1142w1143w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1098w1099w1100w1101w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1098w1124w1125w1126w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1064w1110w1111w1112w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1064w1065w1066w1067w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1064w1065w1133w1134w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1084w1092w1093w1094w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1084w1085w1086w1087w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1028w1031w1034w1037w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1028w1031w1034w1070w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1028w1031w1051w1052w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1028w1045w1046w1047w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1028w1045w1046w1074w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1028w1045w1079w1080w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1028w1045w1079w1137w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1056w1057w1105w1106w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1056w1057w1058w1059w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1056w1057w1058w1129w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1056w1118w1119w1120w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w1056w1118w1141w1142w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1098w1099w1100w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1098w1124w1125w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1064w1110w1111w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1064w1065w1066w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1064w1065w1133w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1084w1092w1093w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1084w1085w1086w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1028w1031w1034w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1028w1031w1051w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1028w1045w1046w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1028w1045w1079w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1056w1057w1105w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1056w1057w1058w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1056w1118w1119w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w1056w1118w1141w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w172w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w179w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w186w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w193w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w200w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w207w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w214w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w221w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w228w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w235w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w242w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w249w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w256w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w263w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w115w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w123w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w130w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w137w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w144w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w151w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w158w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w165w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1098w1099w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1098w1124w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1064w1110w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1064w1065w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1084w1092w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1084w1085w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1028w1031w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1028w1045w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1056w1057w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1056w1118w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_idle1179w1180w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_param_range109w110w111w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1098w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1064w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1084w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w113w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w184w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w191w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w198w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w205w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w212w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w219w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w226w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w233w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w240w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w247w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w121w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w254w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w261w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w128w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w135w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w142w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w149w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w156w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w163w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w170w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w177w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w279w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w326w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w331w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w336w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w341w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w346w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w351w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w356w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w361w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w366w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w371w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w283w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w376w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w381w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w386w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w391w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w396w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w401w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w406w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w411w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w416w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w286w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w291w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w296w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w301w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w306w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w311w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w316w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address278w321w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_rsource_load13w14w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_rsource_load13w21w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_rsource_load13w25w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_rsource_load13w31w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_rsource_load13w35w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w103w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w176w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w183w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w190w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w197w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w204w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w211w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w218w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w225w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w232w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w239w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w119w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w246w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w253w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w260w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w127w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w134w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w141w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w148w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w155w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w162w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable101w169w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1028w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w1056w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_source_update1237w1238w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_idle1179w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address287w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address337w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address342w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address347w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address352w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address357w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address362w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address367w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address372w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address377w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address382w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address292w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address387w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address392w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address397w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address402w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address407w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address412w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address417w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address297w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address302w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address307w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address312w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address317w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address322w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address327w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address332w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_data1196w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_init_counter1192w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_post1202w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_pre_data1191w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rsource_load16w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rsource_load23w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rsource_load27w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rsource_load33w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rsource_load37w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rublock_regout_reg1243w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable174w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable181w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable188w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable195w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable202w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable209w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable216w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable223w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable230w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable237w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable244w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable251w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable258w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable265w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable117w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable125w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable132w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable139w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable146w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable153w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable160w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable167w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_data1214w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_init_counter1211w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_post_data1220w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_pre_data1210w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_range109w110w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_decoder_param_latch_range1024w1097w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_decoder_param_latch_range1024w1063w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_w4w_range1264w1265w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_w4w_range1268w1269w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_bit_counter_all_done1213w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_bit_counter_param_start_match1190w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_idle1160w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_address278w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_data1155w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_init1159w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_init_counter1157w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_post1154w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_pre_data1156w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_source_update1158w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rsource_load13w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rsource_update_done1187w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_select_shift_nloop1242w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable101w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w1w1178w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w2w1177w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w8w274w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_width_counter_all_done1194w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_width_counter_param_width_match1195w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_data1149w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_init1153w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_init_counter1152w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_load1147w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_post_data1148w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_pre_data1150w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_source_update1151w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_write_wait1146w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_wsource_update_done1207w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_range105w106w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_range107w108w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_decoder_param_latch_range1024w1025w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_decoder_param_latch_range1026w1027w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_decoder_param_latch_range1029w1030w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_decoder_param_latch_range1032w1033w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_decoder_param_latch_range1035w1036w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_decoder_param_latch_range1038w1039w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_param_decoder_param_latch_range1041w1102w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w173w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w180w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w187w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w194w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w201w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w208w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w215w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w222w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w229w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w236w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w243w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w250w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w257w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w264w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w116w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w124w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w131w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w138w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w145w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w152w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w159w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w166w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_lg_idle1179w1180w1181w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address287w288w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address337w338w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address342w343w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address347w348w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address352w353w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address357w358w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address362w363w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address367w368w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address372w373w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address377w378w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address382w383w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address292w293w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address387w388w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address392w393w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address397w398w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address402w403w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address407w408w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address412w413w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address417w418w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address297w298w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address302w303w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address307w308w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address312w313w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address317w318w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address322w323w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address327w328w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_read_address332w333w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_w4w_range1264w1265w1266w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_w_w4w_range1268w1269w1270w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_w_lg_shift_reg_load_enable99w100w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_read_source_update1237w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rsource_load18w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_rsource_load9w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_lg_shift_reg_load_enable99w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  bit_counter_all_done :	STD_LOGIC;
	 SIGNAL  bit_counter_clear :	STD_LOGIC;
	 SIGNAL  bit_counter_enable :	STD_LOGIC;
	 SIGNAL  bit_counter_param_start :	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  bit_counter_param_start_match :	STD_LOGIC;
	 SIGNAL  combine_port :	STD_LOGIC_VECTOR (6 DOWNTO 0);
	 SIGNAL  global_gnd :	STD_LOGIC;
	 SIGNAL  global_vcc :	STD_LOGIC;
	 SIGNAL  idle :	STD_LOGIC;
	 SIGNAL  param_decoder_param_latch :	STD_LOGIC_VECTOR (6 DOWNTO 0);
	 SIGNAL  param_decoder_select :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  power_up :	STD_LOGIC;
	 SIGNAL  read_address :	STD_LOGIC;
	 SIGNAL  read_data :	STD_LOGIC;
	 SIGNAL  read_init :	STD_LOGIC;
	 SIGNAL  read_init_counter :	STD_LOGIC;
	 SIGNAL  read_post :	STD_LOGIC;
	 SIGNAL  read_pre_data :	STD_LOGIC;
	 SIGNAL  read_source_update :	STD_LOGIC;
	 SIGNAL  rsource_load :	STD_LOGIC;
	 SIGNAL  rsource_parallel_in :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  rsource_serial_out :	STD_LOGIC;
	 SIGNAL  rsource_shift_enable :	STD_LOGIC;
	 SIGNAL  rsource_state_par_ini :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  rsource_update_done :	STD_LOGIC;
	 SIGNAL  rublock_captnupdt :	STD_LOGIC;
	 SIGNAL  rublock_clock :	STD_LOGIC;
	 SIGNAL  rublock_reconfig :	STD_LOGIC;
	 SIGNAL  rublock_reconfig_st :	STD_LOGIC;
	 SIGNAL  rublock_regin :	STD_LOGIC;
	 SIGNAL  rublock_regout :	STD_LOGIC;
	 SIGNAL  rublock_regout_reg :	STD_LOGIC;
	 SIGNAL  rublock_shiftnld :	STD_LOGIC;
	 SIGNAL  select_shift_nloop :	STD_LOGIC;
	 SIGNAL  shift_reg_clear :	STD_LOGIC;
	 SIGNAL  shift_reg_load_enable :	STD_LOGIC;
	 SIGNAL  shift_reg_serial_in :	STD_LOGIC;
	 SIGNAL  shift_reg_serial_out :	STD_LOGIC;
	 SIGNAL  shift_reg_shift_enable :	STD_LOGIC;
	 SIGNAL  start_bit_decoder_out :	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  start_bit_decoder_param_select :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  w1w :	STD_LOGIC;
	 SIGNAL  w2w :	STD_LOGIC;
	 SIGNAL  w4w :	STD_LOGIC_VECTOR (1 DOWNTO 0);
	 SIGNAL  w53w :	STD_LOGIC_VECTOR (5 DOWNTO 0);
	 SIGNAL  w83w :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  w8w :	STD_LOGIC;
	 SIGNAL  width_counter_all_done :	STD_LOGIC;
	 SIGNAL  width_counter_clear :	STD_LOGIC;
	 SIGNAL  width_counter_enable :	STD_LOGIC;
	 SIGNAL  width_counter_param_width :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  width_counter_param_width_match :	STD_LOGIC;
	 SIGNAL  width_decoder_out :	STD_LOGIC_VECTOR (4 DOWNTO 0);
	 SIGNAL  width_decoder_param_select :	STD_LOGIC_VECTOR (22 DOWNTO 0);
	 SIGNAL  write_data :	STD_LOGIC;
	 SIGNAL  write_init :	STD_LOGIC;
	 SIGNAL  write_init_counter :	STD_LOGIC;
	 SIGNAL  write_load :	STD_LOGIC;
	 SIGNAL  write_post_data :	STD_LOGIC;
	 SIGNAL  write_pre_data :	STD_LOGIC;
	 SIGNAL  write_source_update :	STD_LOGIC;
	 SIGNAL  write_wait :	STD_LOGIC;
	 SIGNAL  wsource_state_par_ini :	STD_LOGIC_VECTOR (2 DOWNTO 0);
	 SIGNAL  wsource_update_done :	STD_LOGIC;
	 SIGNAL  wire_w_data_in_range104w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range171w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range178w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range185w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range192w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range199w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range206w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range213w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range220w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range227w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range234w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range120w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range241w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range248w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range255w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range262w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range114w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range122w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range129w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range136w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range143w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range150w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range157w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_data_in_range164w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_range105w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_range107w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_range109w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_decoder_param_latch_range1024w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_decoder_param_latch_range1026w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_decoder_param_latch_range1029w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_decoder_param_latch_range1032w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_decoder_param_latch_range1035w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_decoder_param_latch_range1038w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_param_decoder_param_latch_range1041w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_rsource_parallel_in_range15w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_rsource_state_par_ini_range22w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_rsource_state_par_ini_range26w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_w4w_range1264w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_w4w_range1268w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_wsource_state_par_ini_range32w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 SIGNAL  wire_w_wsource_state_par_ini_range36w	:	STD_LOGIC_VECTOR (0 DOWNTO 0);
	 COMPONENT  lpm_counter
	 GENERIC 
	 (
		lpm_avalue	:	STRING := "0";
		lpm_direction	:	STRING := "DEFAULT";
		lpm_modulus	:	NATURAL := 0;
		lpm_port_updown	:	STRING := "PORT_CONNECTIVITY";
		lpm_pvalue	:	STRING := "0";
		lpm_svalue	:	STRING := "0";
		lpm_width	:	NATURAL;
		lpm_type	:	STRING := "lpm_counter"
	 );
	 PORT
	 ( 
		aclr	:	IN STD_LOGIC := '0';
		aload	:	IN STD_LOGIC := '0';
		aset	:	IN STD_LOGIC := '0';
		cin	:	IN STD_LOGIC := '1';
		clk_en	:	IN STD_LOGIC := '1';
		clock	:	IN STD_LOGIC;
		cnt_en	:	IN STD_LOGIC := '1';
		cout	:	OUT STD_LOGIC;
		data	:	IN STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0) := (OTHERS => '0');
		eq	:	OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
		q	:	OUT STD_LOGIC_VECTOR(LPM_WIDTH-1 DOWNTO 0);
		sclr	:	IN STD_LOGIC := '0';
		sload	:	IN STD_LOGIC := '0';
		sset	:	IN STD_LOGIC := '0';
		updown	:	IN STD_LOGIC := '1'
	 ); 
	 END COMPONENT;
	 COMPONENT  cycloneive_rublock
	 PORT
	 ( 
		captnupdt	:	IN STD_LOGIC;
		clk	:	IN STD_LOGIC;
		rconfig	:	IN STD_LOGIC;
		regin	:	IN STD_LOGIC;
		regout	:	OUT STD_LOGIC;
		rsttimer	:	IN STD_LOGIC;
		shiftnld	:	IN STD_LOGIC
	 ); 
	 END COMPONENT;
 BEGIN

	wire_w1042w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1028w1031w1034w1037w1040w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w1072w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1028w1031w1034w1070w1071w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w1054w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1028w1031w1051w1052w1053w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w1049w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1046w1047w1048w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w1116w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1046w1047w1115w(0) AND wire_w_lg_w_param_decoder_param_latch_range1041w1102w(0);
	wire_w1076w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1046w1074w1075w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w1082w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1079w1080w1081w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w1139w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1079w1137w1138w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w1108w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1056w1057w1105w1106w1107w(0) AND wire_w_lg_w_param_decoder_param_latch_range1041w1102w(0);
	wire_w1061w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1056w1057w1058w1059w1060w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w1131w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1056w1057w1058w1129w1130w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w1122w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1056w1118w1119w1120w1121w(0) AND wire_w_lg_w_param_decoder_param_latch_range1041w1102w(0);
	wire_w1144w(0) <= wire_w_lg_w_lg_w_lg_w_lg_w1056w1118w1141w1142w1143w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1098w1099w1100w1101w1103w(0) <= wire_w_lg_w_lg_w_lg_w1098w1099w1100w1101w(0) AND wire_w_lg_w_param_decoder_param_latch_range1041w1102w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1098w1124w1125w1126w1127w(0) <= wire_w_lg_w_lg_w_lg_w1098w1124w1125w1126w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1064w1110w1111w1112w1113w(0) <= wire_w_lg_w_lg_w_lg_w1064w1110w1111w1112w(0) AND wire_w_lg_w_param_decoder_param_latch_range1041w1102w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1064w1065w1066w1067w1068w(0) <= wire_w_lg_w_lg_w_lg_w1064w1065w1066w1067w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1064w1065w1133w1134w1135w(0) <= wire_w_lg_w_lg_w_lg_w1064w1065w1133w1134w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1084w1092w1093w1094w1095w(0) <= wire_w_lg_w_lg_w_lg_w1084w1092w1093w1094w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1084w1085w1086w1087w1088w(0) <= wire_w_lg_w_lg_w_lg_w1084w1085w1086w1087w(0) AND wire_w_param_decoder_param_latch_range1041w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1028w1031w1034w1037w1040w(0) <= wire_w_lg_w_lg_w_lg_w1028w1031w1034w1037w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1028w1031w1034w1070w1071w(0) <= wire_w_lg_w_lg_w_lg_w1028w1031w1034w1070w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1028w1031w1051w1052w1053w(0) <= wire_w_lg_w_lg_w_lg_w1028w1031w1051w1052w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1046w1047w1048w(0) <= wire_w_lg_w_lg_w_lg_w1028w1045w1046w1047w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1046w1047w1115w(0) <= wire_w_lg_w_lg_w_lg_w1028w1045w1046w1047w(0) AND wire_w_param_decoder_param_latch_range1038w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1046w1074w1075w(0) <= wire_w_lg_w_lg_w_lg_w1028w1045w1046w1074w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1079w1080w1081w(0) <= wire_w_lg_w_lg_w_lg_w1028w1045w1079w1080w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1028w1045w1079w1137w1138w(0) <= wire_w_lg_w_lg_w_lg_w1028w1045w1079w1137w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1056w1057w1105w1106w1107w(0) <= wire_w_lg_w_lg_w_lg_w1056w1057w1105w1106w(0) AND wire_w_param_decoder_param_latch_range1038w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1056w1057w1058w1059w1060w(0) <= wire_w_lg_w_lg_w_lg_w1056w1057w1058w1059w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1056w1057w1058w1129w1130w(0) <= wire_w_lg_w_lg_w_lg_w1056w1057w1058w1129w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1056w1118w1119w1120w1121w(0) <= wire_w_lg_w_lg_w_lg_w1056w1118w1119w1120w(0) AND wire_w_param_decoder_param_latch_range1038w(0);
	wire_w_lg_w_lg_w_lg_w_lg_w1056w1118w1141w1142w1143w(0) <= wire_w_lg_w_lg_w_lg_w1056w1118w1141w1142w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w1098w1099w1100w1101w(0) <= wire_w_lg_w_lg_w1098w1099w1100w(0) AND wire_w_param_decoder_param_latch_range1038w(0);
	wire_w_lg_w_lg_w_lg_w1098w1124w1125w1126w(0) <= wire_w_lg_w_lg_w1098w1124w1125w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w1064w1110w1111w1112w(0) <= wire_w_lg_w_lg_w1064w1110w1111w(0) AND wire_w_param_decoder_param_latch_range1038w(0);
	wire_w_lg_w_lg_w_lg_w1064w1065w1066w1067w(0) <= wire_w_lg_w_lg_w1064w1065w1066w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w1064w1065w1133w1134w(0) <= wire_w_lg_w_lg_w1064w1065w1133w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w1084w1092w1093w1094w(0) <= wire_w_lg_w_lg_w1084w1092w1093w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w1084w1085w1086w1087w(0) <= wire_w_lg_w_lg_w1084w1085w1086w(0) AND wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0);
	wire_w_lg_w_lg_w_lg_w1028w1031w1034w1037w(0) <= wire_w_lg_w_lg_w1028w1031w1034w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w_lg_w1028w1031w1034w1070w(0) <= wire_w_lg_w_lg_w1028w1031w1034w(0) AND wire_w_param_decoder_param_latch_range1035w(0);
	wire_w_lg_w_lg_w_lg_w1028w1031w1051w1052w(0) <= wire_w_lg_w_lg_w1028w1031w1051w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w_lg_w1028w1045w1046w1047w(0) <= wire_w_lg_w_lg_w1028w1045w1046w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w_lg_w1028w1045w1046w1074w(0) <= wire_w_lg_w_lg_w1028w1045w1046w(0) AND wire_w_param_decoder_param_latch_range1035w(0);
	wire_w_lg_w_lg_w_lg_w1028w1045w1079w1080w(0) <= wire_w_lg_w_lg_w1028w1045w1079w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w_lg_w1028w1045w1079w1137w(0) <= wire_w_lg_w_lg_w1028w1045w1079w(0) AND wire_w_param_decoder_param_latch_range1035w(0);
	wire_w_lg_w_lg_w_lg_w1056w1057w1105w1106w(0) <= wire_w_lg_w_lg_w1056w1057w1105w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w_lg_w1056w1057w1058w1059w(0) <= wire_w_lg_w_lg_w1056w1057w1058w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w_lg_w1056w1057w1058w1129w(0) <= wire_w_lg_w_lg_w1056w1057w1058w(0) AND wire_w_param_decoder_param_latch_range1035w(0);
	wire_w_lg_w_lg_w_lg_w1056w1118w1119w1120w(0) <= wire_w_lg_w_lg_w1056w1118w1119w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w_lg_w1056w1118w1141w1142w(0) <= wire_w_lg_w_lg_w1056w1118w1141w(0) AND wire_w_param_decoder_param_latch_range1035w(0);
	wire_w_lg_w_lg_w1098w1099w1100w(0) <= wire_w_lg_w1098w1099w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w1098w1124w1125w(0) <= wire_w_lg_w1098w1124w(0) AND wire_w_param_decoder_param_latch_range1035w(0);
	wire_w_lg_w_lg_w1064w1110w1111w(0) <= wire_w_lg_w1064w1110w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w1064w1065w1066w(0) <= wire_w_lg_w1064w1065w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w1064w1065w1133w(0) <= wire_w_lg_w1064w1065w(0) AND wire_w_param_decoder_param_latch_range1035w(0);
	wire_w_lg_w_lg_w1084w1092w1093w(0) <= wire_w_lg_w1084w1092w(0) AND wire_w_param_decoder_param_latch_range1035w(0);
	wire_w_lg_w_lg_w1084w1085w1086w(0) <= wire_w_lg_w1084w1085w(0) AND wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0);
	wire_w_lg_w_lg_w1028w1031w1034w(0) <= wire_w_lg_w1028w1031w(0) AND wire_w_lg_w_param_decoder_param_latch_range1032w1033w(0);
	wire_w_lg_w_lg_w1028w1031w1051w(0) <= wire_w_lg_w1028w1031w(0) AND wire_w_param_decoder_param_latch_range1032w(0);
	wire_w_lg_w_lg_w1028w1045w1046w(0) <= wire_w_lg_w1028w1045w(0) AND wire_w_lg_w_param_decoder_param_latch_range1032w1033w(0);
	wire_w_lg_w_lg_w1028w1045w1079w(0) <= wire_w_lg_w1028w1045w(0) AND wire_w_param_decoder_param_latch_range1032w(0);
	wire_w_lg_w_lg_w1056w1057w1105w(0) <= wire_w_lg_w1056w1057w(0) AND wire_w_lg_w_param_decoder_param_latch_range1032w1033w(0);
	wire_w_lg_w_lg_w1056w1057w1058w(0) <= wire_w_lg_w1056w1057w(0) AND wire_w_param_decoder_param_latch_range1032w(0);
	wire_w_lg_w_lg_w1056w1118w1119w(0) <= wire_w_lg_w1056w1118w(0) AND wire_w_lg_w_param_decoder_param_latch_range1032w1033w(0);
	wire_w_lg_w_lg_w1056w1118w1141w(0) <= wire_w_lg_w1056w1118w(0) AND wire_w_param_decoder_param_latch_range1032w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w172w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range171w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w179w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range178w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w186w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range185w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w193w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range192w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w200w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range199w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w207w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range206w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w214w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range213w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w221w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range220w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w228w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range227w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w235w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range234w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w242w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range241w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w249w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range248w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w256w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range255w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w263w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range262w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w115w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range114w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w123w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range122w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w130w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range129w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w137w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range136w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w144w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range143w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w151w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range150w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w158w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range157w(0);
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w165w(0) <= wire_w_lg_w_lg_w_param_range109w110w111w(0) AND wire_w_data_in_range164w(0);
	wire_w_lg_w1098w1099w(0) <= wire_w1098w(0) AND wire_w_lg_w_param_decoder_param_latch_range1032w1033w(0);
	wire_w_lg_w1098w1124w(0) <= wire_w1098w(0) AND wire_w_param_decoder_param_latch_range1032w(0);
	wire_w_lg_w1064w1110w(0) <= wire_w1064w(0) AND wire_w_lg_w_param_decoder_param_latch_range1032w1033w(0);
	wire_w_lg_w1064w1065w(0) <= wire_w1064w(0) AND wire_w_param_decoder_param_latch_range1032w(0);
	wire_w_lg_w1084w1092w(0) <= wire_w1084w(0) AND wire_w_lg_w_param_decoder_param_latch_range1032w1033w(0);
	wire_w_lg_w1084w1085w(0) <= wire_w1084w(0) AND wire_w_param_decoder_param_latch_range1032w(0);
	wire_w_lg_w1028w1031w(0) <= wire_w1028w(0) AND wire_w_lg_w_param_decoder_param_latch_range1029w1030w(0);
	wire_w_lg_w1028w1045w(0) <= wire_w1028w(0) AND wire_w_param_decoder_param_latch_range1029w(0);
	wire_w_lg_w1056w1057w(0) <= wire_w1056w(0) AND wire_w_lg_w_param_decoder_param_latch_range1029w1030w(0);
	wire_w_lg_w1056w1118w(0) <= wire_w1056w(0) AND wire_w_param_decoder_param_latch_range1029w(0);
	wire_w_lg_w_lg_idle1179w1180w(0) <= wire_w_lg_idle1179w(0) AND wire_w_lg_w2w1177w(0);
	wire_w_lg_w_lg_w_param_range109w110w111w(0) <= wire_w_lg_w_param_range109w110w(0) AND wire_w_lg_w_param_range105w106w(0);
	wire_w1098w(0) <= wire_w_lg_w_param_decoder_param_latch_range1024w1097w(0) AND wire_w_lg_w_param_decoder_param_latch_range1029w1030w(0);
	wire_w1064w(0) <= wire_w_lg_w_param_decoder_param_latch_range1024w1063w(0) AND wire_w_lg_w_param_decoder_param_latch_range1029w1030w(0);
	wire_w1084w(0) <= wire_w_lg_w_param_decoder_param_latch_range1024w1063w(0) AND wire_w_param_decoder_param_latch_range1029w(0);
	wire_w113w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range104w(0);
	wire_w184w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range171w(0);
	wire_w191w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range178w(0);
	wire_w198w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range185w(0);
	wire_w205w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range192w(0);
	wire_w212w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range199w(0);
	wire_w219w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range206w(0);
	wire_w226w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range213w(0);
	wire_w233w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range220w(0);
	wire_w240w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range227w(0);
	wire_w247w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range234w(0);
	wire_w121w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range120w(0);
	wire_w254w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range241w(0);
	wire_w261w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range248w(0);
	wire_w128w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range114w(0);
	wire_w135w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range122w(0);
	wire_w142w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range129w(0);
	wire_w149w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range136w(0);
	wire_w156w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range143w(0);
	wire_w163w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range150w(0);
	wire_w170w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range157w(0);
	wire_w177w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) AND wire_w_data_in_range164w(0);
	wire_w_lg_w_lg_read_address278w279w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range277w(0);
	wire_w_lg_w_lg_read_address278w326w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range325w(0);
	wire_w_lg_w_lg_read_address278w331w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range330w(0);
	wire_w_lg_w_lg_read_address278w336w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range335w(0);
	wire_w_lg_w_lg_read_address278w341w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range340w(0);
	wire_w_lg_w_lg_read_address278w346w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range345w(0);
	wire_w_lg_w_lg_read_address278w351w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range350w(0);
	wire_w_lg_w_lg_read_address278w356w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range355w(0);
	wire_w_lg_w_lg_read_address278w361w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range360w(0);
	wire_w_lg_w_lg_read_address278w366w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range365w(0);
	wire_w_lg_w_lg_read_address278w371w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range370w(0);
	wire_w_lg_w_lg_read_address278w283w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range282w(0);
	wire_w_lg_w_lg_read_address278w376w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range375w(0);
	wire_w_lg_w_lg_read_address278w381w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range380w(0);
	wire_w_lg_w_lg_read_address278w386w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range385w(0);
	wire_w_lg_w_lg_read_address278w391w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range390w(0);
	wire_w_lg_w_lg_read_address278w396w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range395w(0);
	wire_w_lg_w_lg_read_address278w401w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range400w(0);
	wire_w_lg_w_lg_read_address278w406w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range405w(0);
	wire_w_lg_w_lg_read_address278w411w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range410w(0);
	wire_w_lg_w_lg_read_address278w416w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range415w(0);
	wire_w_lg_w_lg_read_address278w286w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range285w(0);
	wire_w_lg_w_lg_read_address278w291w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range290w(0);
	wire_w_lg_w_lg_read_address278w296w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range295w(0);
	wire_w_lg_w_lg_read_address278w301w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range300w(0);
	wire_w_lg_w_lg_read_address278w306w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range305w(0);
	wire_w_lg_w_lg_read_address278w311w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range310w(0);
	wire_w_lg_w_lg_read_address278w316w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range315w(0);
	wire_w_lg_w_lg_read_address278w321w(0) <= wire_w_lg_read_address278w(0) AND wire_dffe7a_w_q_range320w(0);
	wire_w_lg_w_lg_rsource_load13w14w(0) <= wire_w_lg_rsource_load13w(0) AND dffe1a1;
	wire_w_lg_w_lg_rsource_load13w21w(0) <= wire_w_lg_rsource_load13w(0) AND dffe2a1;
	wire_w_lg_w_lg_rsource_load13w25w(0) <= wire_w_lg_rsource_load13w(0) AND dffe2a2;
	wire_w_lg_w_lg_rsource_load13w31w(0) <= wire_w_lg_rsource_load13w(0) AND dffe3a1;
	wire_w_lg_w_lg_rsource_load13w35w(0) <= wire_w_lg_rsource_load13w(0) AND dffe3a2;
	wire_w_lg_w_lg_shift_reg_load_enable101w103w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(1);
	wire_w_lg_w_lg_shift_reg_load_enable101w176w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(10);
	wire_w_lg_w_lg_shift_reg_load_enable101w183w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(11);
	wire_w_lg_w_lg_shift_reg_load_enable101w190w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(12);
	wire_w_lg_w_lg_shift_reg_load_enable101w197w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(13);
	wire_w_lg_w_lg_shift_reg_load_enable101w204w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(14);
	wire_w_lg_w_lg_shift_reg_load_enable101w211w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(15);
	wire_w_lg_w_lg_shift_reg_load_enable101w218w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(16);
	wire_w_lg_w_lg_shift_reg_load_enable101w225w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(17);
	wire_w_lg_w_lg_shift_reg_load_enable101w232w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(18);
	wire_w_lg_w_lg_shift_reg_load_enable101w239w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(19);
	wire_w_lg_w_lg_shift_reg_load_enable101w119w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(2);
	wire_w_lg_w_lg_shift_reg_load_enable101w246w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(20);
	wire_w_lg_w_lg_shift_reg_load_enable101w253w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(21);
	wire_w_lg_w_lg_shift_reg_load_enable101w260w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(22);
	wire_w_lg_w_lg_shift_reg_load_enable101w127w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(3);
	wire_w_lg_w_lg_shift_reg_load_enable101w134w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(4);
	wire_w_lg_w_lg_shift_reg_load_enable101w141w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(5);
	wire_w_lg_w_lg_shift_reg_load_enable101w148w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(6);
	wire_w_lg_w_lg_shift_reg_load_enable101w155w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(7);
	wire_w_lg_w_lg_shift_reg_load_enable101w162w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(8);
	wire_w_lg_w_lg_shift_reg_load_enable101w169w(0) <= wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(9);
	wire_w1028w(0) <= wire_w_lg_w_param_decoder_param_latch_range1024w1025w(0) AND wire_w_lg_w_param_decoder_param_latch_range1026w1027w(0);
	wire_w1056w(0) <= wire_w_lg_w_param_decoder_param_latch_range1024w1025w(0) AND wire_w_param_decoder_param_latch_range1026w(0);
	wire_w_lg_w_lg_read_source_update1237w1238w(0) <= wire_w_lg_read_source_update1237w(0) AND rsource_serial_out;
	wire_w_lg_idle1179w(0) <= idle AND wire_w_lg_w1w1178w(0);
	wire_w_lg_read_address287w(0) <= read_address AND wire_dffe7a_w_q_range277w(0);
	wire_w_lg_read_address337w(0) <= read_address AND wire_dffe7a_w_q_range325w(0);
	wire_w_lg_read_address342w(0) <= read_address AND wire_dffe7a_w_q_range330w(0);
	wire_w_lg_read_address347w(0) <= read_address AND wire_dffe7a_w_q_range335w(0);
	wire_w_lg_read_address352w(0) <= read_address AND wire_dffe7a_w_q_range340w(0);
	wire_w_lg_read_address357w(0) <= read_address AND wire_dffe7a_w_q_range345w(0);
	wire_w_lg_read_address362w(0) <= read_address AND wire_dffe7a_w_q_range350w(0);
	wire_w_lg_read_address367w(0) <= read_address AND wire_dffe7a_w_q_range355w(0);
	wire_w_lg_read_address372w(0) <= read_address AND wire_dffe7a_w_q_range360w(0);
	wire_w_lg_read_address377w(0) <= read_address AND wire_dffe7a_w_q_range365w(0);
	wire_w_lg_read_address382w(0) <= read_address AND wire_dffe7a_w_q_range370w(0);
	wire_w_lg_read_address292w(0) <= read_address AND wire_dffe7a_w_q_range282w(0);
	wire_w_lg_read_address387w(0) <= read_address AND wire_dffe7a_w_q_range375w(0);
	wire_w_lg_read_address392w(0) <= read_address AND wire_dffe7a_w_q_range380w(0);
	wire_w_lg_read_address397w(0) <= read_address AND wire_dffe7a_w_q_range385w(0);
	wire_w_lg_read_address402w(0) <= read_address AND wire_dffe7a_w_q_range390w(0);
	wire_w_lg_read_address407w(0) <= read_address AND wire_dffe7a_w_q_range395w(0);
	wire_w_lg_read_address412w(0) <= read_address AND wire_dffe7a_w_q_range400w(0);
	wire_w_lg_read_address417w(0) <= read_address AND wire_dffe7a_w_q_range405w(0);
	wire_w_lg_read_address297w(0) <= read_address AND wire_dffe7a_w_q_range285w(0);
	wire_w_lg_read_address302w(0) <= read_address AND wire_dffe7a_w_q_range290w(0);
	wire_w_lg_read_address307w(0) <= read_address AND wire_dffe7a_w_q_range295w(0);
	wire_w_lg_read_address312w(0) <= read_address AND wire_dffe7a_w_q_range300w(0);
	wire_w_lg_read_address317w(0) <= read_address AND wire_dffe7a_w_q_range305w(0);
	wire_w_lg_read_address322w(0) <= read_address AND wire_dffe7a_w_q_range310w(0);
	wire_w_lg_read_address327w(0) <= read_address AND wire_dffe7a_w_q_range315w(0);
	wire_w_lg_read_address332w(0) <= read_address AND wire_dffe7a_w_q_range320w(0);
	wire_w_lg_read_data1196w(0) <= read_data AND wire_w_lg_width_counter_param_width_match1195w(0);
	wire_w_lg_read_init_counter1192w(0) <= read_init_counter AND wire_w_lg_bit_counter_param_start_match1190w(0);
	wire_w_lg_read_post1202w(0) <= read_post AND wire_w_lg_width_counter_all_done1194w(0);
	wire_w_lg_read_pre_data1191w(0) <= read_pre_data AND wire_w_lg_bit_counter_param_start_match1190w(0);
	wire_w_lg_rsource_load16w(0) <= rsource_load AND wire_w_rsource_parallel_in_range15w(0);
	wire_w_lg_rsource_load23w(0) <= rsource_load AND wire_w_rsource_state_par_ini_range22w(0);
	wire_w_lg_rsource_load27w(0) <= rsource_load AND wire_w_rsource_state_par_ini_range26w(0);
	wire_w_lg_rsource_load33w(0) <= rsource_load AND wire_w_wsource_state_par_ini_range32w(0);
	wire_w_lg_rsource_load37w(0) <= rsource_load AND wire_w_wsource_state_par_ini_range36w(0);
	wire_w_lg_rublock_regout_reg1243w(0) <= rublock_regout_reg AND wire_w_lg_select_shift_nloop1242w(0);
	wire_w_lg_shift_reg_load_enable174w(0) <= shift_reg_load_enable AND wire_w173w(0);
	wire_w_lg_shift_reg_load_enable181w(0) <= shift_reg_load_enable AND wire_w180w(0);
	wire_w_lg_shift_reg_load_enable188w(0) <= shift_reg_load_enable AND wire_w187w(0);
	wire_w_lg_shift_reg_load_enable195w(0) <= shift_reg_load_enable AND wire_w194w(0);
	wire_w_lg_shift_reg_load_enable202w(0) <= shift_reg_load_enable AND wire_w201w(0);
	wire_w_lg_shift_reg_load_enable209w(0) <= shift_reg_load_enable AND wire_w208w(0);
	wire_w_lg_shift_reg_load_enable216w(0) <= shift_reg_load_enable AND wire_w215w(0);
	wire_w_lg_shift_reg_load_enable223w(0) <= shift_reg_load_enable AND wire_w222w(0);
	wire_w_lg_shift_reg_load_enable230w(0) <= shift_reg_load_enable AND wire_w229w(0);
	wire_w_lg_shift_reg_load_enable237w(0) <= shift_reg_load_enable AND wire_w236w(0);
	wire_w_lg_shift_reg_load_enable244w(0) <= shift_reg_load_enable AND wire_w243w(0);
	wire_w_lg_shift_reg_load_enable251w(0) <= shift_reg_load_enable AND wire_w250w(0);
	wire_w_lg_shift_reg_load_enable258w(0) <= shift_reg_load_enable AND wire_w257w(0);
	wire_w_lg_shift_reg_load_enable265w(0) <= shift_reg_load_enable AND wire_w264w(0);
	wire_w_lg_shift_reg_load_enable117w(0) <= shift_reg_load_enable AND wire_w116w(0);
	wire_w_lg_shift_reg_load_enable125w(0) <= shift_reg_load_enable AND wire_w124w(0);
	wire_w_lg_shift_reg_load_enable132w(0) <= shift_reg_load_enable AND wire_w131w(0);
	wire_w_lg_shift_reg_load_enable139w(0) <= shift_reg_load_enable AND wire_w138w(0);
	wire_w_lg_shift_reg_load_enable146w(0) <= shift_reg_load_enable AND wire_w145w(0);
	wire_w_lg_shift_reg_load_enable153w(0) <= shift_reg_load_enable AND wire_w152w(0);
	wire_w_lg_shift_reg_load_enable160w(0) <= shift_reg_load_enable AND wire_w159w(0);
	wire_w_lg_shift_reg_load_enable167w(0) <= shift_reg_load_enable AND wire_w166w(0);
	wire_w_lg_write_data1214w(0) <= write_data AND wire_w_lg_width_counter_param_width_match1195w(0);
	wire_w_lg_write_init_counter1211w(0) <= write_init_counter AND wire_w_lg_bit_counter_param_start_match1190w(0);
	wire_w_lg_write_post_data1220w(0) <= write_post_data AND wire_w_lg_bit_counter_all_done1213w(0);
	wire_w_lg_write_pre_data1210w(0) <= write_pre_data AND wire_w_lg_bit_counter_param_start_match1190w(0);
	wire_w_lg_w_param_range109w110w(0) <= wire_w_param_range109w(0) AND wire_w_lg_w_param_range107w108w(0);
	wire_w_lg_w_param_decoder_param_latch_range1024w1097w(0) <= wire_w_param_decoder_param_latch_range1024w(0) AND wire_w_lg_w_param_decoder_param_latch_range1026w1027w(0);
	wire_w_lg_w_param_decoder_param_latch_range1024w1063w(0) <= wire_w_param_decoder_param_latch_range1024w(0) AND wire_w_param_decoder_param_latch_range1026w(0);
	wire_w_lg_w_w4w_range1264w1265w(0) <= wire_w_w4w_range1264w(0) AND w1w;
	wire_w_lg_w_w4w_range1268w1269w(0) <= wire_w_w4w_range1268w(0) AND w1w;
	wire_w_lg_w_lg_w_lg_w_param_range109w110w111w112w(0) <= NOT wire_w_lg_w_lg_w_param_range109w110w111w(0);
	wire_w_lg_bit_counter_all_done1213w(0) <= NOT bit_counter_all_done;
	wire_w_lg_bit_counter_param_start_match1190w(0) <= NOT bit_counter_param_start_match;
	wire_w_lg_idle1160w(0) <= NOT idle;
	wire_w_lg_read_address278w(0) <= NOT read_address;
	wire_w_lg_read_data1155w(0) <= NOT read_data;
	wire_w_lg_read_init1159w(0) <= NOT read_init;
	wire_w_lg_read_init_counter1157w(0) <= NOT read_init_counter;
	wire_w_lg_read_post1154w(0) <= NOT read_post;
	wire_w_lg_read_pre_data1156w(0) <= NOT read_pre_data;
	wire_w_lg_read_source_update1158w(0) <= NOT read_source_update;
	wire_w_lg_rsource_load13w(0) <= NOT rsource_load;
	wire_w_lg_rsource_update_done1187w(0) <= NOT rsource_update_done;
	wire_w_lg_select_shift_nloop1242w(0) <= NOT select_shift_nloop;
	wire_w_lg_shift_reg_load_enable101w(0) <= NOT shift_reg_load_enable;
	wire_w_lg_w1w1178w(0) <= NOT w1w;
	wire_w_lg_w2w1177w(0) <= NOT w2w;
	wire_w_lg_w8w274w(0) <= NOT w8w;
	wire_w_lg_width_counter_all_done1194w(0) <= NOT width_counter_all_done;
	wire_w_lg_width_counter_param_width_match1195w(0) <= NOT width_counter_param_width_match;
	wire_w_lg_write_data1149w(0) <= NOT write_data;
	wire_w_lg_write_init1153w(0) <= NOT write_init;
	wire_w_lg_write_init_counter1152w(0) <= NOT write_init_counter;
	wire_w_lg_write_load1147w(0) <= NOT write_load;
	wire_w_lg_write_post_data1148w(0) <= NOT write_post_data;
	wire_w_lg_write_pre_data1150w(0) <= NOT write_pre_data;
	wire_w_lg_write_source_update1151w(0) <= NOT write_source_update;
	wire_w_lg_write_wait1146w(0) <= NOT write_wait;
	wire_w_lg_wsource_update_done1207w(0) <= NOT wsource_update_done;
	wire_w_lg_w_param_range105w106w(0) <= NOT wire_w_param_range105w(0);
	wire_w_lg_w_param_range107w108w(0) <= NOT wire_w_param_range107w(0);
	wire_w_lg_w_param_decoder_param_latch_range1024w1025w(0) <= NOT wire_w_param_decoder_param_latch_range1024w(0);
	wire_w_lg_w_param_decoder_param_latch_range1026w1027w(0) <= NOT wire_w_param_decoder_param_latch_range1026w(0);
	wire_w_lg_w_param_decoder_param_latch_range1029w1030w(0) <= NOT wire_w_param_decoder_param_latch_range1029w(0);
	wire_w_lg_w_param_decoder_param_latch_range1032w1033w(0) <= NOT wire_w_param_decoder_param_latch_range1032w(0);
	wire_w_lg_w_param_decoder_param_latch_range1035w1036w(0) <= NOT wire_w_param_decoder_param_latch_range1035w(0);
	wire_w_lg_w_param_decoder_param_latch_range1038w1039w(0) <= NOT wire_w_param_decoder_param_latch_range1038w(0);
	wire_w_lg_w_param_decoder_param_latch_range1041w1102w(0) <= NOT wire_w_param_decoder_param_latch_range1041w(0);
	wire_w173w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w172w(0) OR wire_w170w(0);
	wire_w180w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w179w(0) OR wire_w177w(0);
	wire_w187w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w186w(0) OR wire_w184w(0);
	wire_w194w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w193w(0) OR wire_w191w(0);
	wire_w201w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w200w(0) OR wire_w198w(0);
	wire_w208w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w207w(0) OR wire_w205w(0);
	wire_w215w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w214w(0) OR wire_w212w(0);
	wire_w222w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w221w(0) OR wire_w219w(0);
	wire_w229w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w228w(0) OR wire_w226w(0);
	wire_w236w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w235w(0) OR wire_w233w(0);
	wire_w243w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w242w(0) OR wire_w240w(0);
	wire_w250w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w249w(0) OR wire_w247w(0);
	wire_w257w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w256w(0) OR wire_w254w(0);
	wire_w264w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w263w(0) OR wire_w261w(0);
	wire_w116w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w115w(0) OR wire_w113w(0);
	wire_w124w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w123w(0) OR wire_w121w(0);
	wire_w131w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w130w(0) OR wire_w128w(0);
	wire_w138w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w137w(0) OR wire_w135w(0);
	wire_w145w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w144w(0) OR wire_w142w(0);
	wire_w152w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w151w(0) OR wire_w149w(0);
	wire_w159w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w158w(0) OR wire_w156w(0);
	wire_w166w(0) <= wire_w_lg_w_lg_w_lg_w_param_range109w110w111w165w(0) OR wire_w163w(0);
	wire_w_lg_w_lg_w_lg_idle1179w1180w1181w(0) <= wire_w_lg_w_lg_idle1179w1180w(0) OR write_wait;
	wire_w_lg_w_lg_read_address287w288w(0) <= wire_w_lg_read_address287w(0) OR wire_w_lg_w_lg_read_address278w286w(0);
	wire_w_lg_w_lg_read_address337w338w(0) <= wire_w_lg_read_address337w(0) OR wire_w_lg_w_lg_read_address278w336w(0);
	wire_w_lg_w_lg_read_address342w343w(0) <= wire_w_lg_read_address342w(0) OR wire_w_lg_w_lg_read_address278w341w(0);
	wire_w_lg_w_lg_read_address347w348w(0) <= wire_w_lg_read_address347w(0) OR wire_w_lg_w_lg_read_address278w346w(0);
	wire_w_lg_w_lg_read_address352w353w(0) <= wire_w_lg_read_address352w(0) OR wire_w_lg_w_lg_read_address278w351w(0);
	wire_w_lg_w_lg_read_address357w358w(0) <= wire_w_lg_read_address357w(0) OR wire_w_lg_w_lg_read_address278w356w(0);
	wire_w_lg_w_lg_read_address362w363w(0) <= wire_w_lg_read_address362w(0) OR wire_w_lg_w_lg_read_address278w361w(0);
	wire_w_lg_w_lg_read_address367w368w(0) <= wire_w_lg_read_address367w(0) OR wire_w_lg_w_lg_read_address278w366w(0);
	wire_w_lg_w_lg_read_address372w373w(0) <= wire_w_lg_read_address372w(0) OR wire_w_lg_w_lg_read_address278w371w(0);
	wire_w_lg_w_lg_read_address377w378w(0) <= wire_w_lg_read_address377w(0) OR wire_w_lg_w_lg_read_address278w376w(0);
	wire_w_lg_w_lg_read_address382w383w(0) <= wire_w_lg_read_address382w(0) OR wire_w_lg_w_lg_read_address278w381w(0);
	wire_w_lg_w_lg_read_address292w293w(0) <= wire_w_lg_read_address292w(0) OR wire_w_lg_w_lg_read_address278w291w(0);
	wire_w_lg_w_lg_read_address387w388w(0) <= wire_w_lg_read_address387w(0) OR wire_w_lg_w_lg_read_address278w386w(0);
	wire_w_lg_w_lg_read_address392w393w(0) <= wire_w_lg_read_address392w(0) OR wire_w_lg_w_lg_read_address278w391w(0);
	wire_w_lg_w_lg_read_address397w398w(0) <= wire_w_lg_read_address397w(0) OR wire_w_lg_w_lg_read_address278w396w(0);
	wire_w_lg_w_lg_read_address402w403w(0) <= wire_w_lg_read_address402w(0) OR wire_w_lg_w_lg_read_address278w401w(0);
	wire_w_lg_w_lg_read_address407w408w(0) <= wire_w_lg_read_address407w(0) OR wire_w_lg_w_lg_read_address278w406w(0);
	wire_w_lg_w_lg_read_address412w413w(0) <= wire_w_lg_read_address412w(0) OR wire_w_lg_w_lg_read_address278w411w(0);
	wire_w_lg_w_lg_read_address417w418w(0) <= wire_w_lg_read_address417w(0) OR wire_w_lg_w_lg_read_address278w416w(0);
	wire_w_lg_w_lg_read_address297w298w(0) <= wire_w_lg_read_address297w(0) OR wire_w_lg_w_lg_read_address278w296w(0);
	wire_w_lg_w_lg_read_address302w303w(0) <= wire_w_lg_read_address302w(0) OR wire_w_lg_w_lg_read_address278w301w(0);
	wire_w_lg_w_lg_read_address307w308w(0) <= wire_w_lg_read_address307w(0) OR wire_w_lg_w_lg_read_address278w306w(0);
	wire_w_lg_w_lg_read_address312w313w(0) <= wire_w_lg_read_address312w(0) OR wire_w_lg_w_lg_read_address278w311w(0);
	wire_w_lg_w_lg_read_address317w318w(0) <= wire_w_lg_read_address317w(0) OR wire_w_lg_w_lg_read_address278w316w(0);
	wire_w_lg_w_lg_read_address322w323w(0) <= wire_w_lg_read_address322w(0) OR wire_w_lg_w_lg_read_address278w321w(0);
	wire_w_lg_w_lg_read_address327w328w(0) <= wire_w_lg_read_address327w(0) OR wire_w_lg_w_lg_read_address278w326w(0);
	wire_w_lg_w_lg_read_address332w333w(0) <= wire_w_lg_read_address332w(0) OR wire_w_lg_w_lg_read_address278w331w(0);
	wire_w_lg_w_lg_w_w4w_range1264w1265w1266w(0) <= wire_w_lg_w_w4w_range1264w1265w(0) OR w2w;
	wire_w_lg_w_lg_w_w4w_range1268w1269w1270w(0) <= wire_w_lg_w_w4w_range1268w1269w(0) OR w2w;
	wire_w_lg_w_lg_shift_reg_load_enable99w100w(0) <= wire_w_lg_shift_reg_load_enable99w(0) OR shift_reg_clear;
	wire_w_lg_read_source_update1237w(0) <= read_source_update OR write_source_update;
	wire_w_lg_rsource_load18w(0) <= rsource_load OR global_vcc;
	wire_w_lg_rsource_load9w(0) <= rsource_load OR rsource_shift_enable;
	wire_w_lg_shift_reg_load_enable99w(0) <= shift_reg_load_enable OR shift_reg_shift_enable;
	bit_counter_all_done <= ((((wire_cntr5_w_lg_w_q_range39w42w(0) AND (NOT wire_cntr5_q(2))) AND wire_cntr5_q(3)) AND (NOT wire_cntr5_q(4))) AND wire_cntr5_q(5));
	bit_counter_clear <= (rsource_update_done OR wsource_update_done);
	bit_counter_enable <= (((((((((rsource_update_done OR wsource_update_done) OR read_init_counter) OR write_init_counter) OR read_pre_data) OR write_pre_data) OR read_data) OR write_data) OR read_post) OR write_post_data);
	bit_counter_param_start <= start_bit_decoder_out;
	bit_counter_param_start_match <= ((((((NOT w53w(0)) AND (NOT w53w(1))) AND (NOT w53w(2))) AND (NOT w53w(3))) AND (NOT w53w(4))) AND (NOT w53w(5)));
	busy <= wire_w_lg_idle1160w(0);
	combine_port <= ( read_param & write_param & read_source & param);
	data_out <= ( wire_w_lg_w_lg_read_address417w418w & wire_w_lg_w_lg_read_address412w413w & wire_w_lg_w_lg_read_address407w408w & wire_w_lg_w_lg_read_address402w403w & wire_w_lg_w_lg_read_address397w398w & wire_w_lg_w_lg_read_address392w393w & wire_w_lg_w_lg_read_address387w388w & wire_w_lg_w_lg_read_address382w383w & wire_w_lg_w_lg_read_address377w378w & wire_w_lg_w_lg_read_address372w373w & wire_w_lg_w_lg_read_address367w368w & wire_w_lg_w_lg_read_address362w363w & wire_w_lg_w_lg_read_address357w358w & wire_w_lg_w_lg_read_address352w353w & wire_w_lg_w_lg_read_address347w348w & wire_w_lg_w_lg_read_address342w343w & wire_w_lg_w_lg_read_address337w338w & wire_w_lg_w_lg_read_address332w333w & wire_w_lg_w_lg_read_address327w328w & wire_w_lg_w_lg_read_address322w323w & wire_w_lg_w_lg_read_address317w318w & wire_w_lg_w_lg_read_address312w313w & wire_w_lg_w_lg_read_address307w308w & wire_w_lg_w_lg_read_address302w303w & wire_w_lg_w_lg_read_address297w298w & wire_w_lg_w_lg_read_address292w293w & wire_w_lg_w_lg_read_address287w288w & wire_w_lg_w_lg_read_address278w283w & wire_w_lg_w_lg_read_address278w279w);
	global_gnd <= '0';
	global_vcc <= '1';
	idle <= idle_state;
	param_decoder_param_latch <= dffe9a;
	param_decoder_select <= ( wire_w1144w & wire_w1139w & wire_w_lg_w_lg_w_lg_w_lg_w1064w1065w1133w1134w1135w & wire_w1131w & wire_w_lg_w_lg_w_lg_w_lg_w1098w1124w1125w1126w1127w & wire_w1122w & wire_w1116w & wire_w_lg_w_lg_w_lg_w_lg_w1064w1110w1111w1112w1113w & wire_w1108w & wire_w_lg_w_lg_w_lg_w_lg_w1098w1099w1100w1101w1103w & wire_w_lg_w_lg_w_lg_w_lg_w1084w1092w1093w1094w1095w & wire_w1076w & wire_w1072w & wire_w_lg_w_lg_w_lg_w_lg_w1084w1085w1086w1087w1088w & wire_w1082w & wire_w1054w & wire_w1076w & wire_w1072w & wire_w_lg_w_lg_w_lg_w_lg_w1064w1065w1066w1067w1068w & wire_w1061w & wire_w1054w & wire_w1049w & wire_w1042w);
	power_up <= ((((((((((((((wire_w_lg_idle1160w(0) AND wire_w_lg_read_init1159w(0)) AND wire_w_lg_read_source_update1158w(0)) AND wire_w_lg_read_init_counter1157w(0)) AND wire_w_lg_read_pre_data1156w(0)) AND wire_w_lg_read_data1155w(0)) AND wire_w_lg_read_post1154w(0)) AND wire_w_lg_write_init1153w(0)) AND wire_w_lg_write_init_counter1152w(0)) AND wire_w_lg_write_source_update1151w(0)) AND wire_w_lg_write_pre_data1150w(0)) AND wire_w_lg_write_data1149w(0)) AND wire_w_lg_write_post_data1148w(0)) AND wire_w_lg_write_load1147w(0)) AND wire_w_lg_write_wait1146w(0));
	read_address <= read_address_state;
	read_data <= read_data_state;
	read_init <= read_init_state;
	read_init_counter <= read_init_counter_state;
	read_post <= read_post_state;
	read_pre_data <= read_pre_data_state;
	read_source_update <= read_source_update_state;
	rsource_load <= (idle AND (write_param OR read_param));
	rsource_parallel_in <= ( wire_w_lg_w_lg_w_w4w_range1268w1269w1270w & wire_w_lg_w_lg_w_w4w_range1264w1265w1266w);
	rsource_serial_out <= dffe1a0;
	rsource_shift_enable <= wire_w_lg_read_source_update1237w(0);
	rsource_state_par_ini <= ( read_param & global_gnd & global_gnd);
	rsource_update_done <= dffe2a0;
	rublock_captnupdt <= wire_w_lg_write_load1147w(0);
	rublock_clock <= (NOT (clock OR idle_write_wait));
	rublock_reconfig <= rublock_reconfig_st;
	rublock_reconfig_st <= (idle AND reconfig);
	rublock_regin <= ((((wire_w_lg_rublock_regout_reg1243w(0) AND wire_w_lg_read_source_update1158w(0)) AND wire_w_lg_write_source_update1151w(0)) OR (((shift_reg_serial_out AND select_shift_nloop) AND wire_w_lg_read_source_update1158w(0)) AND wire_w_lg_write_source_update1151w(0))) OR wire_w_lg_w_lg_read_source_update1237w1238w(0));
	rublock_regout <= wire_sd4_regout;
	rublock_regout_reg <= dffe8;
	rublock_shiftnld <= (((((((read_pre_data OR write_pre_data) OR read_data) OR write_data) OR read_post) OR write_post_data) OR read_source_update) OR write_source_update);
	select_shift_nloop <= (wire_w_lg_read_data1196w(0) OR wire_w_lg_write_data1214w(0));
	shift_reg_clear <= rsource_update_done;
	shift_reg_load_enable <= (idle AND write_param);
	shift_reg_serial_in <= (rublock_regout_reg AND select_shift_nloop);
	shift_reg_serial_out <= dffe7a(0);
	shift_reg_shift_enable <= (((read_data OR write_data) OR read_post) OR write_post_data);
	start_bit_decoder_out <= ((((((((((((((((((((((( "0" & start_bit_decoder_param_select(0) & start_bit_decoder_param_select(0) & start_bit_decoder_param_select(0) & start_bit_decoder_param_select(0) & "0") OR ( "0" & "0" & "0" & "0" & "0" & "0")) OR ( "0" & start_bit_decoder_param_select(2) & start_bit_decoder_param_select(2) & start_bit_decoder_param_select(2) & start_bit_decoder_param_select(2) & "0")) OR ( "0" & "0" & "0" & "0" & "0" & "0")) OR ( "0" & start_bit_decoder_param_select(4) & start_bit_decoder_param_select(4) & start_bit_decoder_param_select(4) & "0" & start_bit_decoder_param_select(4))) OR ( "0" & start_bit_decoder_param_select(5) & start_bit_decoder_param_select(5) & start_bit_decoder_param_select(5) & start_bit_decoder_param_select(5) & "0")) OR ( "0" & "0" & "0" & "0" & "0" & "0")) OR ( "0" & start_bit_decoder_param_select(7) & start_bit_decoder_param_select(7) & "0" & "0" & "0")) OR ( "0" & "0" & "0" & "0" & "0" & "0")) OR ( "0" & start_bit_decoder_param_select(9) & start_bit_decoder_param_select(9) & "0" & start_bit_decoder_param_select(9) & "0")) OR ( "0" & start_bit_decoder_param_select(10) & start_bit_decoder_param_select(10) & "0" & "0" & "0")) OR ( "0" & "0" & "0" & "0" & "0" & "0")) OR ( "0" & start_bit_decoder_param_select(12) & start_bit_decoder_param_select(12) & "0" & start_bit_decoder_param_select(12) & "0")) OR ( start_bit_decoder_param_select(13) & "0" & "0" & start_bit_decoder_param_select(13) & "0" & start_bit_decoder_param_select(13))) OR ( "0" & "0" & "0" & "0" & "0" & "0")) OR ( start_bit_decoder_param_select(15) & "0" & "0" & "0" & start_bit_decoder_param_select(15) & start_bit_decoder_param_select(15))) OR ( "0" & "0" & start_bit_decoder_param_select(16) & start_bit_decoder_param_select(16) & "0" & "0")) OR ( start_bit_decoder_param_select(17) & "0" & "0" & start_bit_decoder_param_select(17) & "0" & "0")) OR ( start_bit_decoder_param_select(18) & "0" & "0" & start_bit_decoder_param_select(18) & "0" & start_bit_decoder_param_select(18))) OR ( "0" & "0" & "0" & "0" & "0" & "0"
)) OR ( start_bit_decoder_param_select(20) & "0" & "0" & "0" & start_bit_decoder_param_select(20) & start_bit_decoder_param_select(20))) OR ( "0" & "0" & start_bit_decoder_param_select(21) & start_bit_decoder_param_select(21) & "0" & "0")) OR ( start_bit_decoder_param_select(22) & "0" & "0" & start_bit_decoder_param_select(22) & "0" & "0"));
	start_bit_decoder_param_select <= param_decoder_select;
	w1w <= read_param;
	w2w <= write_param;
	w4w <= read_source;
	w53w <= (wire_cntr5_q XOR bit_counter_param_start);
	w83w <= (wire_cntr6_q XOR width_counter_param_width);
	w8w <= wire_w_lg_idle1160w(0);
	width_counter_all_done <= (((((NOT wire_cntr6_q(0)) AND (NOT wire_cntr6_q(1))) AND wire_cntr6_q(2)) AND wire_cntr6_q(3)) AND wire_cntr6_q(4));
	width_counter_clear <= (rsource_update_done OR wsource_update_done);
	width_counter_enable <= ((read_data OR write_data) OR read_post);
	width_counter_param_width <= width_decoder_out;
	width_counter_param_width_match <= (((((NOT w83w(0)) AND (NOT w83w(1))) AND (NOT w83w(2))) AND (NOT w83w(3))) AND (NOT w83w(4)));
	width_decoder_out <= ((((((((((((((((((((((( "0" & "0" & "0" & width_decoder_param_select(0) & "0") OR ( width_decoder_param_select(1) & width_decoder_param_select(1) & "0" & "0" & "0")) OR ( "0" & "0" & "0" & width_decoder_param_select(2) & "0")) OR ( width_decoder_param_select(3) & width_decoder_param_select(3) & width_decoder_param_select(3) & "0" & width_decoder_param_select(3))) OR ( "0" & "0" & "0" & "0" & width_decoder_param_select(4))) OR ( "0" & "0" & "0" & width_decoder_param_select(5) & "0")) OR ( width_decoder_param_select(6) & width_decoder_param_select(6) & "0" & "0" & "0")) OR ( "0" & "0" & "0" & width_decoder_param_select(7) & "0")) OR ( width_decoder_param_select(8) & width_decoder_param_select(8) & "0" & "0" & "0")) OR ( "0" & "0" & width_decoder_param_select(9) & "0" & width_decoder_param_select(9))) OR ( "0" & "0" & "0" & width_decoder_param_select(10) & "0")) OR ( width_decoder_param_select(11) & width_decoder_param_select(11) & "0" & "0" & "0")) OR ( "0" & "0" & width_decoder_param_select(12) & "0" & width_decoder_param_select(12))) OR ( "0" & "0" & "0" & "0" & width_decoder_param_select(13))) OR ( "0" & width_decoder_param_select(14) & width_decoder_param_select(14) & "0" & "0")) OR ( "0" & "0" & "0" & "0" & width_decoder_param_select(15))) OR ( width_decoder_param_select(16) & "0" & width_decoder_param_select(16) & width_decoder_param_select(16) & "0")) OR ( "0" & "0" & "0" & "0" & width_decoder_param_select(17))) OR ( "0" & "0" & "0" & "0" & width_decoder_param_select(18))) OR ( "0" & width_decoder_param_select(19) & width_decoder_param_select(19) & "0" & "0")) OR ( "0" & "0" & "0" & "0" & width_decoder_param_select(20))) OR ( width_decoder_param_select(21) & "0" & width_decoder_param_select(21) & width_decoder_param_select(21) & "0")) OR ( "0" & "0" & "0" & "0" & width_decoder_param_select(22)));
	width_decoder_param_select <= param_decoder_select;
	write_data <= write_data_state;
	write_init <= write_init_state;
	write_init_counter <= write_init_counter_state;
	write_load <= write_load_state;
	write_post_data <= write_post_data_state;
	write_pre_data <= write_pre_data_state;
	write_source_update <= write_source_update_state;
	write_wait <= write_wait_state;
	wsource_state_par_ini <= ( write_param & global_gnd & global_gnd);
	wsource_update_done <= dffe3a0;
	wire_w_data_in_range104w(0) <= data_in(0);
	wire_w_data_in_range171w(0) <= data_in(10);
	wire_w_data_in_range178w(0) <= data_in(11);
	wire_w_data_in_range185w(0) <= data_in(12);
	wire_w_data_in_range192w(0) <= data_in(13);
	wire_w_data_in_range199w(0) <= data_in(14);
	wire_w_data_in_range206w(0) <= data_in(15);
	wire_w_data_in_range213w(0) <= data_in(16);
	wire_w_data_in_range220w(0) <= data_in(17);
	wire_w_data_in_range227w(0) <= data_in(18);
	wire_w_data_in_range234w(0) <= data_in(19);
	wire_w_data_in_range120w(0) <= data_in(1);
	wire_w_data_in_range241w(0) <= data_in(20);
	wire_w_data_in_range248w(0) <= data_in(21);
	wire_w_data_in_range255w(0) <= data_in(22);
	wire_w_data_in_range262w(0) <= data_in(23);
	wire_w_data_in_range114w(0) <= data_in(2);
	wire_w_data_in_range122w(0) <= data_in(3);
	wire_w_data_in_range129w(0) <= data_in(4);
	wire_w_data_in_range136w(0) <= data_in(5);
	wire_w_data_in_range143w(0) <= data_in(6);
	wire_w_data_in_range150w(0) <= data_in(7);
	wire_w_data_in_range157w(0) <= data_in(8);
	wire_w_data_in_range164w(0) <= data_in(9);
	wire_w_param_range105w(0) <= param(0);
	wire_w_param_range107w(0) <= param(1);
	wire_w_param_range109w(0) <= param(2);
	wire_w_param_decoder_param_latch_range1024w(0) <= param_decoder_param_latch(0);
	wire_w_param_decoder_param_latch_range1026w(0) <= param_decoder_param_latch(1);
	wire_w_param_decoder_param_latch_range1029w(0) <= param_decoder_param_latch(2);
	wire_w_param_decoder_param_latch_range1032w(0) <= param_decoder_param_latch(3);
	wire_w_param_decoder_param_latch_range1035w(0) <= param_decoder_param_latch(4);
	wire_w_param_decoder_param_latch_range1038w(0) <= param_decoder_param_latch(5);
	wire_w_param_decoder_param_latch_range1041w(0) <= param_decoder_param_latch(6);
	wire_w_rsource_parallel_in_range15w(0) <= rsource_parallel_in(0);
	wire_w_rsource_state_par_ini_range22w(0) <= rsource_state_par_ini(0);
	wire_w_rsource_state_par_ini_range26w(0) <= rsource_state_par_ini(1);
	wire_w_w4w_range1264w(0) <= w4w(0);
	wire_w_w4w_range1268w(0) <= w4w(1);
	wire_w_wsource_state_par_ini_range32w(0) <= wsource_state_par_ini(0);
	wire_w_wsource_state_par_ini_range36w(0) <= wsource_state_par_ini(1);
	check_busy_dffe <= (OTHERS => '0');
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe1a0 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe1a_ena(0) = '1') THEN dffe1a0 <= (wire_w_lg_rsource_load16w(0) OR wire_w_lg_w_lg_rsource_load13w14w(0));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe1a1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe1a_ena(1) = '1') THEN dffe1a1 <= (rsource_parallel_in(1) AND rsource_load);
			END IF;
		END IF;
	END PROCESS;
	loop0 : FOR i IN 0 TO 1 GENERATE
		wire_dffe1a_ena(i) <= wire_w_lg_rsource_load9w(0);
	END GENERATE loop0;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe2a0 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe2a_ena(0) = '1') THEN dffe2a0 <= (wire_w_lg_rsource_load23w(0) OR wire_w_lg_w_lg_rsource_load13w21w(0));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe2a1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe2a_ena(1) = '1') THEN dffe2a1 <= (wire_w_lg_rsource_load27w(0) OR wire_w_lg_w_lg_rsource_load13w25w(0));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe2a2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe2a_ena(2) = '1') THEN dffe2a2 <= (rsource_state_par_ini(2) AND rsource_load);
			END IF;
		END IF;
	END PROCESS;
	loop1 : FOR i IN 0 TO 2 GENERATE
		wire_dffe2a_ena(i) <= wire_w_lg_rsource_load18w(0);
	END GENERATE loop1;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe3a0 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe3a_ena(0) = '1') THEN dffe3a0 <= (wire_w_lg_rsource_load33w(0) OR wire_w_lg_w_lg_rsource_load13w31w(0));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe3a1 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe3a_ena(1) = '1') THEN dffe3a1 <= (wire_w_lg_rsource_load37w(0) OR wire_w_lg_w_lg_rsource_load13w35w(0));
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe3a2 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe3a_ena(2) = '1') THEN dffe3a2 <= (wsource_state_par_ini(2) AND rsource_load);
			END IF;
		END IF;
	END PROCESS;
	loop2 : FOR i IN 0 TO 2 GENERATE
		wire_dffe3a_ena(i) <= wire_w_lg_rsource_load18w(0);
	END GENERATE loop2;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(0) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(0) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(0) <= '0';
				ELSE dffe7a(0) <= (wire_w_lg_shift_reg_load_enable117w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w103w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(1) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(1) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(1) <= '0';
				ELSE dffe7a(1) <= (wire_w_lg_shift_reg_load_enable125w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w119w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(2) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(2) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(2) <= '0';
				ELSE dffe7a(2) <= (wire_w_lg_shift_reg_load_enable132w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w127w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(3) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(3) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(3) <= '0';
				ELSE dffe7a(3) <= (wire_w_lg_shift_reg_load_enable139w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w134w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(4) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(4) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(4) <= '0';
				ELSE dffe7a(4) <= (wire_w_lg_shift_reg_load_enable146w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w141w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(5) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(5) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(5) <= '0';
				ELSE dffe7a(5) <= (wire_w_lg_shift_reg_load_enable153w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w148w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(6) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(6) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(6) <= '0';
				ELSE dffe7a(6) <= (wire_w_lg_shift_reg_load_enable160w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w155w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(7) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(7) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(7) <= '0';
				ELSE dffe7a(7) <= (wire_w_lg_shift_reg_load_enable167w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w162w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(8) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(8) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(8) <= '0';
				ELSE dffe7a(8) <= (wire_w_lg_shift_reg_load_enable174w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w169w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(9) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(9) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(9) <= '0';
				ELSE dffe7a(9) <= (wire_w_lg_shift_reg_load_enable181w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w176w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(10) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(10) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(10) <= '0';
				ELSE dffe7a(10) <= (wire_w_lg_shift_reg_load_enable188w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w183w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(11) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(11) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(11) <= '0';
				ELSE dffe7a(11) <= (wire_w_lg_shift_reg_load_enable195w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w190w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(12) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(12) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(12) <= '0';
				ELSE dffe7a(12) <= (wire_w_lg_shift_reg_load_enable202w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w197w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(13) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(13) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(13) <= '0';
				ELSE dffe7a(13) <= (wire_w_lg_shift_reg_load_enable209w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w204w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(14) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(14) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(14) <= '0';
				ELSE dffe7a(14) <= (wire_w_lg_shift_reg_load_enable216w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w211w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(15) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(15) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(15) <= '0';
				ELSE dffe7a(15) <= (wire_w_lg_shift_reg_load_enable223w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w218w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(16) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(16) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(16) <= '0';
				ELSE dffe7a(16) <= (wire_w_lg_shift_reg_load_enable230w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w225w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(17) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(17) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(17) <= '0';
				ELSE dffe7a(17) <= (wire_w_lg_shift_reg_load_enable237w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w232w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(18) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(18) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(18) <= '0';
				ELSE dffe7a(18) <= (wire_w_lg_shift_reg_load_enable244w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w239w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(19) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(19) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(19) <= '0';
				ELSE dffe7a(19) <= (wire_w_lg_shift_reg_load_enable251w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w246w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(20) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(20) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(20) <= '0';
				ELSE dffe7a(20) <= (wire_w_lg_shift_reg_load_enable258w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w253w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(21) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(21) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(21) <= '0';
				ELSE dffe7a(21) <= (wire_w_lg_shift_reg_load_enable265w(0) OR wire_w_lg_w_lg_shift_reg_load_enable101w260w(0));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(22) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(22) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(22) <= '0';
				ELSE dffe7a(22) <= (wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(23));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(23) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(23) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(23) <= '0';
				ELSE dffe7a(23) <= (wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(24));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(24) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(24) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(24) <= '0';
				ELSE dffe7a(24) <= (wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(25));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(25) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(25) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(25) <= '0';
				ELSE dffe7a(25) <= (wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(26));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(26) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(26) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(26) <= '0';
				ELSE dffe7a(26) <= (wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(27));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(27) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(27) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(27) <= '0';
				ELSE dffe7a(27) <= (wire_w_lg_shift_reg_load_enable101w(0) AND dffe7a(28));
				END IF;
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe7a(28) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe7a_ena(28) = '1') THEN 
				IF (shift_reg_clear = '1') THEN dffe7a(28) <= '0';
				ELSE dffe7a(28) <= (wire_w_lg_shift_reg_load_enable101w(0) AND shift_reg_serial_in);
				END IF;
			END IF;
		END IF;
	END PROCESS;
	loop3 : FOR i IN 0 TO 28 GENERATE
		wire_dffe7a_ena(i) <= wire_w_lg_w_lg_shift_reg_load_enable99w100w(0);
	END GENERATE loop3;
	wire_dffe7a_w_q_range277w(0) <= dffe7a(0);
	wire_dffe7a_w_q_range325w(0) <= dffe7a(10);
	wire_dffe7a_w_q_range330w(0) <= dffe7a(11);
	wire_dffe7a_w_q_range335w(0) <= dffe7a(12);
	wire_dffe7a_w_q_range340w(0) <= dffe7a(13);
	wire_dffe7a_w_q_range345w(0) <= dffe7a(14);
	wire_dffe7a_w_q_range350w(0) <= dffe7a(15);
	wire_dffe7a_w_q_range355w(0) <= dffe7a(16);
	wire_dffe7a_w_q_range360w(0) <= dffe7a(17);
	wire_dffe7a_w_q_range365w(0) <= dffe7a(18);
	wire_dffe7a_w_q_range370w(0) <= dffe7a(19);
	wire_dffe7a_w_q_range282w(0) <= dffe7a(1);
	wire_dffe7a_w_q_range375w(0) <= dffe7a(20);
	wire_dffe7a_w_q_range380w(0) <= dffe7a(21);
	wire_dffe7a_w_q_range385w(0) <= dffe7a(22);
	wire_dffe7a_w_q_range390w(0) <= dffe7a(23);
	wire_dffe7a_w_q_range395w(0) <= dffe7a(24);
	wire_dffe7a_w_q_range400w(0) <= dffe7a(25);
	wire_dffe7a_w_q_range405w(0) <= dffe7a(26);
	wire_dffe7a_w_q_range410w(0) <= dffe7a(27);
	wire_dffe7a_w_q_range415w(0) <= dffe7a(28);
	wire_dffe7a_w_q_range285w(0) <= dffe7a(2);
	wire_dffe7a_w_q_range290w(0) <= dffe7a(3);
	wire_dffe7a_w_q_range295w(0) <= dffe7a(4);
	wire_dffe7a_w_q_range300w(0) <= dffe7a(5);
	wire_dffe7a_w_q_range305w(0) <= dffe7a(6);
	wire_dffe7a_w_q_range310w(0) <= dffe7a(7);
	wire_dffe7a_w_q_range315w(0) <= dffe7a(8);
	wire_dffe7a_w_q_range320w(0) <= dffe7a(9);
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe8 <= '0';
		ELSIF (clock = '1' AND clock'event) THEN dffe8 <= rublock_regout;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe9a(0) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe9a_ena(0) = '1') THEN dffe9a(0) <= combine_port(0);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe9a(1) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe9a_ena(1) = '1') THEN dffe9a(1) <= combine_port(1);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe9a(2) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe9a_ena(2) = '1') THEN dffe9a(2) <= combine_port(2);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe9a(3) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe9a_ena(3) = '1') THEN dffe9a(3) <= combine_port(3);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe9a(4) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe9a_ena(4) = '1') THEN dffe9a(4) <= combine_port(4);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe9a(5) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe9a_ena(5) = '1') THEN dffe9a(5) <= combine_port(5);
			END IF;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN dffe9a(6) <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_dffe9a_ena(6) = '1') THEN dffe9a(6) <= combine_port(6);
			END IF;
		END IF;
	END PROCESS;
	loop4 : FOR i IN 0 TO 6 GENERATE
		wire_dffe9a_ena(i) <= (idle AND (write_param OR read_param));
	END GENERATE loop4;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN idle_state <= '1';
		ELSIF (clock = '1' AND clock'event) THEN idle_state <= (((wire_w_lg_w_lg_w_lg_idle1179w1180w1181w(0) OR (read_data AND width_counter_all_done)) OR (read_post AND width_counter_all_done)) OR power_up);
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN idle_write_wait <= '0';
		ELSIF (clock = '1' AND clock'event) THEN idle_write_wait <= ((((wire_w_lg_w_lg_w_lg_idle1179w1180w1181w(0) OR (read_data AND width_counter_all_done)) OR (read_post AND width_counter_all_done)) OR power_up) AND write_load);
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN read_address_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN 
			IF (wire_read_address_state_ena = '1') THEN read_address_state <= (((read_param OR write_param) AND wire_w_lg_w_lg_w_param_range109w110w111w(0)) AND wire_w_lg_w8w274w(0));
			END IF;
		END IF;
	END PROCESS;
	wire_read_address_state_ena <= (read_param OR write_param);
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN read_data_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN read_data_state <= (((read_init_counter AND bit_counter_param_start_match) OR (read_pre_data AND bit_counter_param_start_match)) OR (wire_w_lg_read_data1196w(0) AND wire_w_lg_width_counter_all_done1194w(0)));
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN read_init_counter_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN read_init_counter_state <= rsource_update_done;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN read_init_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN read_init_state <= (idle AND read_param);
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN read_post_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN read_post_state <= (((read_data AND width_counter_param_width_match) AND wire_w_lg_width_counter_all_done1194w(0)) OR wire_w_lg_read_post1202w(0));
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN read_pre_data_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN read_pre_data_state <= (wire_w_lg_read_init_counter1192w(0) OR wire_w_lg_read_pre_data1191w(0));
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN read_source_update_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN read_source_update_state <= ((read_init OR read_source_update) AND wire_w_lg_rsource_update_done1187w(0));
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN write_data_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN write_data_state <= (((write_init_counter AND bit_counter_param_start_match) OR (write_pre_data AND bit_counter_param_start_match)) OR (wire_w_lg_write_data1214w(0) AND wire_w_lg_bit_counter_all_done1213w(0)));
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN write_init_counter_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN write_init_counter_state <= wsource_update_done;
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN write_init_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN write_init_state <= (idle AND write_param);
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN write_load_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN write_load_state <= ((write_data AND bit_counter_all_done) OR (write_post_data AND bit_counter_all_done));
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN write_post_data_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN write_post_data_state <= (((write_data AND width_counter_param_width_match) AND wire_w_lg_bit_counter_all_done1213w(0)) OR wire_w_lg_write_post_data1220w(0));
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN write_pre_data_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN write_pre_data_state <= (wire_w_lg_write_init_counter1211w(0) OR wire_w_lg_write_pre_data1210w(0));
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN write_source_update_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN write_source_update_state <= ((write_init OR write_source_update) AND wire_w_lg_wsource_update_done1207w(0));
		END IF;
	END PROCESS;
	PROCESS (clock, reset)
	BEGIN
		IF (reset = '1') THEN write_wait_state <= '0';
		ELSIF (clock = '1' AND clock'event) THEN write_wait_state <= write_load;
		END IF;
	END PROCESS;
	wire_cntr5_w_lg_w_q_range39w42w(0) <= wire_cntr5_w_q_range39w(0) AND wire_cntr5_w_lg_w_q_range40w41w(0);
	wire_cntr5_w_lg_w_q_range40w41w(0) <= NOT wire_cntr5_w_q_range40w(0);
	wire_cntr5_w_q_range39w(0) <= wire_cntr5_q(0);
	wire_cntr5_w_q_range40w(0) <= wire_cntr5_q(1);
	cntr5 :  lpm_counter
	  GENERIC MAP (
		lpm_direction => "UP",
		lpm_port_updown => "PORT_UNUSED",
		lpm_width => 6
	  )
	  PORT MAP ( 
		aclr => reset,
		clock => clock,
		cnt_en => bit_counter_enable,
		q => wire_cntr5_q,
		sclr => bit_counter_clear
	  );
	cntr6 :  lpm_counter
	  GENERIC MAP (
		lpm_direction => "UP",
		lpm_port_updown => "PORT_UNUSED",
		lpm_width => 5
	  )
	  PORT MAP ( 
		aclr => reset,
		clock => clock,
		cnt_en => width_counter_enable,
		q => wire_cntr6_q,
		sclr => width_counter_clear
	  );
	sd4 :  cycloneive_rublock
	  PORT MAP ( 
		captnupdt => rublock_captnupdt,
		clk => rublock_clock,
		rconfig => rublock_reconfig,
		regin => rublock_regin,
		regout => wire_sd4_regout,
		rsttimer => reset_timer,
		shiftnld => rublock_shiftnld
	  );

 END RTL; --altremote_remote_update_0
--VALID FILE
