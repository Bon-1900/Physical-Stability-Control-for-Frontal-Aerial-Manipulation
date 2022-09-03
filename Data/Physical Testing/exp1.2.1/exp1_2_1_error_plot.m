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
figure
sgtitle('Exp1.2.1 Position Data')
for i_xyz=1:3
    subplot(3,1,i_xyz)
    hold on
    grid on
    plot(sp_mats{1}(:,1), sp_mats{1}(:,i_xyz+1))
    for i_data = 1:length(data_mats)
        plot(data_mats{i_data}(:,1), data_mats{i_data}(:,(i_xyz+1)))
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
    legend('Setpoint','baseline','1.0kg load','1.1kg load','1.2kg load','1.25kg load','1.3kg load','location','northwest')
end
saveas(gcf,'Plots/exp1.2.1_xyz_plot.jpg')

%% Plot transitional error
figure
hold on
grid on
for i_data = 1:length(data_mats)
    plot(data_mats{i_data}(:,1), err_arrs{i_data})
end

legend('baseline','1.0kg load','1.1kg load','1.2kg load','1.25kg load','1.3kg load','location','northwest')
xlabel('Simulation Time (sec)')
ylabel('Error (m)')
title ('Exp1.2.1 Absolute Translational error')
saveas(gcf,'Plots/exp1.2.1_err_plot.jpg')




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
