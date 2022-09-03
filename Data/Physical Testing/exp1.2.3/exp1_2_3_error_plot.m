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
f_xyz.Position = [240  1  1134  860];
sgtitle('Exp1.2.3 Position Data')
for i_plot=1:7
    for i_xyz=1:3
        subplot(7,3,(i_plot-1)*3+i_xyz)
        hold on
        grid on
        plot(sp_mats{1}(:,1), sp_mats{1}(:,i_xyz+1))
        plot(data_mats{1}(:,1), data_mats{1}(:,(i_xyz+1)))

        switch i_plot
            case 1
                plot(data_mat_rw0_00_fw0_225(:,1), data_mat_rw0_00_fw0_225(:,(i_xyz+1)))
                plot(data_mat_rw0_29_fw0_66(:,1), data_mat_rw0_29_fw0_66(:,(i_xyz+1)))
            case 2
                plot(data_mat_rw0_05_fw0_10(:,1), data_mat_rw0_05_fw0_10(:,(i_xyz+1)))
                plot(data_mat_rw0_05_fw0_20(:,1), data_mat_rw0_05_fw0_20(:,(i_xyz+1)))
                plot(data_mat_rw0_05_fw0_30(:,1), data_mat_rw0_05_fw0_30(:,(i_xyz+1)))
                plot(data_mat_rw0_05_fw0_35(:,1), data_mat_rw0_05_fw0_35(:,(i_xyz+1)))
                plot(data_mat_rw0_05_fw0_40(:,1), data_mat_rw0_05_fw0_40(:,(i_xyz+1)))
            case 3
                plot(data_mat_rw0_10_fw0_30(:,1), data_mat_rw0_10_fw0_30(:,(i_xyz+1)))
                plot(data_mat_rw0_10_fw0_35(:,1), data_mat_rw0_10_fw0_35(:,(i_xyz+1)))
                plot(data_mat_rw0_10_fw0_40(:,1), data_mat_rw0_10_fw0_40(:,(i_xyz+1)))
            case 4
                plot(data_mat_rw0_15_fw0_35(:,1), data_mat_rw0_15_fw0_35(:,(i_xyz+1)))
                plot(data_mat_rw0_15_fw0_40(:,1), data_mat_rw0_15_fw0_40(:,(i_xyz+1)))
                plot(data_mat_rw0_15_fw0_45(:,1), data_mat_rw0_15_fw0_45(:,(i_xyz+1)))
                plot(data_mat_rw0_15_fw0_50(:,1), data_mat_rw0_15_fw0_50(:,(i_xyz+1)))
            case 5
                plot(data_mat_rw0_20_fw0_45(:,1), data_mat_rw0_20_fw0_45(:,(i_xyz+1)))
                plot(data_mat_rw0_20_fw0_50(:,1), data_mat_rw0_20_fw0_50(:,(i_xyz+1)))
                plot(data_mat_rw0_20_fw0_55(:,1), data_mat_rw0_20_fw0_55(:,(i_xyz+1)))
                plot(data_mat_rw0_20_fw0_60(:,1), data_mat_rw0_20_fw0_60(:,(i_xyz+1)))
            case 6
                plot(data_mat_rw0_25_fw0_50(:,1), data_mat_rw0_25_fw0_50(:,(i_xyz+1)))
                plot(data_mat_rw0_25_fw0_55(:,1), data_mat_rw0_25_fw0_55(:,(i_xyz+1)))
                plot(data_mat_rw0_25_fw0_60(:,1), data_mat_rw0_25_fw0_60(:,(i_xyz+1)))
                plot(data_mat_rw0_25_fw0_65(:,1), data_mat_rw0_25_fw0_65(:,(i_xyz+1)))
            case 7
                plot(data_mat_rw0_30_fw0_55(:,1), data_mat_rw0_30_fw0_55(:,(i_xyz+1)))
                plot(data_mat_rw0_30_fw0_60(:,1), data_mat_rw0_30_fw0_60(:,(i_xyz+1)))
                plot(data_mat_rw0_30_fw0_65(:,1), data_mat_rw0_30_fw0_65(:,(i_xyz+1)))
        end
        if (i_plot-1)*3+i_xyz == 20
        xlabel('Simulation Time (sec)')
        end
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
            lgd1 = legend( 'Setpoint','baseline',...
                'RW0.00 FW0.225',...
                'RW0.29 FW0.66', ...
                'Position',[0.3493    0.9126    0.3250    0.017], 'Orientation','horizontal');

        case 2
            lgd2 = legend( 'Setpoint','baseline',...
                'RW0.05 FW0.10', ...
                'RW0.05 FW0.20', ...
                'RW0.05 FW0.30', ...
                'RW0.05 FW0.35', ...
                'RW0.05 FW0.40', ...
                'Position',[0.2091    0.7975    0.6036    0.017], 'Orientation','horizontal');
        case 3
            lgd3 = legend( 'Setpoint','baseline',...
                'RW0.10 FW0.30', ...
                'RW0.10 FW0.35', ...
                'RW0.10 FW0.40', ...
                'Position',[0.3158    0.6766    0.4149    0.017], 'Orientation','horizontal');
        case 4
            lgd4 = legend( 'Setpoint','baseline',...
                'RW0.15 FW0.35', ...
                'RW0.15 FW0.40', ...
                'RW0.15 FW0.45', ...
                'RW0.15 FW0.50', ...
                'Position',[0.2598    0.5545    0.5093    0.017], 'Orientation','horizontal');
        case 5
            lgd5 = legend( 'Setpoint','baseline',...
                'RW0.20 FW0.45', ...
                'RW0.20 FW0.50', ...
                'RW0.20 FW0.55', ...
                'RW0.20 FW0.60', ...
                'Position',[0.2616    0.4347    0.5093    0.017], 'Orientation','horizontal');
        case 6
            lgd6 = legend( 'Setpoint','baseline',...
                'RW0.25 FW0.50', ....
                'RW0.25 FW0.55', ...
                'RW0.25 FW0.60', ...
                'RW0.25 FW0.65', ...
                'Position',[0.2572    0.3161    0.5093    0.017], 'Orientation','horizontal');
        case 7
            lgd7 = legend( 'Setpoint','baseline', 'RW0.30 FW0.55', ...
                'RW0.30 FW0.60', ...
                'RW0.30 FW0.65', ...
                'Position',[0.3043    0.1940    0.4149    0.017], 'Orientation','horizontal');
    end

