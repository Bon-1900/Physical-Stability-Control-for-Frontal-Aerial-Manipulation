close all;
clear;
clc;

bags_load = dir('*.bag');
for b=1:length(bags_load)
   bag = rosbag(bags_load(b).name);
   estimated_odom_topic = select(bag,'Topic','/neptune/neptune/vrpn_client/estimated_odometry');
   traj_reference_topic = select(bag,'Topic','/neptune/mavros/setpoint_position/local');
   
   traj_messages = readMessages(traj_reference_topic,'DataFormat','struct');
   odom_messages = readMessages(estimated_odom_topic,'DataFormat','struct');
   
   for i = 1:length(traj_messages)
       traj{i,1} = traj_messages{i,1}.Pose(i).Position.X;
       traj{i,2} = traj_messages{i,1}.Pose(i).Position.Y;
       traj{i,3} = traj_messages{i,1}.Pose(i).Position.Z;
       traj{i,4} = traj_messages{i,1}.Trajectory(i).TimeMilliseconds;
   end
   
   traj_mat = cellfun(@(tr) double(tr), traj);
   
   for i = 1:length(odom_messages)
       odom{i,1} = odom_messages{i,1}.Pose.Pose.Position.X;
       odom{i,2} = odom_messages{i,1}.Pose.Pose.Position.Y;
       odom{i,3} = odom_messages{i,1}.Pose.Pose.Position.Z;
       odom{i,4} = 1000 * (estimated_odom_topic.MessageList{i,1} - traj_reference_topic.StartTime);
   end 
   
   odom_mat = cellfun(@(od) double(od), odom);
   
   k_start = 1;
   while traj{k_start,1} ~= 0.15 
        k_start = k_start + 1;
   end
   k_start = k_start + 2;
   
   k_end = length(traj_messages{1, 1}.Trajectory);
   while traj{k_end,1} ~= 0.15
       k_end = k_end - 1;
   end
   
   for i = k_start:k_end %checking for every point sent in trajectory
        j = 1;
        while odom{j,4} < traj{i,4} 
            j = j + 1;
        end
        error{i - k_start + 1,1} = ((odom{j,1}+odom{j-1,1})/2) - traj{i,1};
        error{i - k_start + 1,2} = ((odom{j,2}+odom{j-1,2})/2) - traj{i,2};
        error{i - k_start + 1,3} = ((odom{j,3}+odom{j-1,3})/2) - traj{i,3};
    
    %error_1{i,1} = odom{j,1} - traj{i,1};
    %error_1{i,2} = odom{j,2} - traj{i,2};
    %error_1{i,3} = odom{j,3} - traj{i,3};
    
   end

%     error_mat = cellfun(@(em) double(em), error);
%     sq = error_mat.^2;
%     sum_sq = sum(sq);
%     mean_sum_sq = sum_sq/121;
%     rms_error = sqrt(mean_sum_sq);
% 
%     %Overall error
%     total_sq = mean_sum_sq(1) + mean_sum_sq(2) + mean_sum_sq(3);
%     total_err = sqrt(total_sq);
%     
%     error_bag(b).name = bags_load(b).name;
%     error_bag(b).total_error = total_err;
%     error_bag(b).x_rms = rms_error(1);
%     error_bag(b).y_rms = rms_error(2);
%     error_bag(b).z_rms = rms_error(3);

   for i = k_start:k_end 
       
       traj_clean(i-k_start+1,1) = traj_mat(i,1);
       traj_clean(i-k_start+1,2) = traj_mat(i,2);
       traj_clean(i-k_start+1,3) = traj_mat(i,3);
       traj_clean(i-k_start+1,4) = traj_mat(i,4);
       
   end
       
   j_start = 1;
   while odom{j_start,4} < traj{k_start,4} 
        j_start = j_start + 1;
   end
    
   j_end = 1;
   while odom{j_end,4} < traj{k_end,4} 
        j_end = j_end + 1;
   end
    
   for j = j_start:j_end
    odom_clean(j - j_start + 1,1) = odom_mat(j,1);
    odom_clean(j - j_start + 1,2) = odom_mat(j,2);
    odom_clean(j - j_start + 1,3) = odom_mat(j,3);
   end
   
   plot3(traj_clean(:,1),traj_clean(:,2),traj_clean(:,3))
   hold on
   plot3(odom_clean(:,1),odom_clean(:,2),odom_clean(:,3))
   hold on
% 
%      plot3(traj_mat(:,1),traj_mat(:,2),traj_mat(:,3))
%     hold on
%     plot3(odom_mat(:,1),odom_mat(:,2),odom_mat(:,3))
%     hold on


end

