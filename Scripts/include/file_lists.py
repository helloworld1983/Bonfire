#CB files
credit_based_files = ["arbiter_in.vhd", "arbiter_out.vhd", "allocator.vhd", "LBDR.vhd", "xbar.vhd", "FIFO_one_hot_credit_based.vhd"]

credit_based_files_PD_FC = ["arbiter_in.vhd", "arbiter_out.vhd", "allocator.vhd", "LBDR_packet_drop.vhd", "xbar.vhd", "FIFO_one_hot_credit_based_packet_drop_classifier_support.vhd",
							"counter_threshold.vhd"]

credit_based_files_PD = ["arbiter_in.vhd", "arbiter_out.vhd", "allocator.vhd", "LBDR_packet_drop.vhd", "xbar.vhd", "FIFO_one_hot_credit_based_packet_drop.vhd"]

credit_based_files_PS = ["arbiter_in.vhd", "arbiter_out.vhd", "allocator.vhd", "LBDR_packet_drop.vhd", "xbar.vhd", "FIFO_one_hot_credit_based_packet_drop_flit_saving.vhd"]

credit_based_files_LV = ["arbiter_in.vhd", "arbiter_out.vhd", "allocator.vhd", "LBDR_packet_drop.vhd", "xbar.vhd", "counter_threshold.vhd"]


PE_files = ["mlite_pack.vhd", "alu.vhd", "bus_mux.vhd", "cache.vhd",
            "control.vhd", "ddr_ctrl.vhd", "eth_dma.vhd", "mem_ctrl.vhd",
            "mult.vhd", "pc_next.vhd", "pipeline.vhd", "ram.vhd",
            "reg_bank.vhd", "shifter.vhd", "uart.vhd", "NI.vhd",
            "mlite_cpu.vhd", "plasma.vhd", "NoC_Node.vhd"]


## LV related stuff
LV_common_files = ["packetizer_LV.vhd", "TB_Package_LV_CB_multi_flit.vhd"]

LV_files_4 = ["arbiter_out.vhd", "allocator_LV.vhd", "FIFO_one_hot_LV_CB.vhd",
              "LBDR_LV.vhd", "Router_LV_CB.vhd", "xbar_LV.vhd" ]

LV_files_2 = ["arbiter_out.vhd", "allocator_LV.vhd", "FIFO_one_hot_LV_CB.vhd", 
              "LBDR_LV.vhd", "Router_LV_CB_2_port.vhd", "xbar_LV.vhd"]

# HS files
handshaking_files = ["Arbiter.vhd", "FIFO_one_hot_handshaking.vhd", "LBDR.vhd", "xbar.vhd"]

##checker related stuff
## CB
CB_Allocator_with_checkers_files = ["Arbiter_in_one_hot_checkers.vhd", "Arbiter_in_one_hot_with_checkers.vhd", "Arbiter_out_one_hot_pseudo_checkers.vhd",
									"arbiter_out_one_hot_with_checkers.vhd", "allocator_logic_pseudo_checkers.vhd", "allocator_credit_counter_logic_pseudo_checkers.vhd",
									"allocator_with_checkers.vhd" ]

CB_FIFO_one_hot_CB_PD_FC_with_checkers_files = ["FIFO_one_hot_credit_based_packet_drop_classifier_support_checkers.vhd",
											 "FIFO_one_hot_credit_based_packet_drop_classifier_support_with_checkers.vhd"]								

CB_LBDR_PD_with_checkers_files = ["Cx_Reconf_pseudo_checkers.vhd", "Rxy_Reconf_pseudo_checkers", "LBDR_packet_drop_routing_part_pseudo_checkers.vhd",
								"LBDR_packet_drop_with_checkers.vhd"]

# HS
HS_Arbiter_one_hot_with_checkers =["Arbiter_checkers.vhd", "Arbiter_one_hot_with_checkers.vhd"]
HS_FIFO_one_hot_with_checkers =["FIFO_control_part_checkers.vhd", "FIFO_one_hot_with_checkers.vhd"]
HS_LBDR_with_checkers =["LBDR_checkers.vhd", "LBDR_with_checkers.vhd"]