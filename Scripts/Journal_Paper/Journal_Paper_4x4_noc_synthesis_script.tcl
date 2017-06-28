remove_design -designs

analyze -library WORK -format vhdl {/home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/mlite_pack.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/component_pack.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/ParityChecker_for_LBDR.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/xbar.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/counter_threshold.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_with_checkers/Rxy_Reconf_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_with_checkers/LBDR_packet_drop_routing_part_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_with_checkers/Cx_Reconf_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/LBDR_packet_drop_with_checkers/LBDR_packet_drop_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers/FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/Arbiter_out_one_hot_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/arbiter_out_one_hot_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/Arbiter_in_one_hot_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/Arbiter_in_one_hot_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/allocator_logic_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/allocator_credit_counter_logic_pseudo_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Allocator_with_checkers/allocator_with_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/RTL/Chip_Designs/archive/IMMORTAL_Chip_2017/With_checkers/Router_32_bit_credit_based_packet_drop_classifier_SHMU_will_full_set_of_checkers.vhd /home/bniazmand/pc/clean_Bonfire/Bonfire/tmp/simul_temp/network_4x4_packet_drop_SHMU_credit_based_with_checkers.vhd}

elaborate network_4x4 -architecture behavior -library DEFAULT -parameters "DATA_WIDTH = 32, DATA_WIDTH_LV = 11"

create_clock -name "clk" -period 10 -waveform { 0 5  }  { clk  }
link

set_dont_touch reset

saif_map -start
# compile -exact_map
# compile_ultra -no_autoungroup

# sh vcd2saif -64 -input ../tmp/simul_temp/network_full_vcd.vcd -output network_FT_activity.saif
# read_saif -input network_FT_activity.saif -instance_name tb_network_4x4/NoC
# report_power -analysis_effort high -hierarchy -levels 2 > noc_full_activity_power_results.txt
# report_area -hierarchy > area.txt