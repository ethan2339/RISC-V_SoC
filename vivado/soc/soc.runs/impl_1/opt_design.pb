
f
Command: %s
53*	vivadotcl25
!opt_design -directive ExploreArea2default:defaultZ4-113h px� 
h
$Directive used for opt_design is: %s67*	vivadotcl2
ExploreArea2default:defaultZ4-136h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0202default:defaultZ17-349h px� 
n
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_design2default:defaultZ4-22h px� 
R

Starting %s Task
103*constraints2
DRC2default:defaultZ18-103h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
U
DRC finished with %s
272*project2
0 Errors2default:defaultZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:02 ; elapsed = 00:00:02 . Memory (MB): peak = 2390.496 ; gain = 0.000 ; free physical = 2504 ; free virtual = 79202default:defaulth px� 
g

Starting %s Task
103*constraints2,
Cache Timing Information2default:defaultZ18-103h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
P
;Ending Cache Timing Information Task | Checksum: 224c450b0
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:04 ; elapsed = 00:00:03 . Memory (MB): peak = 2398.488 ; gain = 7.992 ; free physical = 2420 ; free virtual = 78352default:defaulth px� 
a

Starting %s Task
103*constraints2&
Logic Optimization2default:defaultZ18-103h px� 
i

Phase %s%s
101*constraints2
1 2default:default2
Retarget2default:defaultZ18-101h px� 
x
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
212default:default2
1162default:defaultZ31-138h px� 
K
Retargeted %s cell(s).
49*opt2
02default:defaultZ31-49h px� 
<
'Phase 1 Retarget | Checksum: 1b9bf58a7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:06 ; elapsed = 00:00:05 . Memory (MB): peak = 2466.488 ; gain = 0.000 ; free physical = 2417 ; free virtual = 78322default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Retarget2default:default2
1682default:default2
2742default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Retarget2default:default2
762default:defaultZ31-1021h px� 
u

