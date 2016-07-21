--Copyright (C) 2016 Siavoosh Payandeh Azad
------------------------------------------------------------
-- This file is automatically generated!
-- Here are the parameters:
-- 	 network size x:2
-- 	 network size y:2
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL; 

entity network_2x2 is
 generic (DATA_WIDTH: integer := 32);
port (reset: in  std_logic; 
	clk: in  std_logic; 
	--------------
	RX_L_0: in std_logic_vector (DATA_WIDTH-1 downto 0);
	RTS_L_0, CTS_L_0: out std_logic;
	DRTS_L_0, DCTS_L_0: in std_logic;
	TX_L_0: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_1: in std_logic_vector (DATA_WIDTH-1 downto 0);
	RTS_L_1, CTS_L_1: out std_logic;
	DRTS_L_1, DCTS_L_1: in std_logic;
	TX_L_1: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_2: in std_logic_vector (DATA_WIDTH-1 downto 0);
	RTS_L_2, CTS_L_2: out std_logic;
	DRTS_L_2, DCTS_L_2: in std_logic;
	TX_L_2: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--------------
	RX_L_3: in std_logic_vector (DATA_WIDTH-1 downto 0);
	RTS_L_3, CTS_L_3: out std_logic;
	DRTS_L_3, DCTS_L_3: in std_logic;
	TX_L_3: out std_logic_vector (DATA_WIDTH-1 downto 0);
	--fault injector signals
	FI_Add_2_0, FI_Add_0_2: in std_logic_vector(4 downto 0);
	sta0_0_2, sta1_0_2, sta0_2_0, sta1_2_0: in std_logic;

	FI_Add_3_1, FI_Add_1_3: in std_logic_vector(4 downto 0);
	sta0_1_3, sta1_1_3, sta0_3_1, sta1_3_1: in std_logic;

	FI_Add_1_0, FI_Add_0_1: in std_logic_vector(4 downto 0);
	sta0_0_1, sta1_0_1, sta0_1_0, sta1_1_0: in std_logic;

	FI_Add_3_2, FI_Add_2_3: in std_logic_vector(4 downto 0);
	sta0_2_3, sta1_2_3, sta0_3_2, sta1_3_2: in std_logic
            ); 
end network_2x2; 


architecture behavior of network_2x2 is

-- Declaring router component
component router_parity is
 generic (
        DATA_WIDTH: integer := 32;
        current_address : integer := 5;
        Rxy_rst : integer := 60;
        Cx_rst : integer := 15;
        NoC_size : integer := 4
    );
    port (
    reset, clk: in std_logic;
    DCTS_N, DCTS_E, DCTS_w, DCTS_S, DCTS_L: in std_logic;
    DRTS_N, DRTS_E, DRTS_W, DRTS_S, DRTS_L: in std_logic;
    RX_N, RX_E, RX_W, RX_S, RX_L : in std_logic_vector (DATA_WIDTH-1 downto 0);
    RTS_N, RTS_E, RTS_W, RTS_S, RTS_L: out std_logic;
    CTS_N, CTS_E, CTS_w, CTS_S, CTS_L: out std_logic;
    TX_N, TX_E, TX_W, TX_S, TX_L: out std_logic_vector (DATA_WIDTH-1 downto 0);
    faulty_packet_N, faulty_packet_E, faulty_packet_W, faulty_packet_S, faulty_packet_L:out std_logic;
    healthy_packet_N, healthy_packet_E, healthy_packet_W, healthy_packet_S, healthy_packet_L:out std_logic);
end component; 


component fault_injector is 
  generic(DATA_WIDTH : integer := 32);
  port(
    data_in: in std_logic_vector (DATA_WIDTH-1 downto 0);
    address: in std_logic_vector(4 downto 0);
    sta_0: in std_logic;
    sta_1: in std_logic;
    data_out: out std_logic_vector (DATA_WIDTH-1 downto 0)
    );
end component;



component SHMU is
    generic (
        router_fault_info_width: integer := 5;
        network_size: integer := 2
     );
    
    port (  reset: in  std_logic;
            clk: in  std_logic;
            faulty_packet_E_0, healthy_packet_E_0, faulty_packet_S_0, healthy_packet_S_0, faulty_packet_L_0, healthy_packet_L_0: in std_logic;
            faulty_packet_W_1, healthy_packet_W_1, faulty_packet_S_1, healthy_packet_S_1, faulty_packet_L_1, healthy_packet_L_1: in std_logic;
            faulty_packet_E_2, healthy_packet_E_2, faulty_packet_N_2, healthy_packet_N_2, faulty_packet_L_2, healthy_packet_L_2: in std_logic;
            faulty_packet_W_3, healthy_packet_W_3, faulty_packet_N_3, healthy_packet_N_3, faulty_packet_L_3, healthy_packet_L_3: in std_logic
            );