end
saveas(gcf,'Plots/exp1.2.3_xyz_plot.jpg')


%% Plot transitional error
f_err = figure;
f_err.Position = [468   169   892   692];
sgtitle ('exp1.2.3 Absolute Translational error')
for i_plot=1:7
    subplot(4,2,i_plot)
    hold on
    grid on

    plot(data_mats{1}(:,1), err_arrs{1})

    switch i_plot
        case 1
            plot(data_mat_rw0_00_fw0_225(:,1), err_rw0_00_fw0_225)
            plot(data_mat_rw0_29_fw0_66(:,1), err_rw0_29_fw0_66)
            legend( 'baseline', ...
                'RW0.00 FW0.225', ...
                'RW0.29 FW0.66', ...
                'Location','best')
        case 2
            plot(data_mat_rw0_05_fw0_10(:,1), err_rw0_05_fw0_10)
            plot(data_mat_rw0_05_fw0_20(:,1), err_rw0_05_fw0_20)
            plot(data_mat_rw0_05_fw0_30(:,1), err_rw0_05_fw0_30)
            plot(data_mat_rw0_05_fw0_35(:,1), err_rw0_05_fw0_35)
            plot(data_mat_rw0_05_fw0_40(:,1), err_rw0_05_fw0_40)
            legend( 'baseline', ...
                'RW0.05 FW0.10', ...
                'RW0.05 FW0.20', ...
                'RW0.05 FW0.30', ...
                'RW0.05 FW0.35', ...
                'RW0.05 FW0.40', ...
                'Location','best')
        case 3
            plot(data_mat_rw0_10_fw0_30(:,1), err_rw0_10_fw0_30)
            plot(data_mat_rw0_10_fw0_35(:,1), err_rw0_10_fw0_35)
            plot(data_mat_rw0_10_fw0_40(:,1), err_rw0_10_fw0_40)
            legend( 'baseline', ...
                'RW0.10 FW0.30', ...
                'RW0.10 FW0.35', ...
                'RW0.10 FW0.40', ...
                'Location','best')
        case 4
            plot(data_mat_rw0_15_fw0_35(:,1), err_rw0_15_fw0_35)
            plot(data_mat_rw0_15_fw0_40(:,1), err_rw0_15_fw0_40)
            plot(data_mat_rw0_15_fw0_45(:,1), err_rw0_15_fw0_45)
            plot(data_mat_rw0_15_fw0_50(:,1), err_rw0_15_fw0_50)
            legend( 'baseline', ...
                'RW0.15 FW0.35', ...
                'RW0.15 FW0.40', ...
                'RW0.15 FW0.45', ...
                'RW0.15 FW0.50', ...
                'Location','best')
        case 5
            plot(data_mat_rw0_20_fw0_45(:,1), err_rw0_20_fw0_45)
            plot(data_mat_rw0_20_fw0_50(:,1), err_rw0_20_fw0_50)
            plot(data_mat_rw0_20_fw0_55(:,1), err_rw0_20_fw0_55)
            plot(data_mat_rw0_20_fw0_60(:,1), err_rw0_20_fw0_60)
            legend( 'baseline', ...
                'RW0.20 FW0.45', ...
                'RW0.20 FW0.50', ...
                'RW0.20 FW0.55', ...
                'RW0.20 FW0.60', ...
                'Location','best')
        case 6
            plot(data_mat_rw0_25_fw0_50(:,1), err_rw0_25_fw0_50)
            plot(data_mat_rw0_25_fw0_55(:,1), err_rw0_25_fw0_55)
            plot(data_mat_rw0_25_fw0_60(:,1), err_rw0_25_fw0_60)
            plot(data_mat_rw0_25_fw0_65(:,1), err_rw0_25_fw0_65)
            legend( 'baseline', ...
                'RW0.25 FW0.50', ...
                'RW0.25 FW0.55', ...
                'RW0.25 FW0.60', ...
                'RW0.25 FW0.65', ...
                'Location','best')

        case 7
            plot(data_mat_rw0_30_fw0_55(:,1), err_rw0_30_fw0_55)
            plot(data_mat_rw0_30_fw0_60(:,1), err_rw0_30_fw0_60)
            plot(data_mat_rw0_30_fw0_65(:,1), err_rw0_30_fw0_65)
            legend( 'baseline', ...
                'RW0.30 FW0.55', ...
                'RW0.30 FW0.60', ...
                'RW0.30 FW0.65', ...
                'Location','best')
    end


    xlabel('Simulation Time (sec)')
    ylabel('Error (m)')
    xlim([t_start, t_end])
