/**
 * @file neptune_offb_node.cpp
 * @brief Takeoff control node for Neptune & UCL AML Arena
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
    ros::init(argc, argv, "neptune_offb_node");
    ros::NodeHandle nh;

    ros::Subscriber state_sub = nh.subscribe<mavros_msgs::State>("neptune/mavros/state", 10, state_cb);
    ros::Publisher local_pos_pub = nh.advertise<geometry_msgs::PoseStamped>("neptune/mavros/setpoint_position/local", 10);
    ros::ServiceClient arming_client = nh.serviceClient<mavros_msgs::CommandBool>("neptune/mavros/cmd/arming");
    ros::ServiceClient set_mode_client = nh.serviceClient<mavros_msgs::SetMode>("neptune/mavros/set_mode");

    // the setpoint publishing rate MUST be faster than 2Hz
    ros::Rate rate(10.0);

    geometry_msgs::PoseStamped pose0;
    pose0.pose.position.x = 0;
    pose0.pose.position.y = 0;
    pose0.pose.position.z = 0;

    geometry_msgs::PoseStamped pose1;
    pose1.pose.position.x = 0;
    pose1.pose.position.y = 0;
    pose1.pose.position.z = 1;

    int i_waypoint = -1;
    const int waypoint_num = 2;
    geometry_msgs::PoseStamped waypoints_list[] = {pose0, pose1};

    mavros_msgs::SetMode offb_set_mode;

    // set time parameters
    ros::Time mission_start_time;
    ros::Duration t_span;
    int t_interval = 8;
    int t_offset = 5;

    bool is_initialised = false;
    bool is_landing = false;

    while (ros::ok())
    {
        if (!is_initialised){
            mission_start_time = ros::Time::now();        
            is_initialised = true;
        }

        t_span = ros::Time::now() - mission_start_time;
        // ROS_INFO("t_span: %d", t_span);

        // update waypoint at designated time
        if (t_span > ros::Duration(i_waypoint * t_interval + t_offset) && i_waypoint < waypoint_num - 1)
        {
            i_waypoint++;
            ROS_INFO("Directing to waypoint %d: (%.1f, %.1f, %.1f)", i_waypoint + 1,
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
