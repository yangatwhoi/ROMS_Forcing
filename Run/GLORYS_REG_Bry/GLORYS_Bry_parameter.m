% Time and coordinate control
%--------------------------------------------------------------------------
title       = 'BYECS';
time_begin  = [2020 1 1 0 0 0];
time_end    = [2021 1 1 0 0 0];
obc         = [1 1 1 1];
theta_s     = 4.5;
theta_b     = 1.5;
hc          = 5;
layer_N     = 30;       
%--------------------------------------------------------------------------
Data_dir    = ['E:\Data\GLORYS\glorys_reanalysis'];
IF_Separate = 1;
add_to_ssh  = 'zos_';
add_to_temp = 'thetao_';
add_to_salt = 'so_';
add_to_u    = 'uo_';
add_to_v    = 'vo_';
%--------------------------------------------------------------------------
IF_Monthly_output = 0;