end
saveas(gcf,'Plots/exp1.2.3_err_plot.jpg')

%% Plot Limit Graph

% Data Matrix of stable edge cases
% R1(x):FW, R2(y):RW(kg), R3(z1):torque imbalance(Nm)(kg), R4*(z2): total weight(10kg)
limit_mat = [0.225, 0;
    0.3, 0.05;
    0.35, 0.10;
    0.45, 0.15;
    0.50, 0.20;
    0.60, 0.25;
    0.66, 0.29];
limit_mat(:,3) = limit_mat(:,1)*0.38 - limit_mat(:,2)*0.86;
limit_mat(:,4) = (limit_mat(:,1)+limit_mat(:,2)+0.302)/10;

% Data Matrix of stable configurations excluding edge cases
stb_mat_exc_lim = [0.1, 0.05;
    0.20, 0.05;
    0.30, 0.10;
    0.35, 0.15;
    0.40, 0.15;
    0.45, 0.20;
    0.50, 0.25;
    0.55, 0.25;];
stb_mat_exc_lim(:,3) = stb_mat_exc_lim(:,1)*0.38 - stb_mat_exc_lim(:,2)*0.86;
stb_mat_exc_lim(:,4) = (stb_mat_exc_lim(:,1)+stb_mat_exc_lim(:,2)+0.302)/10;

% Data Matrix of unstable configurations
unstb_mat = [0.35, 0.05;
    0.40, 0.05;
    0.40, 0.10;
    0.50, 0.15;
    0.55, 0.20;
    0.60, 0.20;
    0.65, 0.25;
    0.40, 0.30;
    0.45, 0.30;
    0.50, 0.30;
    0.55, 0.30;
    0.60, 0.30;
    0.65, 0.30];
unstb_mat(:,3) = unstb_mat(:,1)*0.38 - unstb_mat(:,2)*0.86;
unstb_mat(:,4) = (unstb_mat(:,1)+unstb_mat(:,2)+0.302)/10;

