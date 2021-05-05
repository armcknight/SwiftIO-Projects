/*
  Mission4 potentiometer & RGB LED

  The LED blinks faster or slower in accordance with the potentiometer.

  The circuit:
  - Use Potentiometer Module, and connect it to an Analog Jack.
  - When the Arduino Sheild is properly plugged in, the LED will be turned on.

  created 2019
  by Orange J

  Try to use photoresistance to change the color of RGB LED.
  This example code is in the public domain.
  Visit madmachine.io for more info.
*/

import SwiftIO

let a0 = AnalogIn(Id.A0) // Initialize an AnalogIn pin A0.
let red = DigitalOut(Id.RED) // Initialize the red onboard led.
let blue = DigitalOut(Id.BLUE) // Initialize the red onboard led.

while true {
    // Return the percentage of the voltage in the range of 0.0 to 1.0.
    let value = a0.readPercent()
    red.toggle()
    sleep(ms: Int(value*250))
    red.toggle()
    sleep(ms: Int(value*250))
    blue.toggle()
    sleep(ms: Int(value*250))
    blue.toggle()
    sleep(ms: Int(value*250))

}