% sp = [1 6 14 17 18];   
% for i=1:length(sp)
%     b = sp(i);
%    bag = rosbag(bags_load(b).name);
%    estimated_odom_topic = select(bag,'Topic','/AABM_01/ucl_0/vrpn_client/estimated_odometry');
%    traj_reference_topic = select(bag,'Topic','/AABM_01/autopilot/TrajectoryReference');
%    
%    traj_messages = readMessages(traj_reference_topic,'DataFormat','struct');
%    odom_messages = readMessages(estimated_odom_topic,'DataFormat','struct');
%    
%    for i = 1:length(traj_messages{1, 1}.Trajectory)
%        traj{i,1} = traj_messages{1,1}.Trajectory(i).Position.X;
%        traj{i,2} = traj_messages{1,1}.Trajectory(i).Position.Y;
%        traj{i,3} = traj_messages{1,1}.Trajectory(i).Position.Z;
%        traj{i,4} = traj_messages{1,1}.Trajectory(i).TimeMilliseconds;
%    end
%    
%    traj_mat = cellfun(@(tr) double(tr), traj);
%    
%    for i = 1:length(odom_messages)
%        odom{i,1} = odom_messages{i,1}.Pose.Pose.Position.X;
%        odom{i,2} = odom_messages{i,1}.Pose.Pose.Position.Y;
%        odom{i,3} = odom_messages{i,1}.Pose.Pose.Position.Z;
%        odom{i,4} = 1000 * (estimated_odom_topic.MessageList{i,1} - traj_reference_topic.StartTime);
%    end 
%    
%    odom_mat = cellfun(@(od) double(od), odom);
%    
%    k_start = 1;
%    while traj{k_start,1} ~= 0 
%         k_start = k_start + 1;
%    end
%    k_start = k_start + 2;
%    
%    k_end = length(traj_messages{1, 1}.Trajectory);
%    while traj{k_end,1} ~= 0
%        k_end = k_end - 1;
%    end
%    
%    for i = k_start:k_end %checking for every point sent in trajectory
%         j = 1;
%         while odom{j,4} < traj{i,4} 
%             j = j + 1;
%         end
%         error{i - k_start + 1,1} = ((odom{j,1}+odom{j-1,1})/2) - traj{i,1};
%         error{i - k_start + 1,2} = ((odom{j,2}+odom{j-1,2})/2) - traj{i,2};
%         error{i - k_start + 1,3} = ((odom{j,3}+odom{j-1,3})/2) - traj{i,3};
%     
%     %error_1{i,1} = odom{j,1} - traj{i,1};
%     %error_1{i,2} = odom{j,2} - traj{i,2};
%     %error_1{i,3} = odom{j,3} - traj{i,3};
%     
%    end
% 
%     error_mat = cellfun(@(em) double(em), error);
%     sq = error_mat.^2;
%     sum_sq = sum(sq);
%     mean_sum_sq = sum_sq/121;
%     rms_error = sqrt(mean_sum_sq);
% 
%     %Overall error
%     total_sq = mean_sum_sq(1) + mean_sum_sq(2) + mean_sum_sq(3);
%     total_err = sqrt(total_sq);
%     
%     error_bag(b).name = bags_load(b).name;
%     error_bag(b).total_error = total_err;
%     error_bag(b).x_rms = rms_error(1);
%     error_bag(b).y_rms = rms_error(2);
%     error_bag(b).z_rms = rms_error(3);
% 
%    for i = k_start:k_end 
%        
%        traj_clean(i-k_start+1,1) = traj_mat(i,1);
%        traj_clean(i-k_start+1,2) = traj_mat(i,2);
%        traj_clean(i-k_start+1,3) = traj_mat(i,3) + 0.2;
%        traj_clean(i-k_start+1,4) = traj_mat(i,4);
%        
%    end
%        
%    j_start = 1;
%    while odom{j_start,4} < traj{k_start,4} 
%         j_start = j_start + 1;
%    end
%     
%    j_end = 1;
%    while odom{j_end,4} < traj{k_end,4} 
%         j_end = j_end + 1;
%    end
%     
%    for j = j_start:j_end
%     odom_clean(j - j_start + 1,1) = odom_mat(j,1);
%     odom_clean(j - j_start + 1,2) = odom_mat(j,2);
%     odom_clean(j - j_start + 1,3) = odom_mat(j,3) + 0.2;
%    end
%    
%    plot3(traj_clean(:,1),traj_clean(:,2),traj_clean(:,3))
%    hold on
%    plot3 (odom_clean(:,1),odom_clean(:,2),odom_clean(:,3))
%    hold on
% 
% 
% end


% plot (traj_mat(:,4),traj_mat(:,1))
% hold on
% plot (traj_mat(:,4),traj_mat(:,2))
% plot (traj_mat(:,4),traj_mat(:,3))
% plot (odom_mat(:,4),odom_mat(:,1))
% hold on
% plot (odom_mat(:,4),odom_mat(:,2))
% plot (odom_mat(:,4),odom_mat(:,3))
% hold off
% 
% legend('Trajectory sent X','Trajectory sent Y', 'Trajectory sent Z', 'Actual Position X', 'Actual Position Y', 'Actual Position Z');
% ylabel('The position in meters');
% xlabel('The time(0 is where the trajectory is issued/begins)');

%plot3(traj_mat(:,1),traj_mat(:,2),traj_mat(:,3))


