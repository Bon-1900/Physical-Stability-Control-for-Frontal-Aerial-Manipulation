clc;
clear;

%% set path
path_pos_baseline     = "./exp1.2.5_baseline/exp1.2.5_baseline_vehicle_local_position_0.csv";

path_pos_rw0_00_fw0_225 = "./exp1.2.5_rw0.00_fw0.225/exp1.2.5_rw0.00_fw0.225_vehicle_local_position_0.csv";

path_pos_rw0_05_fw0_25  = "./exp1.2.5_rw0.05_fw0.25/exp1.2.5_rw0.05_fw0.25_vehicle_local_position_0.csv";
path_pos_rw0_05_fw0_30  = "./exp1.2.5_rw0.05_fw0.30/exp1.2.5_rw0.05_fw0.30_vehicle_local_position_0.csv";

path_pos_rw0_10_fw0_30  = "./exp1.2.5_rw0.10_fw0.30/exp1.2.5_rw0.10_fw0.30_vehicle_local_position_0.csv";
path_pos_rw0_10_fw0_35  = "./exp1.2.5_rw0.10_fw0.35/exp1.2.5_rw0.10_fw0.35_vehicle_local_position_0.csv";

path_pos_rw0_15_fw0_40  = "./exp1.2.5_rw0.15_fw0.40/exp1.2.5_rw0.15_fw0.40_vehicle_local_position_0.csv";
path_pos_rw0_15_fw0_45  = "./exp1.2.5_rw0.15_fw0.45/exp1.2.5_rw0.15_fw0.45_vehicle_local_position_0.csv";

path_pos_rw0_20_fw0_45  = "./exp1.2.5_rw0.20_fw0.45/exp1.2.5_rw0.20_fw0.45_vehicle_local_position_0.csv";
path_pos_rw0_20_fw0_50  = "./exp1.2.5_rw0.20_fw0.50/exp1.2.5_rw0.20_fw0.50_vehicle_local_position_0.csv";

path_pos_rw0_25_fw0_55  = "./exp1.2.5_rw0.25_fw0.55/exp1.2.5_rw0.25_fw0.55_vehicle_local_position_0.csv";
path_pos_rw0_25_fw0_60  = "./exp1.2.5_rw0.25_fw0.60/exp1.2.5_rw0.25_fw0.60_vehicle_local_position_0.csv";

path_pos_rw0_29_fw0_66  = "./exp1.2.5_rw0.29_fw0.66/exp1.2.5_rw0.29_fw0.66_vehicle_local_position_0.csv";

% setpoints data path
path_pos_sp_baseline  = "./exp1.2.5_baseline/exp1.2.5_baseline_vehicle_local_position_setpoint_0.csv";

path_pos_sp_rw0_00_fw0_225 = "./exp1.2.5_rw0.00_fw0.225/exp1.2.5_rw0.00_fw0.225_vehicle_local_position_setpoint_0.csv";

path_pos_sp_rw0_05_fw0_25  = "./exp1.2.5_rw0.05_fw0.25/exp1.2.5_rw0.05_fw0.25_vehicle_local_position_setpoint_0.csv";
path_pos_sp_rw0_05_fw0_30  = "./exp1.2.5_rw0.05_fw0.30/exp1.2.5_rw0.05_fw0.30_vehicle_local_position_setpoint_0.csv";

path_pos_sp_rw0_10_fw0_30  = "./exp1.2.5_rw0.10_fw0.30/exp1.2.5_rw0.10_fw0.30_vehicle_local_position_setpoint_0.csv";
path_pos_sp_rw0_10_fw0_35  = "./exp1.2.5_rw0.10_fw0.35/exp1.2.5_rw0.10_fw0.35_vehicle_local_position_setpoint_0.csv";

path_pos_sp_rw0_15_fw0_40  = "./exp1.2.5_rw0.15_fw0.40/exp1.2.5_rw0.15_fw0.40_vehicle_local_position_setpoint_0.csv";
path_pos_sp_rw0_15_fw0_45  = "./exp1.2.5_rw0.15_fw0.45/exp1.2.5_rw0.15_fw0.45_vehicle_local_position_setpoint_0.csv";

