
/*
  IR Remote Control Test
  Reference: https://github.com/Arduino-IRremote/Arduino-IRremote#receiving-ir-codes
*/

#include <IRremote.hpp>

// IR remote
const int IR_RECEIVE_PIN = 7; // the pin where you connect the output pin of IR sensor

// Define variable to store last code received
unsigned long lastCode;

void setup()
{
  Serial.begin(9600);
  IrReceiver.begin(IR_RECEIVE_PIN, ENABLE_LED_FEEDBACK); // Start the receiver
}

void loop()
{
  if (IrReceiver.decode()) // Returns 0 if no data ready, 1 if data ready.
  {

    Serial.print("Code: ");
    Serial.println(IrReceiver.decodedIRData.decodedRawData, HEX);

    if (IrReceiver.decodedIRData.decodedRawData == 0x0) {
      // If Repeat then use last code received
      IrReceiver.decodedIRData.decodedRawData = lastCode;
    }
    else {
      lastCode = IrReceiver.decodedIRData.decodedRawData;
    }
    switch (IrReceiver.decodedIRData.decodedRawData) {

      case 0xBA45FF00: maneu_1(); break;
      case 0xB946FF00: maneu_2(); break;
      case 0xB847FF00: maneu_3(); break;
      case 0xBB44FF00: maneu_4(); break;
      case 0xBF40FF00: maneu_5(); break;
      case 0xBC43FF00: maneu_6(); break;
      case 0xF807FF00: maneu_7(); break;
      case 0xEA15FF00: maneu_8(); break;
      case 0xF609FF00: maneu_9(); break;
      case 0xE619FF00: maneu_0(); break;
      case 0xE916FF00: maneu_star(); break;
      case 0xF20DFF00: maneu_hash(); break;
      case 0xE31CFF00: maneu_ok(); break;
      case 0xF708FF00: maneu_left(); break;
      case 0xA55AFF00: maneu_right(); break;
      case 0xE718FF00: maneu_up(); break;
      case 0xAD52FF00: maneu_down(); break;
    }

    IrReceiver.resume(); // Restart the ISR state machine and Receive the next value
  }
}

void maneu_1() {
  Serial.println(1);
}

void maneu_2() {
  Serial.println(1);
}

void maneu_3() {
  Serial.println(1);
}

void maneu_4() {
  Serial.println(1);
}

void maneu_5() {
  Serial.println(1);
}

void maneu_6() {
  Serial.println(1);
}

void maneu_7() {
  Serial.println(1);
}

void maneu_8() {
  Serial.println(1);
}

void maneu_9() {
  Serial.println(1);
}

void maneu_0() {
  Serial.println(1);
}

void maneu_star() {
  Serial.println(1);
}

void maneu_hash() {
  Serial.println(1);
}

void maneu_ok() {
  Serial.println(1);
}

void maneu_left() {
  Serial.println(1);
}

void maneu_right() {
  Serial.println(1);
}

void maneu_up() {
  Serial.println(1);
}

void maneu_down() {
  Serial.println(1);
}