end component;
-- generating bulk signals. not all of them are used in the design...
	signal DCTS_N_0, DCTS_E_0, DCTS_w_0, DCTS_S_0: std_logic;
	signal DCTS_N_1, DCTS_E_1, DCTS_w_1, DCTS_S_1: std_logic;
	signal DCTS_N_2, DCTS_E_2, DCTS_w_2, DCTS_S_2: std_logic;
	signal DCTS_N_3, DCTS_E_3, DCTS_w_3, DCTS_S_3: std_logic;

	signal DRTS_N_0, DRTS_E_0, DRTS_W_0, DRTS_S_0: std_logic;
	signal DRTS_N_1, DRTS_E_1, DRTS_W_1, DRTS_S_1: std_logic;
	signal DRTS_N_2, DRTS_E_2, DRTS_W_2, DRTS_S_2: std_logic;
	signal DRTS_N_3, DRTS_E_3, DRTS_W_3, DRTS_S_3: std_logic;

	signal RX_N_0, RX_E_0, RX_W_0, RX_S_0 : std_logic_vector (DATA_WIDTH-1 downto 0);
	signal RX_N_1, RX_E_1, RX_W_1, RX_S_1 : std_logic_vector (DATA_WIDTH-1 downto 0);
	signal RX_N_2, RX_E_2, RX_W_2, RX_S_2 : std_logic_vector (DATA_WIDTH-1 downto 0);
	signal RX_N_3, RX_E_3, RX_W_3, RX_S_3 : std_logic_vector (DATA_WIDTH-1 downto 0);

	signal CTS_N_0, CTS_E_0, CTS_w_0, CTS_S_0: std_logic;
	signal CTS_N_1, CTS_E_1, CTS_w_1, CTS_S_1: std_logic;
	signal CTS_N_2, CTS_E_2, CTS_w_2, CTS_S_2: std_logic;
	signal CTS_N_3, CTS_E_3, CTS_w_3, CTS_S_3: std_logic;

	signal RTS_N_0, RTS_E_0, RTS_W_0, RTS_S_0: std_logic;
	signal RTS_N_1, RTS_E_1, RTS_W_1, RTS_S_1: std_logic;
	signal RTS_N_2, RTS_E_2, RTS_W_2, RTS_S_2: std_logic;
	signal RTS_N_3, RTS_E_3, RTS_W_3, RTS_S_3: std_logic;

	signal TX_N_0, TX_E_0, TX_W_0, TX_S_0 : std_logic_vector (DATA_WIDTH-1 downto 0);
	signal TX_N_1, TX_E_1, TX_W_1, TX_S_1 : std_logic_vector (DATA_WIDTH-1 downto 0);
	signal TX_N_2, TX_E_2, TX_W_2, TX_S_2 : std_logic_vector (DATA_WIDTH-1 downto 0);
	signal TX_N_3, TX_E_3, TX_W_3, TX_S_3 : std_logic_vector (DATA_WIDTH-1 downto 0);

	signal faulty_packet_N_0, faulty_packet_E_0, faulty_packet_W_0, faulty_packet_S_0, faulty_packet_L_0: std_logic;
	signal faulty_packet_N_1, faulty_packet_E_1, faulty_packet_W_1, faulty_packet_S_1, faulty_packet_L_1: std_logic;
	signal faulty_packet_N_2, faulty_packet_E_2, faulty_packet_W_2, faulty_packet_S_2, faulty_packet_L_2: std_logic;
	signal faulty_packet_N_3, faulty_packet_E_3, faulty_packet_W_3, faulty_packet_S_3, faulty_packet_L_3: std_logic;

	signal healthy_packet_N_0, healthy_packet_E_0, healthy_packet_W_0, healthy_packet_S_0, healthy_packet_L_0: std_logic;
	signal healthy_packet_N_1, healthy_packet_E_1, healthy_packet_W_1, healthy_packet_S_1, healthy_packet_L_1: std_logic;
	signal healthy_packet_N_2, healthy_packet_E_2, healthy_packet_W_2, healthy_packet_S_2, healthy_packet_L_2: std_logic;
	signal healthy_packet_N_3, healthy_packet_E_3, healthy_packet_W_3, healthy_packet_S_3, healthy_packet_L_3: std_logic;

	


 begin



--        organizaiton of the network:
--     x --------------->
--  y         ----       ----
--  |        | 0  | --- | 1  |
--  |         ----       ----
--  |          |          |
--  |         ----       ----
--  |        | 2  | --- | 3  |
--  v         ----       ----
--                         

