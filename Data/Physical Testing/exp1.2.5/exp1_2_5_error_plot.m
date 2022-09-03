clc;
clear;

%% Process Data
t_start = 0;
t_end   = 80;
bag_paths = dir('*.bag');
for i_bag_paths = 1:length(bag_paths)
    [data_mat, sp_mat, err] = process_data (bag_paths(i_bag_paths).name, t_start, t_end);
    data_mats {i_bag_paths} = data_mat;
    sp_mats {i_bag_paths}   = sp_mat;
    err_arrs {i_bag_paths}   = err;
end


%% Plot xyz positions
f_xyz = figure;
f_xyz.Position = [240  12  1134  849];
sgtitle('Exp1.2.5 Position Data')

for i_plot=1:6
    for i_xyz=1:3
        subplot(6,3,(i_plot-1)*3+i_xyz)
        hold on
        grid on
        plot(sp_mats{1}(:,1), sp_mats{1}(:,i_xyz+1))
        plot(data_mats{1}(:,1), data_mats{1}(:,(i_xyz+1)))

        switch i_plot
            case 1
                plot(data_mat_rw0_00_fw0_225(:,1), data_mat_rw0_00_fw0_225(:,(i_xyz+1)));
                plot(data_mat_rw0_29_fw0_66(:,1), data_mat_rw0_29_fw0_66(:,(i_xyz+1)))
            case 2
                plot(data_mat_rw0_05_fw0_25(:,1), data_mat_rw0_05_fw0_25(:,(i_xyz+1)))
                plot(data_mat_rw0_05_fw0_30(:,1), data_mat_rw0_05_fw0_30(:,(i_xyz+1)))
            case 3
                plot(data_mat_rw0_10_fw0_30(:,1), data_mat_rw0_10_fw0_30(:,(i_xyz+1)))
                plot(data_mat_rw0_10_fw0_35(:,1), data_mat_rw0_10_fw0_35(:,(i_xyz+1)))
            case 4
                plot(data_mat_rw0_15_fw0_40(:,1), data_mat_rw0_15_fw0_40(:,(i_xyz+1)))
                plot(data_mat_rw0_15_fw0_45(:,1), data_mat_rw0_15_fw0_45(:,(i_xyz+1)))
            case 5
                plot(data_mat_rw0_20_fw0_45(:,1), data_mat_rw0_20_fw0_45(:,(i_xyz+1)))
                plot(data_mat_rw0_20_fw0_50(:,1), data_mat_rw0_20_fw0_50(:,(i_xyz+1)))
            case 6
                plot(data_mat_rw0_25_fw0_55(:,1), data_mat_rw0_25_fw0_55(:,(i_xyz+1)))
                plot(data_mat_rw0_25_fw0_60(:,1), data_mat_rw0_25_fw0_60(:,(i_xyz+1)))
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

    plot(data_mats{1}(:,1), err_arrs{1})

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
function [data_mat, sp_mat_remapped, err] = process_data (bag_path, start_t, end_t)
% extract from ros bag
bag = rosbag(bag_path);
estimated_odom_topic = select(bag,'Topic','/neptune/neptune/vrpn_client/estimated_odometry');
traj_reference_topic = select(bag,'Topic','/neptune/mavros/setpoint_position/local');

traj_messages = readMessages(traj_reference_topic,'DataFormat','struct');
odom_messages = readMessages(estimated_odom_topic,'DataFormat','struct');

for i = 1:length(traj_messages)
    traj{i,1} = (double(traj_messages{i,1}.Header.Seq) - double(traj_messages{1,1}.Header.Seq)) * 0.1;
    traj{i,2} = traj_messages{i,1}.Pose.Position.X;
    traj{i,3} = traj_messages{i,1}.Pose.Position.Y;
    traj{i,4} = traj_messages{i,1}.Pose.Position.Z;

end

sp_mat = cellfun(@(tr) double(tr), traj);

for i = 1:length(odom_messages)
    odom{i,1} = 1000 * (odom_messages{i,1}.Header.Stamp.Sec - traj_reference_topic.StartTime);
    odom{i,2} = odom_messages{i,1}.Pose.Pose.Position.X;
    odom{i,3} = odom_messages{i,1}.Pose.Pose.Position.Y;
    odom{i,4} = odom_messages{i,1}.Pose.Pose.Position.Z;
end

data_mat = cellfun(@(od) double(od), odom);

% convert NaN to 0
data_mat(isnan(data_mat)) =0;
sp_mat(isnan(sp_mat))     =0;

% trim data
data_mat = trim_data (start_t, end_t, data_mat);
sp_mat   = trim_data (start_t, end_t, sp_mat);

% remap setpoint data timestamp to match data timestamps
sp_mat_remapped = remap_sp (sp_mat(:,[2,3,4]), sp_mat(:,1), data_mat(:,1));
err             = get_err (sp_mat_remapped(:,[2,3,4]), data_mat(:,[2,3,4]));
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
