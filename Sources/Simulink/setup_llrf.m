clear;
clc;

hdlsetuptoolpath('ToolName', 'Xilinx Vivado', 'ToolPath', "C:/Xilinx/Vivado/2024.1/bin");

%Sampling parameters
f_sample = 125e6;
f_IF = 10e6;
t_sample = 1/f_sample;

%Cavity transfer block parameters
Q_0 = 10^6;
Q_L = Q_0 / 2; %beta = 1 = Q_0/Q_E

omega_0 = 2 * pi * f_IF;
f_0_rf = 1.3e9;
omega_half = (f_0_rf / (2 * Q_L)) * 2 * pi;
tau = Q_0 / (2 * pi * f_0_rf);


%Filter
filt = WIDEIQFILT;
params = extractHDLParams(filt);
disp('Filter coeffs generated')

%rSqrt LUT
lut_rSqrt = LUT_gen; 
disp('LUT generated')