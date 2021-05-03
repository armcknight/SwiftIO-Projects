//
//  LEDs.swift
//  Shared
//
//  Created by Andrew McKnight on 3/19/21.
//

import Foundation
import SwiftIO

/// An `enum` representing the different colors displayable by the onboard LED on the Swift IO board, and operations that can be performed on them.
public enum OnboardLED: CaseIterable {
    case red
    case blue
    case green

    public func turnOn() {
        led.turnOn()
    }

    public func turnOff() {
        led.turnOff()
    }

    public func blink(duration: Int = 1000) {
        led.blink(duration: duration)
    }

    /// The underlying `DigitalOut` representations from the SwiftIO APi.
    private var led: DigitalOut {
        switch self {
        case .red: return DigitalOut(Id.RED)
        case .green: return DigitalOut(Id.GREEN)
        case .blue: return DigitalOut(Id.BLUE)
        }
    }
}
