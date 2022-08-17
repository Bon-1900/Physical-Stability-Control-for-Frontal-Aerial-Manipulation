/**
 * @file offb_node.cpp
 * @brief Offboard control example node, written with MAVROS version 0.19.x, PX4 Pro Flight
 * Stack and tested in Gazebo SITL
 */

#include <ros/ros.h>
#include <geometry_msgs/PoseStamped.h>
#include <mavros_msgs/CommandBool.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>

mavros_msgs::State current_state;
void state_cb(const mavros_msgs::State::ConstPtr &msg)
{
    current_state = *msg;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "waypoint_node");
    ros::NodeHandle nh;

    ros::Subscriber state_sub = nh.subscribe<mavros_msgs::State>("mavros/state", 10, state_cb);
    ros::Publisher local_pos_pub = nh.advertise<geometry_msgs::PoseStamped>("mavros/setpoint_position/local", 10);
    ros::ServiceClient arming_client = nh.serviceClient<mavros_msgs::CommandBool>("mavros/cmd/arming");
    ros::ServiceClient set_mode_client = nh.serviceClient<mavros_msgs::SetMode>("mavros/set_mode");

    // the setpoint publishing rate MUST be faster than 2Hz
    ros::Rate rate(30.0);

    // wait for FCU connection
    while (ros::ok() && !current_state.connected)
    {
        ros::spinOnce();
        rate.sleep();
    }

    // set waypoints
    geometry_msgs::PoseStamped pose1;
    pose1.pose.position.x = 0;
    pose1.pose.position.y = 0;
    pose1.pose.position.z = 2;

    geometry_msgs::PoseStamped pose2;
    pose2.pose.position.x = 2;
    pose2.pose.position.y = 0;
    pose2.pose.position.z = 2;

    geometry_msgs::PoseStamped pose3;
    pose3.pose.position.x = 2;
    pose3.pose.position.y = 2;
    pose3.pose.position.z = 2;

    geometry_msgs::PoseStamped pose4;
    pose4.pose.position.x = 0;
    pose4.pose.position.y = 2;
    pose4.pose.position.z = 2;

    int i_waypoint = -1;
    // int waypoint_num = 7;
    // geometry_msgs::PoseStamped waypoints_list[waypoint_num] =
    //     {pose1, pose2, pose3, pose4, pose1, pose3, pose1};
    // for hovering task
    int waypoint_num = 1;
    geometry_msgs::PoseStamped waypoints_list[waypoint_num] = {pose1};

    // send a few setpoints before starting
    for (int i = 100; ros::ok() && i > 0; --i)
    {
        local_pos_pub.publish(pose1);
        ros::spinOnce();
        rate.sleep();
    }

    mavros_msgs::SetMode offb_set_mode;
    offb_set_mode.request.custom_mode = "OFFBOARD";

    mavros_msgs::CommandBool arm_cmd;
    arm_cmd.request.value = true;

    // set time parameters
    ros::Time last_request = ros::Time::now();
    ros::Time mission_start_time;
    ros::Duration t_span;
    int t_interval = 8;
    int t_offset = 12;

    bool is_initialised = false;
    bool is_landing = false;

    while (ros::ok())
    {
        // initiate mission
        if (current_state.mode != "OFFBOARD" &&
            (ros::Time::now() - last_request > ros::Duration(5.0)) &&
             !is_landing)
        {
            if (set_mode_client.call(offb_set_mode) &&
                offb_set_mode.response.mode_sent)
            {
                ROS_INFO("Offboard enabled");
            }
            last_request = ros::Time::now();
        }
        else
        {
            if (!current_state.armed &&
                (ros::Time::now() - last_request > ros::Duration(5.0)) &&
                !is_landing)
            {
                if (arming_client.call(arm_cmd) &&
                    arm_cmd.response.success)
                {
                    ROS_INFO("Vehicle armed");
                    mission_start_time = ros::Time::now();
                    // ROS_INFO("Mission starting time: %d", mission_start_time);
                    is_initialised = true;
                }
                last_request = ros::Time::now();
            }
        }

        t_span = ros::Time::now() - mission_start_time;
        // ROS_INFO("t_span: %d", t_span);

        // update waypoint at designated time
        if (t_span > ros::Duration(i_waypoint * t_interval + t_offset) && i_waypoint < waypoint_num - 1 && is_initialised)
        {
            i_waypoint++;
            ROS_INFO("Directing to waypoint %d: (%.1f, %.1f, %.1f)", i_waypoint+1,
                     waypoints_list[i_waypoint].pose.position.x,
                     waypoints_list[i_waypoint].pose.position.y,
                     waypoints_list[i_waypoint].pose.position.z);
        }

        // auto landing
        else if (t_span > ros::Duration(i_waypoint * t_interval + t_offset) && i_waypoint == waypoint_num - 1)
        {
            if (!is_landing)
            {
                ROS_INFO("Landing...");
                is_landing = true;
            }
            offb_set_mode.request.custom_mode = "AUTO.LAND";
        }

        // move to designated waypoint
        else
        {
            local_pos_pub.publish(waypoints_list[i_waypoint]);
        }

        ros::spinOnce();
        rate.sleep();
    }

    return 0;
}
