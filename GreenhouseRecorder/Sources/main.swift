//
//  main.swift
//  GreenhouseRecorder
//
//  Created by Andrew McKnight on 5/3/21.
//

import Foundation
import Shared
import SwiftIO

// Initialize the LCD and sensor to use the I2C communication.
let i2c = I2C(Id.I2C0)
let lcd = LCD1602J(i2c)
let sht = HumitureSHT3x(i2c)

let lightSensor = AnalogIn(Id.A0)

let bootTimeFile = FileDescriptor.open("/SD:/boottime.dat")
let bootTimeBuffer = UnsafeMutableRawBufferPointer.allocate(byteCount: 8, alignment: 4)
guard bootTimeFile.read(into: bootTimeBuffer) == 0 else {
    // TODO: flash LED red
    fatalError("couldn't read boot time")
}
bootTimeFile.close()
let asciiHexCodesToDigits = [
    "30": "0",
    "31": "1",
    "32": "2",
    "33": "3",
    "34": "4",
    "35": "5",
    "36": "6",
    "37": "7",
    "38": "8",
    "39": "9",
]


var shift = 0
var timestamp: UInt32 = 0
for byte: UInt8 in bootTimeBuffer.makeIterator() {
    timestamp += UInt32(byte) << shift
    shift += 8
}

enum DisplayMode {
    case humiture
    case light
    case time
}
var displayMode: DisplayMode = .humiture

func log(_ entry: String) {
    FileDescriptor.open("/SD:/sensor.log").do {
        $0.write(entry)
        $0.close()
    }
}

log("Timestamp (epoch ms),Temp (C),Humidity (%),Light (%),")

while true {
    let temp = sht.readTemperature()
    let hum = sht.readHumidity()
    let light = lightSensor.readPercent()

    let formattedTemp = temp.format(1)
    let formattedHum = hum.format(1)
    let formattedLight = light.format(1)

    lcd.write(x: 0, y: 0, "Temp @ humidity:")
    lcd.write(x: 0, y: 1, "\(formattedTemp) C @ \(formattedHum) %")

    let timestamp = 1

    log("\(timestamp),\(formattedTemp),\(formattedHum),\(formattedLight)")

    sleep(ms: 1000)
}