path_pos_sp_rw0_20_fw0_45  = "./exp1.2.5_rw0.20_fw0.45/exp1.2.5_rw0.20_fw0.45_vehicle_local_position_setpoint_0.csv";
path_pos_sp_rw0_20_fw0_50  = "./exp1.2.5_rw0.20_fw0.50/exp1.2.5_rw0.20_fw0.50_vehicle_local_position_setpoint_0.csv";

path_pos_sp_rw0_25_fw0_55  = "./exp1.2.5_rw0.25_fw0.55/exp1.2.5_rw0.25_fw0.55_vehicle_local_position_setpoint_0.csv";
path_pos_sp_rw0_25_fw0_60  = "./exp1.2.5_rw0.25_fw0.60/exp1.2.5_rw0.25_fw0.60_vehicle_local_position_setpoint_0.csv";

path_pos_sp_rw0_29_fw0_66  = "./exp1.2.5_rw0.29_fw0.66/exp1.2.5_rw0.29_fw0.66_vehicle_local_position_setpoint_0.csv";

%% Process Data
t_start = 0;
t_end   = 80;

[data_mat_bl,    sp_mat_remapped_bl,    err_bl   ] = process_data (path_pos_baseline, path_pos_sp_baseline, t_start, t_end);

[data_mat_rw0_00_fw0_225,  sp_mat_remapped_rw0_00_fw0_225,  err_rw0_00_fw0_225 ] = process_data (path_pos_rw0_00_fw0_225, path_pos_sp_rw0_00_fw0_225, t_start, t_end);

[data_mat_rw0_05_fw0_25,  sp_mat_remapped_rw0_05_fw0_25,  err_rw0_05_fw0_25 ] = process_data (path_pos_rw0_05_fw0_25, path_pos_sp_rw0_05_fw0_25, t_start, t_end);
[data_mat_rw0_05_fw0_30,  sp_mat_remapped_rw0_05_fw0_30,  err_rw0_05_fw0_30 ] = process_data (path_pos_rw0_05_fw0_30, path_pos_sp_rw0_05_fw0_30, t_start, t_end);

[data_mat_rw0_10_fw0_30,  sp_mat_remapped_rw0_10_fw0_30,  err_rw0_10_fw0_30 ] = process_data (path_pos_rw0_10_fw0_30, path_pos_sp_rw0_10_fw0_30, t_start, t_end);
[data_mat_rw0_10_fw0_35,  sp_mat_remapped_rw0_10_fw0_35,  err_rw0_10_fw0_35 ] = process_data (path_pos_rw0_10_fw0_35, path_pos_sp_rw0_10_fw0_35, t_start, t_end);

[data_mat_rw0_15_fw0_40,  sp_mat_remapped_rw0_15_fw0_40,  err_rw0_15_fw0_40 ] = process_data (path_pos_rw0_15_fw0_40, path_pos_sp_rw0_15_fw0_40, t_start, t_end);
[data_mat_rw0_15_fw0_45,  sp_mat_remapped_rw0_15_fw0_45,  err_rw0_15_fw0_45 ] = process_data (path_pos_rw0_15_fw0_45, path_pos_sp_rw0_15_fw0_45, t_start, t_end);

[data_mat_rw0_20_fw0_45,  sp_mat_remapped_rw0_20_fw0_45,  err_rw0_20_fw0_45 ] = process_data (path_pos_rw0_20_fw0_45, path_pos_sp_rw0_20_fw0_45, t_start, t_end);
[data_mat_rw0_20_fw0_50,  sp_mat_remapped_rw0_20_fw0_50,  err_rw0_20_fw0_50 ] = process_data (path_pos_rw0_20_fw0_50, path_pos_sp_rw0_20_fw0_50, t_start, t_end);

[data_mat_rw0_25_fw0_55,  sp_mat_remapped_rw0_25_fw0_55,  err_rw0_25_fw0_55 ] = process_data (path_pos_rw0_25_fw0_55, path_pos_sp_rw0_25_fw0_55, t_start, t_end);
[data_mat_rw0_25_fw0_60,  sp_mat_remapped_rw0_25_fw0_60,  err_rw0_25_fw0_60 ] = process_data (path_pos_rw0_25_fw0_60, path_pos_sp_rw0_25_fw0_60, t_start, t_end);