Phase %s%s
101*constraints2
2 2default:default2(
Constant propagation2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12default:default2
62default:defaultZ31-138h px� 
H
3Phase 2 Constant propagation | Checksum: 2564ba4e7
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:08 ; elapsed = 00:00:07 . Memory (MB): peak = 2466.488 ; gain = 0.000 ; free physical = 2417 ; free virtual = 78322default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
1692default:default2
6482default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2(
Constant propagation2default:default2
752default:defaultZ31-1021h px� 
f

Phase %s%s
101*constraints2
3 2default:default2
Sweep2default:defaultZ18-101h px� 
9
$Phase 3 Sweep | Checksum: 2036fe24a
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:12 ; elapsed = 00:00:10 . Memory (MB): peak = 2466.488 ; gain = 0.000 ; free physical = 2406 ; free virtual = 78212default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
02default:default2
19102default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Sweep2default:default2
1532default:defaultZ31-1021h px� 
r

Phase %s%s
101*constraints2
4 2default:default2%
BUFG optimization2default:defaultZ18-101h px� 
�
4Inserted BUFG %s to drive %s load(s) on clock net %s141*opt21
riscv_jtag_tck_IBUF_BUFG_inst2default:default2
5802default:default2,
riscv_jtag_tck_IBUF_BUFG2default:defaultZ31-194h px� 
�
4Inserted BUFG %s to drive %s load(s) on clock net %s141*opt24
 riscv_rmii_refclk_IBUF_BUFG_inst2default:default2
2452default:default2/
riscv_rmii_refclk_IBUF_BUFG2default:defaultZ31-194h px� 
W
!Inserted %s BUFG(s) on clock nets140*opt2
22default:defaultZ31-193h px� 
E
0Phase 4 BUFG optimization | Checksum: 245b94d32
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:13 ; elapsed = 00:00:11 . Memory (MB): peak = 2466.488 ; gain = 0.000 ; free physical = 2414 ; free virtual = 78292default:defaulth px� 
�
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2%
BUFG optimization2default:default2
22default:default2
22default:default2
02default:defaultZ31-662h px� 
|

Phase %s%s
101*constraints2
5 2default:default2/
Shift Register Optimization2default:defaultZ18-101h px� 
O
:Phase 5 Shift Register Optimization | Checksum: 23b24ddea
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:16 ; elapsed = 00:00:15 . Memory (MB): peak = 2466.488 ; gain = 0.000 ; free physical = 2414 ; free virtual = 78292default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2/
Shift Register Optimization2default:default2
02default:default2
02default:defaultZ31-389h px� 
u

Phase %s%s
101*constraints2
6 2default:default2(
Constant propagation2default:defaultZ18-101h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
H
3Phase 6 Constant propagation | Checksum: 23b24ddea
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:17 ; elapsed = 00:00:16 . Memory (MB): peak = 2466.488 ; gain = 0.000 ; free physical = 2414 ; free virtual = 78292default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2(
Constant propagation2default:default2
02default:default2
02default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2(
Constant propagation2default:default2
752default:defaultZ31-1021h px� 
f

Phase %s%s
101*constraints2
7 2default:default2
Sweep2default:defaultZ18-101h px� 
9
$Phase 7 Sweep | Checksum: 206805ba6
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:19 ; elapsed = 00:00:18 . Memory (MB): peak = 2466.488 ; gain = 0.000 ; free physical = 2411 ; free virtual = 78272default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2default:default2
02default:default2
02default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Sweep2default:default2
1532default:defaultZ31-1021h px� 
l

Phase %s%s
101*constraints2
8 2default:default2
Resynthesis2default:defaultZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
K
Optimized %s modules.
74*opt2
842default:defaultZ31-74h px� 
�
Optimized module '%s'.
75*opt2M
9soc_auto_pc_0__axi_protocol_converter_v2_1_18_a_axi3_conv2default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2]
Isoc_auto_pc_0__axi_protocol_converter_v2_1_18_a_axi3_conv__parameterized02default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2M
9soc_auto_pc_0__axi_protocol_converter_v2_1_18_b_downsizer2default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2M
9soc_auto_pc_0__axi_protocol_converter_v2_1_18_w_axi3_conv2default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_auto_us_0__axi_dwidth_converter_v2_1_18_r_upsizer2default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_auto_us_0__axi_dwidth_converter_v2_1_18_w_upsizer2default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2a
Msoc_auto_us_0__axi_register_slice_v2_1_18_axic_register_slice__parameterized32default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2c
Osoc_auto_us_0__axi_register_slice_v2_1_18_axic_register_slice__parameterized3_02default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_auto_us_0__generic_baseblocks_v2_1_0_command_fifo2default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2K
7soc_auto_us_0__generic_baseblocks_v2_1_0_command_fifo_22default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2Y
Esoc_auto_us_0__generic_baseblocks_v2_1_0_command_fifo__parameterized02default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2[
Gsoc_auto_us_0__generic_baseblocks_v2_1_0_command_fifo__parameterized0_12default:defaultZ31-75h px� 
l
Optimized module '%s'.
75*opt26
"soc_axi_apb_bridge_0_0_axilite_sif2default:defaultZ31-75h px� 
a
Optimized module '%s'.
75*opt2+
soc_cpu_wrap_0_0_apb_rx2default:defaultZ31-75h px� 
i
Optimized module '%s'.
75*opt23
soc_cpu_wrap_0_0_axi2apb_bridge2default:defaultZ31-75h px� 
y
Optimized module '%s'.
75*opt2C
/soc_cpu_wrap_0_0_axi2apb_bridge__parameterized02default:defaultZ31-75h px� 
i
Optimized module '%s'.
75*opt23
soc_cpu_wrap_0_0_axi2mem_bridge2default:defaultZ31-75h px� 
y
Optimized module '%s'.
75*opt2C
/soc_cpu_wrap_0_0_axi2mem_bridge__parameterized02default:defaultZ31-75h px� 
p
Optimized module '%s'.
75*opt2:
&soc_cpu_wrap_0_0_axi_arbitrator_2s_id82default:defaultZ31-75h px� 
l
Optimized module '%s'.
75*opt26
"soc_cpu_wrap_0_0_axi_arbitrator_5s2default:defaultZ31-75h px� 
^
Optimized module '%s'.
75*opt2(
soc_cpu_wrap_0_0_btb2default:defaultZ31-75h px� 
h
Optimized module '%s'.
75*opt22
soc_cpu_wrap_0_0_dap_resp_fifo2default:defaultZ31-75h px� 
i
Optimized module '%s'.
75*opt23
soc_cpu_wrap_0_0_dap_wdata_fifo2default:defaultZ31-75h px� 
a
Optimized module '%s'.
75*opt2+
soc_cpu_wrap_0_0_dbgapb2default:defaultZ31-75h px� 
a
Optimized module '%s'.
75*opt2+
soc_cpu_wrap_0_0_dbgmon2default:defaultZ31-75h px� 
c
Optimized module '%s'.
75*opt2-
soc_cpu_wrap_0_0_dma_fifo2default:defaultZ31-75h px� 
e
Optimized module '%s'.
75*opt2/
soc_cpu_wrap_0_0_dma_fifo_52default:defaultZ31-75h px� 
^
Optimized module '%s'.
75*opt2(
soc_cpu_wrap_0_0_dpu2default:defaultZ31-75h px� 
e
Optimized module '%s'.
75*opt2/
soc_cpu_wrap_0_0_gateway_242default:defaultZ31-75h px� 
e
Optimized module '%s'.
75*opt2/
soc_cpu_wrap_0_0_gateway_252default:defaultZ31-75h px� 
e
Optimized module '%s'.
75*opt2/
soc_cpu_wrap_0_0_gateway_292default:defaultZ31-75h px� 
e
Optimized module '%s'.
75*opt2/
soc_cpu_wrap_0_0_gateway_332default:defaultZ31-75h px� 
c
Optimized module '%s'.
75*opt2-
soc_cpu_wrap_0_0_gray2bin2default:defaultZ31-75h px� 
e
Optimized module '%s'.
75*opt2/
soc_cpu_wrap_0_0_gray2bin_12default:defaultZ31-75h px� 
b
Optimized module '%s'.
75*opt2,
soc_cpu_wrap_0_0_jtag_dp2default:defaultZ31-75h px� 
^
Optimized module '%s'.
75*opt2(
soc_cpu_wrap_0_0_l1c2default:defaultZ31-75h px� 
n
Optimized module '%s'.
75*opt28
$soc_cpu_wrap_0_0_l1c__parameterized02default:defaultZ31-75h px� 
^
Optimized module '%s'.
75*opt2(
soc_cpu_wrap_0_0_mac2default:defaultZ31-75h px� 
d
Optimized module '%s'.
75*opt2.
soc_cpu_wrap_0_0_mac_afifo2default:defaultZ31-75h px� 
f
Optimized module '%s'.
75*opt20
soc_cpu_wrap_0_0_mac_afifo_62default:defaultZ31-75h px� 
c
Optimized module '%s'.
75*opt2-
soc_cpu_wrap_0_0_mac_fifo2default:defaultZ31-75h px� 
a
Optimized module '%s'.
75*opt2+
soc_cpu_wrap_0_0_mem_ap2default:defaultZ31-75h px� 
^
Optimized module '%s'.
75*opt2(
soc_cpu_wrap_0_0_mmu2default:defaultZ31-75h px� 
n
Optimized module '%s'.
75*opt28
$soc_cpu_wrap_0_0_mmu__parameterized02default:defaultZ31-75h px� 
b
Optimized module '%s'.
75*opt2,
soc_cpu_wrap_0_0_mmu_csr2default:defaultZ31-75h px� 
_
Optimized module '%s'.
75*opt2)
soc_cpu_wrap_0_0_plic2default:defaultZ31-75h px� 
^
Optimized module '%s'.
75*opt2(
soc_cpu_wrap_0_0_rgu2default:defaultZ31-75h px� 
c
Optimized module '%s'.
75*opt2-
soc_cpu_wrap_0_0_scu_fifo2default:defaultZ31-75h px� 
^
Optimized module '%s'.
75*opt2(
soc_cpu_wrap_0_0_spi2default:defaultZ31-75h px� 
^
Optimized module '%s'.
75*opt2(
soc_cpu_wrap_0_0_sru2default:defaultZ31-75h px� 
c
Optimized module '%s'.
75*opt2-
soc_cpu_wrap_0_0_systimer2default:defaultZ31-75h px� 
^
Optimized module '%s'.
75*opt2(
soc_cpu_wrap_0_0_tlb2default:defaultZ31-75h px� 
b
Optimized module '%s'.
75*opt2,
soc_cpu_wrap_0_0_tx_ctrl2default:defaultZ31-75h px� 
}
Optimized module '%s'.
75*opt2G
3soc_smartconnect_0_0_sc_exit_v1_0_8_b2s_simple_fifo2default:defaultZ31-75h px� 
}
Optimized module '%s'.
75*opt2G
3soc_smartconnect_0_0_sc_exit_v1_0_8_null_bt_supress2default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2K
7soc_smartconnect_0_0_sc_si_converter_v1_0_7_offset_fifo2default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2N
:soc_smartconnect_0_0_sc_si_converter_v1_0_7_offset_fifo_682default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2N
:soc_smartconnect_0_0_sc_si_converter_v1_0_7_offset_fifo_702default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2N
:soc_smartconnect_0_0_sc_si_converter_v1_0_7_offset_fifo_722default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2[
Gsoc_smartconnect_0_0_sc_si_converter_v1_0_7_offset_fifo__parameterized02default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2K
7soc_smartconnect_0_0_sc_si_converter_v1_0_7_wrap_narrow2default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2T
@soc_smartconnect_0_0_sc_transaction_regulator_v1_0_8_multithread2default:defaultZ31-75h px� 
{
Optimized module '%s'.
75*opt2E
1soc_smartconnect_0_0_sc_util_v1_0_4_axi_reg_stall2default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_smartconnect_0_0_sc_util_v1_0_4_axi_reg_stall_3362default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_smartconnect_0_0_sc_util_v1_0_4_axi_reg_stall_3372default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_smartconnect_0_0_sc_util_v1_0_4_axi_reg_stall_3382default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_smartconnect_0_0_sc_util_v1_0_4_axi_reg_stall_3392default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_smartconnect_0_0_sc_util_v1_0_4_axi_reg_stall_4572default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_smartconnect_0_0_sc_util_v1_0_4_axi_reg_stall_4582default:defaultZ31-75h px� 
~
Optimized module '%s'.
75*opt2H
4soc_smartconnect_0_0_sc_util_v1_0_4_axi_reg_stall_472default:defaultZ31-75h px� 
~
Optimized module '%s'.
75*opt2H
4soc_smartconnect_0_0_sc_util_v1_0_4_axi_reg_stall_652default:defaultZ31-75h px� 

Optimized module '%s'.
75*opt2I
5soc_smartconnect_0_0_sc_util_v1_0_4_axic_reg_srl_fifo2default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2]
Isoc_smartconnect_0_0_sc_util_v1_0_4_axic_reg_srl_fifo__parameterized0_4632default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2]
Isoc_smartconnect_0_0_sc_util_v1_0_4_axic_reg_srl_fifo__parameterized3_2302default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2]
Isoc_smartconnect_0_0_sc_util_v1_0_4_axic_reg_srl_fifo__parameterized3_2832default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2Y
Esoc_smartconnect_0_0_sc_util_v1_0_4_axic_reg_srl_fifo__parameterized42default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2Y
Esoc_smartconnect_0_0_sc_util_v1_0_4_axic_reg_srl_fifo__parameterized52default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2O
;soc_smartconnect_0_0_sc_util_v1_0_4_counter__parameterized02default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2R
>soc_smartconnect_0_0_sc_util_v1_0_4_counter__parameterized0_292default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2S
?soc_smartconnect_0_0_sc_util_v1_0_4_counter__parameterized0_3572default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2S
?soc_smartconnect_0_0_sc_util_v1_0_4_counter__parameterized0_3652default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2R
>soc_smartconnect_0_0_sc_util_v1_0_4_counter__parameterized0_372default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2S
?soc_smartconnect_0_0_sc_util_v1_0_4_counter__parameterized0_4242default:defaultZ31-75h px� 
�
Optimized module '%s'.
75*opt2S
?soc_smartconnect_0_0_sc_util_v1_0_4_counter__parameterized0_4332default:defaultZ31-75h px� 
v
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
42default:default2
392default:defaultZ31-138h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
?
*Phase 8 Resynthesis | Checksum: 1787414a1
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:57 ; elapsed = 00:01:56 . Memory (MB): peak = 2505.820 ; gain = 39.332 ; free physical = 2400 ; free virtual = 78162default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2
Resynthesis2default:default2
194712default:default2
206912default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Resynthesis2default:default2
1552default:defaultZ31-1021h px� 
x

Phase %s%s
101*constraints2
9 2default:default2+
Post Processing Netlist2default:defaultZ18-101h px� 
K
6Phase 9 Post Processing Netlist | Checksum: 1787414a1
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:02:58 ; elapsed = 00:01:56 . Memory (MB): peak = 2505.820 ; gain = 39.332 ; free physical = 2399 ; free virtual = 78162default:defaulth px� 
�
.Phase %s created %s cells and removed %s cells267*opt2+
Post Processing Netlist2default:default2
02default:default2
02default:defaultZ31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2+
Post Processing Netlist2default:default2
752default:defaultZ31-1021h px� 
/
Opt_design Change Summary
*commonh px� 
/
=========================
*commonh px� 


*commonh px� 


*commonh px� 
�
z-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�	
�	|  Retarget                     |             168  |             274  |                                             76  |
|  Constant propagation         |             169  |             648  |                                             75  |
|  Sweep                        |               0  |            1910  |                                            153  |
|  BUFG optimization            |               2  |               0  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Constant propagation         |               0  |               0  |                                             75  |
|  Sweep                        |               0  |               0  |                                            153  |
|  Resynthesis                  |           19471  |           20691  |                                            155  |
|  Post Processing Netlist      |               0  |               0  |                                             75  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
a

Starting %s Task
103*constraints2&
Connectivity Check2default:defaultZ18-103h px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.24 ; elapsed = 00:00:00.24 . Memory (MB): peak = 2505.820 ; gain = 0.000 ; free physical = 2399 ; free virtual = 78162default:defaulth px� 
J
5Ending Logic Optimization Task | Checksum: 180504c50
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:03:00 ; elapsed = 00:01:58 . Memory (MB): peak = 2505.820 ; gain = 39.332 ; free physical = 2399 ; free virtual = 78162default:defaulth px� 
a

Starting %s Task
103*constraints2&
Power Optimization2default:defaultZ18-103h px� 
s
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.002default:defaultZ34-132h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px� 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px� 
�
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2default:default2
 2default:default2
2.0972default:default2
0.0002default:defaultZ32-619h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 


*pwropth px� 
e

Starting %s Task
103*constraints2*
PowerOpt Patch Enables2default:defaultZ18-103h px� 
�
�WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02default:default2
512default:defaultZ34-162h px� 
d
+Structural ODC has moved %s WE to EN ports
155*pwropt2
02default:defaultZ34-201h px� 
�
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
322default:default2
152default:default2
1022default:defaultZ34-65h px� 
N
9Ending PowerOpt Patch Enables Task | Checksum: 1b67f4944
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.53 ; elapsed = 00:00:00.56 . Memory (MB): peak = 3042.609 ; gain = 0.000 ; free physical = 2233 ; free virtual = 76502default:defaulth px� 
J
5Ending Power Optimization Task | Checksum: 1b67f4944
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:50 ; elapsed = 00:00:33 . Memory (MB): peak = 3042.609 ; gain = 536.789 ; free physical = 2299 ; free virtual = 77162default:defaulth px� 
\

Starting %s Task
103*constraints2!
Final Cleanup2default:defaultZ18-103h px� 
E
0Ending Final Cleanup Task | Checksum: 1b67f4944
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00 ; elapsed = 00:00:00 . Memory (MB): peak = 3042.609 ; gain = 0.000 ; free physical = 2300 ; free virtual = 77162default:defaulth px� 
b

Starting %s Task
103*constraints2'
Netlist Obfuscation2default:defaultZ18-103h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.032default:default2
3042.6092default:default2
0.0002default:default2
23002default:default2
77162default:defaultZ17-722h px� 
K
6Ending Netlist Obfuscation Task | Checksum: 1e80d1210
*commonh px� 
�

%s
*constraints2�
�Time (s): cpu = 00:00:00.04 ; elapsed = 00:00:00.03 . Memory (MB): peak = 3042.609 ; gain = 0.000 ; free physical = 2300 ; free virtual = 77162default:defaulth px� 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1432default:default2
22default:default2
12default:default2
02default:defaultZ4-41h px� 
\
%s completed successfully
29*	vivadotcl2

opt_design2default:defaultZ4-42h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2 
opt_design: 2default:default2
00:03:582default:default2
00:02:392default:default2
3042.6092default:default2
652.1132default:default2
23002default:default2
77162default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.012default:default2
00:00:00.012default:default2
3042.6092default:default2
0.0002default:default2
23002default:default2
77162default:defaultZ17-722h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
D
Writing placer database...
1603*designutilsZ20-1893h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2)
Write XDEF Complete: 2default:default2
00:00:00.162default:default2
00:00:00.082default:default2
3042.6092default:default2
0.0002default:default2
23002default:default2
77202default:defaultZ17-722h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2.
Netlist sorting complete. 2default:default2
00:00:00.042default:default2
00:00:00.022default:default2
3042.6092default:default2
0.0002default:default2
23002default:default2
77472default:defaultZ17-722h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2Z
F/home/yutong/RISC-V_SoC/vivado/soc/soc.runs/impl_1/soc_wrapper_opt.dcp2default:defaultZ17-1381h px� 
�
r%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s ; free physical = %s ; free virtual = %s
480*common2&
write_checkpoint: 2default:default2
00:00:132default:default2
00:00:162default:default2
3042.6092default:default2
0.0002default:default2
23132default:default2
77442default:defaultZ17-722h px� 
�
%s4*runtcl2�
sExecuting : report_drc -file soc_wrapper_drc_opted.rpt -pb soc_wrapper_drc_opted.pb -rpx soc_wrapper_drc_opted.rpx
2default:defaulth px� 
�
Command: %s
53*	vivadotcl2z
freport_drc -file soc_wrapper_drc_opted.rpt -pb soc_wrapper_drc_opted.pb -rpx soc_wrapper_drc_opted.rpx2default:defaultZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
o
+unexpected site type '%s' in HDPYFinalizeIO2006*designutils2
IOPAD2default:defaultZ20-3303h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2'
Designutils 20-33032default:default2
1002default:defaultZ17-14h px� 
�
#The results of DRC are in file %s.
168*coretcl2�
L/home/yutong/RISC-V_SoC/vivado/soc/soc.runs/impl_1/soc_wrapper_drc_opted.rptL/home/yutong/RISC-V_SoC/vivado/soc/soc.runs/impl_1/soc_wrapper_drc_opted.rpt2default:default8Z2-168h px� 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px� 


End Record