SHMU_unit:  SHMU 
    generic map(router_fault_info_width => 5,network_size => 2)
    port map(  reset => reset,
            clk => clk,
            faulty_packet_E_0 =>faulty_packet_E_0 , healthy_packet_E_0=>healthy_packet_E_0, faulty_packet_S_0 => faulty_packet_S_0, healthy_packet_S_0 => healthy_packet_S_0, faulty_packet_L_0 => faulty_packet_L_0, healthy_packet_L_0 => healthy_packet_L_0,
            faulty_packet_W_1 =>faulty_packet_W_1 , healthy_packet_W_1=>healthy_packet_W_1, faulty_packet_S_1 => faulty_packet_S_1, healthy_packet_S_1 => healthy_packet_S_1, faulty_packet_L_1 => faulty_packet_L_1, healthy_packet_L_1 => healthy_packet_L_1,
            faulty_packet_E_2 =>faulty_packet_E_2 , healthy_packet_E_2=>healthy_packet_E_2, faulty_packet_N_2 => faulty_packet_N_2, healthy_packet_N_2 => healthy_packet_N_2, faulty_packet_L_2 => faulty_packet_L_2, healthy_packet_L_2 => healthy_packet_L_2,
            faulty_packet_W_3 =>faulty_packet_W_3 , healthy_packet_W_3=>healthy_packet_W_3, faulty_packet_N_3 => faulty_packet_N_3, healthy_packet_N_3 => healthy_packet_N_3, faulty_packet_L_3 => faulty_packet_L_3, healthy_packet_L_3 => healthy_packet_L_3
            );




-- instantiating the routers
R_0: router_parity generic map (DATA_WIDTH  => DATA_WIDTH, current_address=>0, Rxy_rst => 60, Cx_rst => 10, NoC_size=>2)
PORT MAP (reset, clk, 
	DCTS_N_0, DCTS_E_0, DCTS_W_0, DCTS_S_0, DCTS_L_0,
	DRTS_N_0, DRTS_E_0, DRTS_W_0, DRTS_S_0, DRTS_L_0,
	RX_N_0, RX_E_0, RX_W_0, RX_S_0, RX_L_0,
	RTS_N_0, RTS_E_0, RTS_W_0, RTS_S_0, RTS_L_0,
	CTS_N_0, CTS_E_0, CTS_w_0, CTS_S_0, CTS_L_0,
	TX_N_0, TX_E_0, TX_W_0, TX_S_0, TX_L_0,
	faulty_packet_N_0, faulty_packet_E_0, faulty_packet_W_0, faulty_packet_S_0, faulty_packet_L_0,
	healthy_packet_N_0, healthy_packet_E_0, healthy_packet_W_0, healthy_packet_S_0, healthy_packet_L_0);

R_1: router_parity generic map (DATA_WIDTH  => DATA_WIDTH, current_address=>1, Rxy_rst => 60, Cx_rst => 12, NoC_size=>2)
PORT MAP (reset, clk, 
	DCTS_N_1, DCTS_E_1, DCTS_W_1, DCTS_S_1, DCTS_L_1,
	DRTS_N_1, DRTS_E_1, DRTS_W_1, DRTS_S_1, DRTS_L_1,
	RX_N_1, RX_E_1, RX_W_1, RX_S_1, RX_L_1,
	RTS_N_1, RTS_E_1, RTS_W_1, RTS_S_1, RTS_L_1,
	CTS_N_1, CTS_E_1, CTS_w_1, CTS_S_1, CTS_L_1,
	TX_N_1, TX_E_1, TX_W_1, TX_S_1, TX_L_1,
	faulty_packet_N_1, faulty_packet_E_1, faulty_packet_W_1, faulty_packet_S_1, faulty_packet_L_1,
	healthy_packet_N_1, healthy_packet_E_1, healthy_packet_W_1, healthy_packet_S_1, healthy_packet_L_1);

R_2: router_parity generic map (DATA_WIDTH  => DATA_WIDTH, current_address=>2, Rxy_rst => 60, Cx_rst => 3, NoC_size=>2)
PORT MAP (reset, clk, 
	DCTS_N_2, DCTS_E_2, DCTS_W_2, DCTS_S_2, DCTS_L_2,
	DRTS_N_2, DRTS_E_2, DRTS_W_2, DRTS_S_2, DRTS_L_2,
	RX_N_2, RX_E_2, RX_W_2, RX_S_2, RX_L_2,
	RTS_N_2, RTS_E_2, RTS_W_2, RTS_S_2, RTS_L_2,
	CTS_N_2, CTS_E_2, CTS_w_2, CTS_S_2, CTS_L_2,
	TX_N_2, TX_E_2, TX_W_2, TX_S_2, TX_L_2,
	faulty_packet_N_2, faulty_packet_E_2, faulty_packet_W_2, faulty_packet_S_2, faulty_packet_L_2,
	healthy_packet_N_2, healthy_packet_E_2, healthy_packet_W_2, healthy_packet_S_2, healthy_packet_L_2);

