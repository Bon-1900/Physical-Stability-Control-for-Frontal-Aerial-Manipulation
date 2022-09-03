
/*
  Servo Test:

  Signal:
    Stop: 1500
    ACW: >1500
    CW: <1500

*/

#include <Servo.h>

// servo
Servo servo1;

void setup()
{
  Serial.begin(9600);
  servo1.attach(7);
}

void loop()
{
  servo1.writeMicroseconds(1500);
}
