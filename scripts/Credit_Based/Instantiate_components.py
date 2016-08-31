from CB_functions import rxy_rst_calculator, cx_rst_calculator

def instantiate_shmu(noc_file, network_dime):

    noc_file.write("-- instantiating the SHMU\n")

    noc_file.write("monitoring_unit: SHMU \n")
    noc_file.write("    generic map( router_fault_info_width => 5 ,network_size => "+str(network_dime)+" )\n")
    noc_file.write("    port map(  reset =>reset, clk => clk,\n")
    string_to_print = ""
    for i in range(0, network_dime**2):
        string_to_print += "        faulty_packet_N_"+str(i)+" => faulty_packet_N"+str(i)+", healthy_packet_N_"+str(i)+" => healthy_packet_N"+str(i)+",\n"
        string_to_print += "        faulty_packet_E_"+str(i)+" => faulty_packet_E"+str(i)+", healthy_packet_E_"+str(i)+" => healthy_packet_E"+str(i)+",\n"
        string_to_print += "        faulty_packet_W_"+str(i)+" => faulty_packet_W"+str(i)+", healthy_packet_W_"+str(i)+" => healthy_packet_W"+str(i)+",\n"
        string_to_print += "        faulty_packet_S_"+str(i)+" => faulty_packet_S"+str(i)+", healthy_packet_S_"+str(i)+" => healthy_packet_S"+str(i)+",\n"
        string_to_print += "        faulty_packet_L_"+str(i)+" => faulty_packet_L"+str(i)+", healthy_packet_L_"+str(i)+" => healthy_packet_L"+str(i)+",\n"
    noc_file.write(string_to_print[0: len(string_to_print)-2])
    noc_file.write(");\n")


def instantiate_router(noc_file, network_dime, add_parity):
    noc_file.write("-- instantiating the routers\n")
    for i in range(0, network_dime**2):
        if add_parity:
          noc_file.write("R_"+str(i)+": router_credit_based_parity generic map (DATA_WIDTH  => DATA_WIDTH, ")
        else:
          noc_file.write("R_"+str(i)+": router_credit_based generic map (DATA_WIDTH  => DATA_WIDTH, ")

        noc_file.write("current_address=>"+str(i)+", Rxy_rst => "+str(rxy_rst_calculator(i))+", " +
                       "Cx_rst => "+str(cx_rst_calculator(i, network_dime))+", NoC_size=>"+str(network_dime)+")\n")
        noc_file.write("PORT MAP (reset, clk, \n")
        noc_file.write("\tRX_N_"+str(i)+", RX_E_"+str(i)+", RX_W_"+str(i)+", RX_S_"+str(i)+", RX_L_"+str(i)+",\n")
        noc_file.write("\tcredit_in_N_"+str(i)+", credit_in_E_"+str(i)+", credit_in_W_"+str(i)+", credit_in_S_"+str(i)+", credit_in_L_"+str(i)+",\n")
        noc_file.write("\tvalid_in_N_"+str(i)+", valid_in_E_"+str(i)+", valid_in_W_"+str(i)+", valid_in_S_"+str(i)+", valid_in_L_"+str(i)+",\n")
        noc_file.write("\tvalid_out_N_"+str(i)+", valid_out_E_"+str(i)+", valid_out_W_"+str(i)+", valid_out_S_"+str(i)+", valid_out_L_"+str(i)+",\n")
        noc_file.write("\tcredit_out_N_"+str(i)+", credit_out_E_"+str(i)+", credit_out_W_"+str(i)+", credit_out_S_"+str(i)+", credit_out_L_"+str(i)+",\n")
        if add_parity:
          noc_file.write("\tTX_N_"+str(i)+", TX_E_"+str(i)+", TX_W_"+str(i)+", TX_S_"+str(i)+", TX_L_"+str(i)+",\n")
          noc_file.write("\tfaulty_packet_N"+str(i)+", faulty_packet_E"+str(i)+", faulty_packet_W"+str(i)+", faulty_packet_S"+str(i)+", faulty_packet_L"+str(i)+",\n")
          noc_file.write("\thealthy_packet_N"+str(i)+", healthy_packet_E"+str(i)+", healthy_packet_W"+str(i)+", healthy_packet_S"+str(i)+", healthy_packet_L"+str(i)+"\n")
        else:
          noc_file.write("\tTX_N_"+str(i)+", TX_E_"+str(i)+", TX_W_"+str(i)+", TX_S_"+str(i)+", TX_L_"+str(i))
        noc_file.write("); \n\n")

    noc_file.write("\n")