figure
% torque imbalance plot -- edge case
ax1 = axes();
stem_1 = stem3(limit_mat(:,1), limit_mat(:,2), limit_mat(:,3));
stem_1.Color = '#D95319';
stem_1.LineStyle = '-';
stem_1.Marker = '*';
stem_1.LineWidth = 2.0;
% torque imbalance plot -- stable config excl edge case
ax2 = axes('Position',ax1.Position);
stem_2 = stem3(stb_mat_exc_lim(:,1), stb_mat_exc_lim(:,2), stb_mat_exc_lim(:,3));
stem_2.Color = 	'#77AC30';
stem_2.LineStyle = '-';
stem_2.Marker = '*';
stem_2.LineWidth = 1.0;
% torque imbalance plot -- unstable config
ax3 = axes('Position',ax1.Position);
stem_3 = stem3(unstb_mat(:,1), unstb_mat(:,2), unstb_mat(:,3));
stem_3.Color = '#EDB120';
stem_3.LineStyle = '-';
stem_3.Marker = '*';
stem_3.LineWidth = 1.0;

% total load plot -- edge case
ax4 = axes('Position',ax1.Position);
stem_4 = stem3(limit_mat(:,1), limit_mat(:,2), limit_mat(:,4));
stem_4.Color = '#D95319';
stem_4.LineStyle = ':';
stem_4.LineWidth = 2.0;
% total load plot -- stable config excl edge case
ax5 = axes('Position',ax1.Position);
stem_5 = stem3(stb_mat_exc_lim(:,1), stb_mat_exc_lim(:,2), stb_mat_exc_lim(:,4));
stem_5.Color = 	'#77AC30';
stem_5.LineStyle = ':';
stem_5.LineWidth = 1.0;
% total load plot -- unstable config
ax6 = axes('Position',ax1.Position);
stem_6 = stem3(unstb_mat(:,1), unstb_mat(:,2), unstb_mat(:,4));
stem_6.Color = '#EDB120';
stem_6.LineStyle = ':';
stem_6.LineWidth = 1.0;

% Figure configuration
grid on
linkprop([ax1, ax2, ax3, ax4, ax5, ax6], {'XLim' 'YLim', 'ZLim', 'Position', 'view'});
ax2.Visible = 'off';
ax3.Visible = 'off';
ax4.Visible = 'off';
ax5.Visible = 'off';
ax6.Visible = 'off';
% axis label
ax1.XLabel.String = 'Front Load (kg)';
ax1.YLabel.String = 'Rear Load (kg)';
ax1.ZLabel.String = 'Torque Imbalance (Nm)';
% axis limit
xlim([0, 0.7]);
ylim([0, 0.33]);
zlim([-0.11, 0.126]);
% view position
ax1.CameraPositionMode = "manual";
ax1.CameraPosition = [-4.520207122267566,-0.476742394320232,1.135188215043149];
% legend
stem_1.DisplayName ='Torque Diff -- Stable Edge Cases';
stem_2.DisplayName ='Torque Diff -- Stable Configs (excl. edge cases)';
stem_3.DisplayName ='Torque Diff -- Unstable Configs';
stem_4.DisplayName ='Total Load -- Stable Edge Cases';
stem_5.DisplayName ='Total Load -- Stable Configs (excl. edge cases)';
stem_6.DisplayName ='Total Load -- Unstable Configs';
legend([stem_1, stem_2, stem_3, stem_4, stem_5, stem_6], ...
    'Location','southoutside', ...
    'NumColumns', 2);
ax1.Title.String = 'Comparison of Load Configurations';
% reference plane
patch([1 -1 -1 1], [1 1 -1 -1], [0 0 0 0], [1 1 -1 -1], ...
    'FaceColor','black', ...
    'FaceAlpha', 0.1)
% 2nd z-axis
text(ax1, ...
    repmat(max(xlim(ax1)),size(ax1.ZTick)), ...
    repmat(min(ylim(ax1)),size(ax1.ZTick)), ...
    ax1.ZTick, ...
    strsplit((strtrim(sprintf('%.2f ', ax1.ZTick * 10)))),...
    'HorizontalAlignment','left', ...
    'VerticalAlignment','middle')
text(ax1, ...
    max(xlim(ax1))*1.3, ...
    min(ylim(ax1))*1.3, ...
    mean(zlim(ax1)), 'Total Payload (kg)' ,...
    'Rotation', 90, ...
    'HorizontalAlignment','center')
% save plots to local
saveas(gcf,'Plots/exp1.2.3_comparison_load_configs.jpg')

% Temporarily hide plot
% set(stem_1, 'visible', 'off')
% set(stem_2, 'visible', 'off')
% set(stem_3, 'visible', 'off')
% set(stem_4, 'visible', 'off')
% set(stem_5, 'visible', 'off')
% set(stem_6, 'visible', 'off')


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
