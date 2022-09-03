
/*
  Experiment 1

*/

#include <IRremote.h> 
#include <Servo.h>
#include <math.h>

// servo
Servo servoFront;
Servo servoBack;

// IR remote
int RECV_PIN = 7; // the pin where you connect the output pin of IR sensor
IRrecv irrecv(RECV_PIN);
decode_results results;

// moving speed of front block
int outwardSpd = 1600;
int inwardSpd = 1300;
int zeroSpd = 1500;

void setup()
{
  Serial.begin(9600);

  servoFront.attach(9);
  servoBack.attach(10);

  irrecv.enableIRIn();
}

void loop()
{

  if (irrecv.decode(&results)) // Returns 0 if no data ready, 1 if data ready.
  {
    int readResults = results.value; // Results of decoding are stored

    Serial.print("Code: ");
    Serial.println(readResults); // prints the value a a button press

    // RC commands
    if (readResults == 0)
    {
      // both stop moving
      servoFront.writeMicroseconds(zeroSpd);
      servoBack.writeMicroseconds(zeroSpd);
    }

    else if (readResults == 1)
    {
      // front move outwards

    }

    else if (readResults == 2)
    {
      // front move inwards

    }

    irrecv.resume(); // Restart the ISR state machine and Receive the next value
  }
}

int getSpeed(int &frontSpd)
{
  float weight_front = 500;
  float weight_back = 50;
  int backSpd = round(frontSpd * weight_front / weight_back);
  return backSpd;
}