[data_mat_rw0_29_fw0_66,  sp_mat_remapped_rw0_29_fw0_66,  err_rw0_29_fw0_66 ] = process_data (path_pos_rw0_29_fw0_66, path_pos_sp_rw0_29_fw0_66, t_start, t_end);


%% Plot xyz positions
f_xyz = figure;
f_xyz.Position = [240  12  1134  849];
sgtitle('Exp1.2.5 Position Data')

for i_plot=1:6
    for i_xyz=1:3
        subplot(6,3,(i_plot-1)*3+i_xyz)
        hold on
        grid on
        plot(sp_mat_remapped_bl(:,1), sp_mat_remapped_bl(:,i_xyz+1))
        plot(data_mat_bl(:,1), data_mat_bl(:,(i_xyz+5)))

        switch i_plot
            case 1
                plot(data_mat_rw0_00_fw0_225(:,1), data_mat_rw0_00_fw0_225(:,(i_xyz+5)));
                plot(data_mat_rw0_29_fw0_66(:,1), data_mat_rw0_29_fw0_66(:,(i_xyz+5)))
            case 2
                plot(data_mat_rw0_05_fw0_25(:,1), data_mat_rw0_05_fw0_25(:,(i_xyz+5)))
                plot(data_mat_rw0_05_fw0_30(:,1), data_mat_rw0_05_fw0_30(:,(i_xyz+5)))
            case 3
                plot(data_mat_rw0_10_fw0_30(:,1), data_mat_rw0_10_fw0_30(:,(i_xyz+5)))
                plot(data_mat_rw0_10_fw0_35(:,1), data_mat_rw0_10_fw0_35(:,(i_xyz+5)))
            case 4
                plot(data_mat_rw0_15_fw0_40(:,1), data_mat_rw0_15_fw0_40(:,(i_xyz+5)))
                plot(data_mat_rw0_15_fw0_45(:,1), data_mat_rw0_15_fw0_45(:,(i_xyz+5)))
            case 5
                plot(data_mat_rw0_20_fw0_45(:,1), data_mat_rw0_20_fw0_45(:,(i_xyz+5)))
                plot(data_mat_rw0_20_fw0_50(:,1), data_mat_rw0_20_fw0_50(:,(i_xyz+5)))
            case 6
                plot(data_mat_rw0_25_fw0_55(:,1), data_mat_rw0_25_fw0_55(:,(i_xyz+5)))
                plot(data_mat_rw0_25_fw0_60(:,1), data_mat_rw0_25_fw0_60(:,(i_xyz+5)))
        end

        xlabel('Simulation Time (sec)')
        switch i_xyz
            case 1
                ylabel('x position (m)')
            case 2
                ylabel('y position (m)')
            case 3
                ylabel('z position (m)')
        end
        xlim([t_start, t_end])
    end
    switch i_plot
        case 1
            lgd1 = legend('Setpoint','baseline', 'RW0.00 FW0.225','RW0.29 FW0.66', ...
                'Position',[0.3493    0.9125    0.3250    0.0177], 'Orientation','horizontal');
        case 2
            lgd2 = legend('Setpoint','baseline', 'RW0.05 FW0.25', 'RW0.05 FW0.30',  ...
                'Position',[0.3493    0.7724     0.3250    0.0177], 'Orientation','horizontal');
        case 3
            lgd3 = legend('Setpoint','baseline', 'RW0.10 FW0.30', 'RW0.10 FW0.35',  ...
                'Position',[0.3493    0.6310    0.3250    0.0177], 'Orientation','horizontal');
        case 4
            lgd4 = legend('Setpoint','baseline', 'RW0.15 FW0.40', 'RW0.15 FW0.45',  ...
                'Position',[0.3493    0.4885    0.3250    0.0177], 'Orientation','horizontal');
        case 5
            lgd5 = legend('Setpoint','baseline', 'RW0.20 FW0.45', 'RW0.20 FW0.50',  ...
                'Position',[0.3493    0.3495    0.3250    0.0177], 'Orientation','horizontal');
        case 6
            lgd6 = legend('Setpoint','baseline', 'RW0.25 FW0.55', 'RW0.25 FW0.60',  ...
                'Position',[0.3493    0.2070    0.3250    0.0177], 'Orientation','horizontal');
    end

