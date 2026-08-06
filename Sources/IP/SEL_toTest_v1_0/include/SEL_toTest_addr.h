/*
 * File Name:         SEL_Reverted\ipcore\SEL_toTest_v1_0\include\SEL_toTest_addr.h
 * Description:       C Header File
 * Created:           2026-07-27 16:15:07
*/

#ifndef SEL_TOTEST_H_
#define SEL_TOTEST_H_

#define  IPCore_Reset_SEL_toTest                                0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_PacketSize_AXI4_Stream_DAC2_Master_SEL_toTest   0x8  //Packet size for AXI4-Stream-DAC2 Master interface, the default value is 1024. The TLAST output signal of the AXI4-Stream-DAC2 Master interface is generated based on the packet size.
#define  IPCore_PacketSize_AXI4_Stream_DAC1_Master_SEL_toTest   0xC  //Packet size for AXI4-Stream-DAC1 Master interface, the default value is 1024. The TLAST output signal of the AXI4-Stream-DAC1 Master interface is generated based on the packet size.
#define  IPCore_Timestamp_SEL_toTest                            0x10  //contains unique IP timestamp (yymmddHHMM): 2607271204: 2607271615
#define  AXI4_LITE_CONTROL_PHASE_COS_Data_SEL_toTest            0x100  //data register for Inport AXI4_LITE_CONTROL.PHASE_COS
#define  AXI4_LITE_CONTROL_PHASE_SIN_Data_SEL_toTest            0x104  //data register for Inport AXI4_LITE_CONTROL.PHASE_SIN
#define  AXI4_LITE_CONTROL_MAG_SET_Data_SEL_toTest              0x108  //data register for Inport AXI4_LITE_CONTROL.MAG_SET
#define  AXI4_LITE_CONTROL_K_HIGH_Data_SEL_toTest               0x10C  //data register for Inport AXI4_LITE_CONTROL.K_HIGH
#define  AXI4_LITE_CONTROL_K_LOW_Data_SEL_toTest                0x110  //data register for Inport AXI4_LITE_CONTROL.K_LOW
#define  AXI4_LITE_CONTROL_PULSE_WIDTH_Data_SEL_toTest          0x114  //data register for Inport AXI4_LITE_CONTROL.PULSE_WIDTH
#define  AXI4_LITE_CONTROL_PULSE_EN_Data_SEL_toTest             0x118  //data register for Inport AXI4_LITE_CONTROL.PULSE_EN
#define  AXI4_LITE_CONTROL_AUTO_EN_Data_SEL_toTest              0x11C  //data register for Inport AXI4_LITE_CONTROL.AUTO_EN
#define  AXI4_LITE_CONTROL_REP_PERIOD_Data_SEL_toTest           0x120  //data register for Inport AXI4_LITE_CONTROL.REP_PERIOD

#endif /* SEL_TOTEST_H_ */
