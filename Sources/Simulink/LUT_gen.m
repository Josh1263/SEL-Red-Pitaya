function [lut_rSqrt] = LUT_gen
%Config
NUM_BITS = 11; %11 address bits after slicing top bit that's always 1
N = 2^NUM_BITS;
WL = 16; %Standard BRAM word
FL = 15;

%Grid
i = (0:N-1)';
x_n = 1 + (i/N);

%Float gen
lut_0float = 1 ./sqrt(x_n);
lut_1float = sqrt(2) ./ sqrt(x_n);

lut_combined_float = [lut_0float; lut_1float];

%Quantize and output
lut_rSqrt = fi(lut_combined_float, 0, WL, FL, 'RoundingMethod', 'Nearest');