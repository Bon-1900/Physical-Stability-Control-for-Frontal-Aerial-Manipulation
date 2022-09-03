clc;
clear;

%% set path
path_pos_baseline     = "./exp1.1.1_baseline/exp1.1.1_baseline_vehicle_local_position_0.csv";
path_pos_sp_baseline  = "./exp1.1.1_baseline/exp1.1.1_baseline_vehicle_local_position_setpoint_0.csv";

path_pos_w1_0       = "./exp1.1.1_W1.0/exp1.1.1_W1.0_vehicle_local_position_0.csv";
path_pos_sp_w1_0    = "./exp1.1.1_W1.0/exp1.1.1_W1.0_vehicle_local_position_setpoint_0.csv";

path_pos_w1_1       = "./exp1.1.1_W1.1/exp1.1.1_W1.1_vehicle_local_position_0.csv";
path_pos_sp_w1_1    = "./exp1.1.1_W1.1/exp1.1.1_W1.1_vehicle_local_position_setpoint_0.csv";

path_pos_w1_2       = "./exp1.1.1_W1.2/exp1.1.1_W1.2_vehicle_local_position_0.csv";
path_pos_sp_w1_2    = "./exp1.1.1_W1.2/exp1.1.1_W1.2_vehicle_local_position_setpoint_0.csv";

path_pos_w1_25      = "./exp1.1.1_W1.25/exp1.1.1_W1.25_vehicle_local_position_0.csv";
path_pos_sp_w1_25   = "./exp1.1.1_W1.25/exp1.1.1_W1.25_vehicle_local_position_setpoint_0.csv";

path_pos_w1_3       = "./exp1.1.1_W1.3/exp1.1.1_W1.3_vehicle_local_position_0.csv";
path_pos_sp_w1_3    = "./exp1.1.1_W1.3/exp1.1.1_W1.3_vehicle_local_position_setpoint_0.csv";


%% Process Data
[data_mat_bl,    sp_mat_remapped_bl,    err_bl   ] = process_data (path_pos_baseline, path_pos_sp_baseline);
[data_mat_w1_0,  sp_mat_remapped_w1_0,  err_w1_0 ] = process_data (path_pos_w1_0, path_pos_sp_w1_0);
[data_mat_w1_1,  sp_mat_remapped_w1_1,  err_w1_1 ] = process_data (path_pos_w1_1, path_pos_sp_w1_1);
[data_mat_w1_2,  sp_mat_remapped_w1_2,  err_w1_2 ] = process_data (path_pos_w1_1, path_pos_sp_w1_1);
[data_mat_w1_25, sp_mat_remapped_w1_25, err_w1_25] = process_data (path_pos_w1_25, path_pos_sp_w1_25);
[data_mat_w1_3,  sp_mat_remapped_w1_3,  err_w1_3 ] = process_data (path_pos_w1_3, path_pos_sp_w1_3);

%% Plot xyz positions
figure
sgtitle('Exp1.1.1 Position Data')
for i_xyz=1:3
    subplot(3,1,i_xyz)
    hold on
    grid on
    plot(sp_mat_remapped_bl(:,1), sp_mat_remapped_bl(:,i_xyz+1))
    plot(data_mat_bl(:,1), data_mat_bl(:,(i_xyz+5)))
    plot(data_mat_w1_0(:,1), data_mat_w1_0(:,(i_xyz+5)))
    plot(data_mat_w1_1(:,1), data_mat_w1_1(:,(i_xyz+5)))
    plot(data_mat_w1_2(:,1), data_mat_w1_2(:,(i_xyz+5)))
    plot(data_mat_w1_25(:,1),data_mat_w1_25(:,(i_xyz+5)))
    plot(data_mat_w1_3(:,1), data_mat_w1_3(:,(i_xyz+5)))
    xlabel('Simulation Time (sec)')
    switch i_xyz
        case 1
            ylabel('x position (m)')
        case 2
            ylabel('y position (m)')
        case 3
            ylabel('z position (m)')
    end
    legend('Setpoint','baseline','1.0kg load','1.1kg load','1.2kg load','1.25kg load','1.3kg load','location','northwest')
