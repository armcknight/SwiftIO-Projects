//
//  main.swift
//  HelloWorldLCD
//
//  Created by Andrew McKnight on 3/27/21.
//

/*
Mission9 “Hello World!” LCD

The LCD screen will print "Hello World!"

The circuit:
- Use LCD Module, and connect it to I2C0 Digital Jack.

created 2019
by Orange J

Try to shows the hours, minutes and seconds on the LCD.
This example code is in the public domain. Visit madmachine.io for more info.
*/

import Shared
import SwiftIO

// Initialize the I2C0 and the lcd.
let i2c = I2C(Id.I2C0)
let lcd = LCD1602J(i2c)

// Set the display area and print the message on the LCD.
lcd.write(x: 0, y: 0, "Hello World!")
