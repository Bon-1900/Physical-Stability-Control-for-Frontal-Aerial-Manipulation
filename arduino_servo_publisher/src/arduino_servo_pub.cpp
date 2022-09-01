#include "ros/ros.h"
#include "std_msgs/Float64.h"

int main(int argc, char **argv)
{
  ros::init(argc, argv, "arduino_servo_publisher");

  ros::NodeHandle nh;
  ros::Publisher servo_spd_signal_pub = nh.advertise<std_msgs::Float64>("servo_spd_signal_pub", 1000);
  ros::Publisher servo_run_time_pub = nh.advertise<std_msgs::Float64>("servo_run_time_pub", 1000);
  ros::Rate loop_rate(10);

  std_msgs::Float64 spd_signal;
  // spd_signal.data = 6000;
  std_msgs::Float64 run_time;
  // run_time.data = 5.0;

  nh.getParam("arduino_servo_publisher/servo_spd_sig", spd_signal.data);
  nh.getParam("arduino_servo_publisher/servo_run_t", run_time.data);

  while (ros::ok())
  {

    ROS_INFO("Input signal: %f", spd_signal.data);
    ROS_INFO("Input running duration: %f", run_time.data);

    servo_spd_signal_pub.publish(spd_signal);
    servo_run_time_pub.publish(run_time);

    ros::spinOnce();
    loop_rate.sleep();
  }
  return 0;
}
