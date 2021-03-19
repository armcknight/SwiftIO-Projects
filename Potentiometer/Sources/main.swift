//
//  main.swift
//  Blink
//
//  Created by Andrew McKnight on 3/18/21.
//

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

import Shared
import SwiftIO

while true {
    // blink durations from 0 ms to 250 ms
    Int(AnalogInput.a0.value * 250).do { duration in
        func blink(led: OnboardLED) {
            sleep(ms: duration)
            led.blink(duration: duration)
        }
        [OnboardLED.red, .blue].forEach(blink(led:))
    }
}