end
saveas(gcf,'Plots/exp1.1.1_xyz_plot.jpg')

%% Plot xyz positions (stable)
figure
sgtitle('Exp1.1.1 Position Data (Stable Scenarios)')
for i_xyz=1:3
    subplot(3,1,i_xyz)
    hold on
    grid on
    plot(sp_mat_remapped_bl(:,1), sp_mat_remapped_bl(:,i_xyz+1))
    plot(data_mat_bl(:,1), data_mat_bl(:,(i_xyz+5)))
    plot(data_mat_w1_0(:,1), data_mat_w1_0(:,(i_xyz+5)))
    plot(data_mat_w1_1(:,1), data_mat_w1_1(:,(i_xyz+5)))
    plot(data_mat_w1_2(:,1), data_mat_w1_2(:,(i_xyz+5)))
    plot(data_mat_w1_25(:,1),data_mat_w1_25(:,(i_xyz+5)))
    xlabel('Simulation Time (sec)')
    switch i_xyz
        case 1
            ylabel('x position (m)')
        case 2
            ylabel('y position (m)')
        case 3
            ylabel('z position (m)')
    end
    legend('Setpoint','baseline','1.0kg load','1.1kg load','1.2kg load','1.25kg load','location','northwest')
end
saveas(gcf,'Plots/exp1.1.1_xyz_stable_plot.jpg')

%% Plot transitional error
figure
hold on
grid on
plot(data_mat_bl(:,1),    err_bl)
plot(data_mat_w1_0(:,1),  err_w1_0)
plot(data_mat_w1_1(:,1),  err_w1_1)
plot(data_mat_w1_2(:,1),  err_w1_2)
plot(data_mat_w1_25(:,1), err_w1_25)
plot(data_mat_w1_3(:,1),  err_w1_3)
legend('baseline','1.0kg load','1.1kg load','1.2kg load','1.25kg load','1.3kg load','location','northwest')
xlabel('Simulation Time (sec)')
ylabel('Error (m)')
title ('Exp1.1.1 Absolute Translational error')
saveas(gcf,'Plots/exp1.1.1_err_plot.jpg')

%% Plot transitional error (stable)
figure
hold on
grid on
plot(data_mat_bl(:,1),    err_bl)
plot(data_mat_w1_0(:,1),  err_w1_0)
plot(data_mat_w1_1(:,1),  err_w1_1)
plot(data_mat_w1_2(:,1),  err_w1_2)
plot(data_mat_w1_25(:,1), err_w1_25)
legend('baseline','1.0kg load','1.1kg load','1.2kg load','1.25kg load','location','northwest')
xlabel('Simulation Time (sec)')
ylabel('Error (m)')
title ('Exp1.1.1 Absolute Translational error (Stable Scenarios)')
saveas(gcf,'Plots/exp1.1.1_err_stable_plot.jpg')


%% HELPER FUNCS
function [data_mat, sp_mat_remapped, err] = process_data (data_path, sp_path)
% read csv
data_mat = readmatrix(data_path);
sp_mat   = readmatrix(sp_path);

% process data
% change time unit
data_mat = process_timestamp(data_mat);
sp_mat   = process_timestamp(sp_mat);

% reverse axis direction
data_mat(:,[7,8]) = -data_mat(:,[7,8]);
sp_mat(:,[3,4])   = -sp_mat(:,[3,4]);

% convert NaN to 0
data_mat(isnan(data_mat)) =0;
sp_mat(isnan(sp_mat))     =0;

% trim data
start_t = 10;
end_t = 40;
data_mat = trim_data (start_t, end_t, data_mat);
sp_mat   = trim_data (start_t, end_t, sp_mat);

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
        if sp_ts(j,1)>ts_ref(i,1) && sp_ts(1,1)<ts_ref(i,1) && sp_ts(j-1,1)<ts_ref(i,1)
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
