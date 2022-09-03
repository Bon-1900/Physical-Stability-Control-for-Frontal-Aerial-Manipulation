clc;
clear;

%% set path
path_pos_baseline     = "./exp1.2.1_baseline/exp1.2.1_baseline_vehicle_local_position_0.csv";
path_pos_sp_baseline  = "./exp1.2.1_baseline/exp1.2.1_baseline_vehicle_local_position_setpoint_0.csv";

path_pos_w0_1       = "./exp1.2.1_w0.1/exp1.2.1_w0.1_vehicle_local_position_0.csv";
path_pos_sp_w0_1    = "./exp1.2.1_w0.1/exp1.2.1_w0.1_vehicle_local_position_setpoint_0.csv";

path_pos_w0_2       = "./exp1.2.1_w0.2/exp1.2.1_w0.2_vehicle_local_position_0.csv";
path_pos_sp_w0_2    = "./exp1.2.1_w0.2/exp1.2.1_w0.2_vehicle_local_position_setpoint_0.csv";

path_pos_w0_225       = "./exp1.2.1_w0.225/exp1.2.1_w0.225_vehicle_local_position_0.csv";
path_pos_sp_w0_225    = "./exp1.2.1_w0.225/exp1.2.1_w0.225_vehicle_local_position_setpoint_0.csv";

path_pos_w0_25      = "./exp1.2.1_w0.25/exp1.2.1_w0.25_vehicle_local_position_0.csv";
path_pos_sp_w0_25   = "./exp1.2.1_w0.25/exp1.2.1_w0.25_vehicle_local_position_setpoint_0.csv";


%% Process Data
t_start = 12;
t_end   = 32;

[data_mat_bl,    sp_mat_remapped_bl,    err_bl   ] = process_data (path_pos_baseline, path_pos_sp_baseline, t_start, t_end);
[data_mat_w0_1,  sp_mat_remapped_w0_1,  err_w0_1 ] = process_data (path_pos_w0_1, path_pos_sp_w0_1, t_start, t_end);
[data_mat_w0_2,  sp_mat_remapped_w0_2,  err_w0_2 ] = process_data (path_pos_w0_2, path_pos_sp_w0_2, t_start, t_end);
[data_mat_w0_225,  sp_mat_remapped_w0_225,  err_w0_225 ] = process_data (path_pos_w0_225, path_pos_sp_w0_225, t_start, t_end);
[data_mat_w0_25, sp_mat_remapped_w0_25, err_w0_25] = process_data (path_pos_w0_25, path_pos_sp_w0_25, t_start, t_end);


%% Plot xyz positions
figure
sgtitle('Exp1.2.1 Position Data')
for i_xyz=1:3
    subplot(3,1,i_xyz)
    hold on
    grid on
    plot(sp_mat_remapped_bl(:,1), sp_mat_remapped_bl(:,i_xyz+1))
    plot(data_mat_bl(:,1), data_mat_bl(:,(i_xyz+5)))
    plot(data_mat_w0_1(:,1), data_mat_w0_1(:,(i_xyz+5)))
    plot(data_mat_w0_2(:,1), data_mat_w0_2(:,(i_xyz+5)))
    plot(data_mat_w0_225(:,1), data_mat_w0_225(:,(i_xyz+5)))
    plot(data_mat_w0_25(:,1), data_mat_w0_25(:,(i_xyz+5)))
    xlabel('Simulation Time (sec)')
    switch i_xyz
        case 1
            ylabel('x position (m)')
        case 2
            ylabel('y position (m)')
        case 3
            ylabel('z position (m)')
    end
    legend('Setpoint','baseline','0.1kg load','0.2kg load','0.225kg load','0.25kg load','location','northwest')
    xlim([t_start, t_end])
end
saveas(gcf,'Plots/exp1.2.1_xyz_plot.jpg')

%% Plot xyz positions (stable)
figure
sgtitle('Exp1.2.1 Position Data (Stable Scenarios)')
for i_xyz=1:3
    subplot(3,1,i_xyz)
    hold on
    grid on
    plot(sp_mat_remapped_bl(:,1), sp_mat_remapped_bl(:,i_xyz+1))
    plot(data_mat_bl(:,1), data_mat_bl(:,(i_xyz+5)))
    plot(data_mat_w0_1(:,1), data_mat_w0_1(:,(i_xyz+5)))
    plot(data_mat_w0_2(:,1), data_mat_w0_2(:,(i_xyz+5)))
    plot(data_mat_w0_225(:,1), data_mat_w0_225(:,(i_xyz+5)))
    xlabel('Simulation Time (sec)')
    switch i_xyz
        case 1
            ylabel('x position (m)')
        case 2
            ylabel('y position (m)')
        case 3
            ylabel('z position (m)')
    end
    legend('Setpoint','baseline','0.1kg load','0.2kg load','0.225kg load','location','northwest')
    xlim([t_start, t_end])
