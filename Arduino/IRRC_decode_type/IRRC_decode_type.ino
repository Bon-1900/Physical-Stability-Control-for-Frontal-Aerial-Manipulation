
/*
  Find decoding type of the IR Remote Control 
  Ref: https://dronebotworkshop.com/using-ir-remote-controls-with-arduino/
*/

#include <IRremote.h> 

// IR remote
int RECV_PIN = 7; // the pin where you connect the output pin of IR sensor
IRrecv irrecv(RECV_PIN);
decode_results results;

void setup()
{
  Serial.begin(9600);
  irrecv.enableIRIn();
  irrecv.blink13(true);
}

void loop()
{
  if (irrecv.decode(&results)) // Returns 0 if no data ready, 1 if data ready.
  {
    int readResults = results.value; // Results of decoding are stored

    Serial.print("Code: ");
    Serial.println(readResults, HEX); // prints the value a a button press
    //Serial.println(results.decode_type);

    switch (results.decode_type){
            case NEC: 
              Serial.println("NEC"); 
              break;
            case SONY: 
              Serial.println("SONY"); 
              break;
            case RC5: 
              Serial.println("RC5"); 
              break;
            case RC6: 
              Serial.println("RC6"); 
              break;
            case DISH: 
              Serial.println("DISH"); 
              break;
            case SHARP: 
              Serial.println("SHARP"); 
              break;
            case JVC: 
              Serial.println("JVC"); 
              break;
            case SAMSUNG: 
              Serial.println("SAMSUNG"); 
              break;
            case LG: 
              Serial.println("LG"); 
              break;
            case WHYNTER: 
              Serial.println("WHYNTER"); 
              break;
            case PANASONIC: 
              Serial.println("PANASONIC"); 
              break;
            case DENON: 
              Serial.println("DENON"); 
              break;
          default:
            case UNKNOWN: 
              Serial.println("UNKNOWN"); 
              break;
          }

    irrecv.resume(); // Restart the ISR state machine and Receive the next value
  }
}
