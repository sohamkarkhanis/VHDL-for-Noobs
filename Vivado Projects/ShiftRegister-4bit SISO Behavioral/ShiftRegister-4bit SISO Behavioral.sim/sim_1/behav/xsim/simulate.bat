@echo off
REM ****************************************************************************
REM Vivado (TM) v2023.1 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
REM Generated by Vivado on Sun Sep 17 22:08:19 +0530 2023
REM SW Build 3865809 on Sun May  7 15:05:29 MDT 2023
REM
REM IP Build 3864474 on Sun May  7 20:36:21 MDT 2023
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim siso4bit_tb_behav -key {Behavioral:sim_1:Functional:siso4bit_tb} -tclbatch siso4bit_tb.tcl -view G:/Master-Rep/VLSI/to doo/weevado projekts/project_1/siso4bit_tb_behav.wcfg -log simulate.log"
call xsim  siso4bit_tb_behav -key {Behavioral:sim_1:Functional:siso4bit_tb} -tclbatch siso4bit_tb.tcl -view G:/Master-Rep/VLSI/to doo/weevado projekts/project_1/siso4bit_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
