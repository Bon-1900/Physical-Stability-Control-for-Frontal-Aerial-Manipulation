import rospy
from geometry_msgs.msg import PoseStamped

rospy.init_node('neptune_offb_py_node')

waypoint = PoseStamped()

rate = rospy.Rate(10)

pub = rospy.Publisher('/neptune/mavros/setpoint_position/local', PoseStamped, queue_size=10)



for i in range (100):


    waypoint.pose.position.x = 1
    waypoint.pose.position.y = 0.5
    waypoint.pose.position.z = 1.0

    pub.publish(waypoint)

    rate.sleep()