end

saveas(gcf,'Plots/exp1.2.5_xyz_plot.jpg')


%% Plot transitional error
f_err = figure;
f_err.Position = [468   169   892   692];
sgtitle ('Exp1.2.5 Absolute Translational error')
for i_plot=1:6
    subplot(3,2,i_plot)
    hold on
    grid on

    plot(data_mat_bl(:,1), err_bl)

    switch i_plot
        case 1
            plot(data_mat_rw0_00_fw0_225(:,1), err_rw0_00_fw0_225)
            plot(data_mat_rw0_29_fw0_66(:,1), err_rw0_29_fw0_66)
            legend('baseline', 'RW0.00 FW0.225', 'RW0.29 FW0.66', 'Location','best')
        case 2
            plot(data_mat_rw0_05_fw0_25(:,1), err_rw0_05_fw0_25)
            plot(data_mat_rw0_05_fw0_30(:,1), err_rw0_05_fw0_30)
            legend( 'baseline', 'RW0.05 FW0.25', 'RW0.05 FW0.30', 'Location','best')
        case 3
            plot(data_mat_rw0_10_fw0_30(:,1), err_rw0_10_fw0_30)
            plot(data_mat_rw0_10_fw0_35(:,1), err_rw0_10_fw0_35)
            legend( 'baseline', 'RW0.10 FW0.30', 'RW0.10 FW0.35', 'Location','best')
        case 4
            plot(data_mat_rw0_15_fw0_40(:,1), err_rw0_15_fw0_40)
            plot(data_mat_rw0_15_fw0_45(:,1), err_rw0_15_fw0_45)
            legend( 'baseline', 'RW0.15 FW0.40', 'RW0.15 FW0.45', 'Location','best')
        case 5
            plot(data_mat_rw0_20_fw0_45(:,1), err_rw0_20_fw0_45)
            plot(data_mat_rw0_20_fw0_50(:,1), err_rw0_20_fw0_50)
            legend( 'baseline', 'RW0.20 FW0.45', 'RW0.20 FW0.50', 'Location','best')
        case 6
            plot(data_mat_rw0_25_fw0_55(:,1), err_rw0_25_fw0_55)
            plot(data_mat_rw0_25_fw0_60(:,1), err_rw0_25_fw0_60)
            legend( 'baseline','RW0.25 FW0.55', 'RW0.25 FW0.60', 'Location','best')
    end
    xlabel('Simulation Time (sec)')
    ylabel('Error (m)')
    xlim([t_start, t_end])
end

saveas(gcf,'Plots/exp1.2.5_err_plot.jpg')




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

start_t = 18.756000;
for i = 1:size(ts_ref,1)
    i_waypoint = ceil( (sp_remapped(i,1) - start_t) / 8 );
    switch i_waypoint
        case 1
            sp_remapped(i,[2,3,4]) = [0 0 2];
        case 2
            sp_remapped(i,[2,3,4]) = [2 0 2];
        case 3
            sp_remapped(i,[2,3,4]) = [2 2 2];
        case 4
            sp_remapped(i,[2,3,4]) = [0 2 2];
        case 5
            sp_remapped(i,[2,3,4]) = [0 0 2];
        case 6
            sp_remapped(i,[2,3,4]) = [2 2 2];
        case 7
            sp_remapped(i,[2,3,4]) = [0 0 2];
    end
end
% for i = 1:size(ts_ref,1)
%     for j = 2:size(sp_ts,1)
%         if sp_ts(j,1)>=ts_ref(i,1) && sp_ts(1,1)<=ts_ref(i,1) && sp_ts(j-1,1)<=ts_ref(i,1)
%             % while reference timestamp is larger than original timestamp
%             sp_remapped (i,[2,3,4]) = setpoints(j,:);
%         end
%     end
% end
% sp_remapped(size(sp_remapped,1),[2,3,4]) = sp_remapped(size(sp_remapped,1)-1,[2,3,4]);
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