end
saveas(gcf,'Plots/exp1.2.1_xyz_stable_plot.jpg')

%% Plot transitional error
figure
hold on
grid on
plot(data_mat_bl(:,1),    err_bl)
plot(data_mat_w0_1(:,1),  err_w0_1)
plot(data_mat_w0_2(:,1),  err_w0_2)
plot(data_mat_w0_225(:,1),  err_w0_225)
plot(data_mat_w0_25(:,1), err_w0_25)
legend('baseline','0.1kg load','0.2kg load','0.225kg load','0.25kg load','location','northwest')
xlabel('Simulation Time (sec)')
ylabel('Error (m)')
title ('exp1.2.1 Absolute Translational error')
xlim([t_start, t_end])
saveas(gcf,'Plots/exp1.2.1_err_plot.jpg')

%% Plot transitional error (stable)
% figure
% hold on
% grid on
% plot(data_mat_bl(:,1),    err_bl)
% plot(data_mat_w0_1(:,1),  err_w0_1)
% plot(data_mat_w0_2(:,1),  err_w0_2)
% plot(data_mat_w0_225(:,1),  err_w0_225)
% legend('baseline','0.1kg load','0.2kg load','0.225kg load','location','northwest')
% xlabel('Simulation Time (sec)')
% ylabel('Error (m)')
% title ('exp1.2.1 Absolute Translational error (Stable Scenarios)')
% xlim([t_start, t_end])
% saveas(gcf,'Plots/exp1.2.1_err_stable_plot.jpg')


%% HELPER FUNCS
function [data_mat, sp_mat_remapped, err] = process_data (data_path, sp_path, t_start, t_end)
% read csv
data_mat = readmatrix(data_path);
sp_mat   = readmatrix(sp_path);

% process data
% change time unit
data_mat = process_timestamp(data_mat);
sp_mat   = process_timestamp(sp_mat);

% reverse axis direction
data_mat(:,8) = -data_mat(:,8);
sp_mat(:,4)   = -sp_mat(:,4);

% convert NaN to 0
data_mat(isnan(data_mat)) =0;
sp_mat(isnan(sp_mat))     =0;

% trim data
data_mat = trim_data (t_start, t_end, data_mat);
sp_mat   = trim_data (t_start, t_end, sp_mat);

% remap setpoint data timestamp to match data timestamps
sp_mat_remapped = remap_sp (sp_mat(:,[2,3,4]), sp_mat(:,1), data_mat(:,1));
err             = get_err (sp_mat_remapped(:,[2,3,4]), data_mat(:,[6,7,8]));
end

function trimmed_mat = trim_data (start_t, end_t, mat)
trimmed_mat = [];
for i = 1:size (mat, 1)
    if mat(i,1) <= end_t && mat(i,1) >= start_t
        trimmed_mat = [trimmed_mat; mat(i,:)];
    end
end
end

function sp_remapped = remap_sp (setpoints, sp_ts,ts_ref)
% interpolate setpoint data to match the reference timestamps
% INPUT:
%   setpoints: n*3 matrix of setpoints
%   sp_ts: n*1 matrix of originals setpoint timestamp
%   ts_ref: m*1 matrix of reference timetstamp
% OUTPUT:
%   sp_remapped: m*4 matrix
sp_remapped = ts_ref;
sp_remapped(:,[2,3,4]) = 0;

for i = 1:size(ts_ref,1)
    for j = 2:size(sp_ts,1)
        if sp_ts(j,1)>=ts_ref(i,1) && sp_ts(1,1)<=ts_ref(i,1) && sp_ts(j-1,1)<=ts_ref(i,1)
            % while reference timestamp is larger than original timestamp
            sp_remapped (i,[2,3,4]) = setpoints(j,:);
        end
    end
end
sp_remapped(size(sp_remapped,1),[2,3,4]) = sp_remapped(size(sp_remapped,1)-1,[2,3,4]);
end

function err = get_err (x, y)
% calculate the magnitude of error
% INPUT:
%   x: n*3 matrix
%   y: n*3 matrix
% OUTPUT:
%   error: n*1 matrix
err = (y-x);
err = (err(:,1).^2 + err(:,2).^2 + err(:,3).^2).^0.5;
end

function data = process_timestamp (data)
% Chrote timestamps unit to seconds
data(:,1) = (data(:,1) ) * 1e-6;
end
