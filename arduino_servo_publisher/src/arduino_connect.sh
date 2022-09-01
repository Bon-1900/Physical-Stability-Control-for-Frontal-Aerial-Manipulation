#!/bin/bash

echo "this is working"
rosrun rosserial_python serial_node.py /dev/ttyACM0

exit 0