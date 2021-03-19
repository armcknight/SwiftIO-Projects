//
//  DigitalOut.swift
//  Shared
//
//  Created by Andrew McKnight on 3/19/21.
//

import Foundation
import SwiftIO

extension DigitalOut {
    func turnOn() {
        write(false)
    }

    func turnOff() {
        write(true)
    }

    func blink(duration: Int = 1000) {
        turnOn()
        sleep(ms: duration)
        turnOff()
    }
}