R_3: router_parity generic map (DATA_WIDTH  => DATA_WIDTH, current_address=>3, Rxy_rst => 60, Cx_rst => 5, NoC_size=>2)
PORT MAP (reset, clk, 
	DCTS_N_3, DCTS_E_3, DCTS_W_3, DCTS_S_3, DCTS_L_3,
	DRTS_N_3, DRTS_E_3, DRTS_W_3, DRTS_S_3, DRTS_L_3,
	RX_N_3, RX_E_3, RX_W_3, RX_S_3, RX_L_3,
	RTS_N_3, RTS_E_3, RTS_W_3, RTS_S_3, RTS_L_3,
	CTS_N_3, CTS_E_3, CTS_w_3, CTS_S_3, CTS_L_3,
	TX_N_3, TX_E_3, TX_W_3, TX_S_3, TX_L_3,
	faulty_packet_N_3, faulty_packet_E_3, faulty_packet_W_3, faulty_packet_S_3, faulty_packet_L_3,
	healthy_packet_N_3, healthy_packet_E_3, healthy_packet_W_3, healthy_packet_S_3, healthy_packet_L_3);


-- instantiating the Fault fault_injector
-- vertical FIs
FI_0_2: fault_injector generic map(DATA_WIDTH => DATA_WIDTH) 
 port map(
    data_in => TX_S_0,
    address => FI_Add_0_2,
    sta_0 => sta0_0_2,
    sta_1 => sta1_0_2,
    data_out => RX_N_2 
    );
FI_2_0: fault_injector generic map(DATA_WIDTH => DATA_WIDTH) 
 port map(
    data_in => TX_N_2,
    address => FI_Add_2_0,
    sta_0 => sta0_2_0,
    sta_1 => sta1_2_0,
    data_out => RX_S_0
    );
FI_1_3: fault_injector generic map(DATA_WIDTH => DATA_WIDTH) 
 port map(
    data_in => TX_S_1,
    address => FI_Add_1_3,
    sta_0 => sta0_1_3,
    sta_1 => sta1_1_3,
    data_out => RX_N_3 
    );
FI_3_1: fault_injector generic map(DATA_WIDTH => DATA_WIDTH) 
 port map(
    data_in => TX_N_3,
    address => FI_Add_3_1,
    sta_0 => sta0_3_1,
    sta_1 => sta1_3_1,
    data_out => RX_S_1
    );

-- horizontal FIs
FI_0_1: fault_injector generic map(DATA_WIDTH => DATA_WIDTH) 
 port map(
    data_in => TX_E_0,
    address => FI_Add_0_1,
    sta_0 => sta0_0_1,
    sta_1 => sta1_0_1,
    data_out =>  RX_W_1
    );
FI_1_0: fault_injector generic map(DATA_WIDTH => DATA_WIDTH) 
 port map(
    data_in => TX_W_1,
    address => FI_Add_1_0,
    sta_0 => sta0_1_0,
    sta_1 => sta1_1_0,
    data_out => RX_E_0
    );
FI_2_3: fault_injector generic map(DATA_WIDTH => DATA_WIDTH) 
 port map(
    data_in => TX_E_2,
    address => FI_Add_2_3,
    sta_0 => sta0_2_3,
    sta_1 => sta1_2_3,
    data_out =>  RX_W_3
    );
FI_3_2: fault_injector generic map(DATA_WIDTH => DATA_WIDTH) 
 port map(
    data_in => TX_W_3,
    address => FI_Add_3_2,
    sta_0 => sta0_3_2,
    sta_1 => sta1_3_2,
    data_out => RX_E_2
    );
---------------------------------------------------------------
-- binding the routers together
-- vertical handshakes
-- connecting router: 0 to router: 2 and vice versa
DRTS_N_2 <= RTS_S_0;
DCTS_S_0 <= CTS_N_2;
DRTS_S_0 <= RTS_N_2;
DCTS_N_2 <= CTS_S_0;
-------------------
-- connecting router: 1 to router: 3 and vice versa
DRTS_N_3 <= RTS_S_1;
DCTS_S_1 <= CTS_N_3;
DRTS_S_1 <= RTS_N_3;
DCTS_N_3 <= CTS_S_1;
-------------------

-- horizontal handshakes
-- connecting router: 0 to router: 1 and vice versa
DRTS_E_0 <= RTS_W_1;
DCTS_W_1 <= CTS_E_0;
DRTS_W_1 <= RTS_E_0;
DCTS_E_0 <= CTS_W_1;
-------------------
-- connecting router: 2 to router: 3 and vice versa
DRTS_E_2 <= RTS_W_3;
DCTS_W_3 <= CTS_E_2;
DRTS_W_3 <= RTS_E_2;
DCTS_E_2 <= CTS_W_3;
-------------------
end;
