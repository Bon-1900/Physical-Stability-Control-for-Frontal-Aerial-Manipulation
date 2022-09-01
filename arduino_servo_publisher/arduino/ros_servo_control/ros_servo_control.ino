/*
 * rosserial Servo Control Example
 *
 * This sketch demonstrates the control of hobby R/C servos
 * using ROS and the arduiono
 * 
 * For the full tutorial write up, visit
 * www.ros.org/wiki/rosserial_arduino_demos
 *
 * For more information on the Arduino Servo Library
 * Checkout :
 * http://www.arduino.cc/en/Reference/Servo
 */

#if (ARDUINO >= 100)
 #include <Arduino.h>
#else
 #include <WProgram.h>
#endif

#include <Servo.h> 
#include <ros.h>
#include <std_msgs/Float64.h>

ros::NodeHandle  nh;

Servo servo1;

/*
  Servo Signal:
    Stop: 1500
    ACW: >1500
    CW: <1500
*/

void servo_cb( const std_msgs::Float64& spd_signal_msg){
  servo1.writeMicroseconds(spd_signal_msg.data);; //set servo angle, should be from 0-180  
  digitalWrite(13, HIGH-digitalRead(13));  //toggle led  
  Serial.println(spd_signal_msg.data);
}


ros::Subscriber<std_msgs::Float64> sub("servo_spd_signal_pub", servo_cb);

void setup(){
  pinMode(13, OUTPUT);

  nh.initNode();
  nh.subscribe(sub);
  
  Serial.begin(9600);
  servo.attach(9); //attach it to pin 9
}

void loop(){
  nh.spinOnce();
  delay(1);
}
