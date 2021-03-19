//
//  main.swift
//  Blink
//
//  Created by Andrew McKnight on 3/18/21.
//

import SwiftIO

extension DigitalOut {
    func turnOn() {
        write(false)
    }

    func turnOff() {
        write(true)
    }

    func blink() {
        turnOn()
        sleep(ms: 1000)
        turnOff()
        sleep(ms: 1000)
    }
}

enum Color {
    case red
    case blue
    case green

    var led: DigitalOut {
        switch self {
        case .red: return DigitalOut(Id.RED)
        case .green: return DigitalOut(Id.GREEN)
        case .blue: return DigitalOut(Id.BLUE)
        }
    }

    init(_ n: Int) {
        switch n % 3 {
        case 0: self = .red
        case 1: self = .green
        case 2: self = .blue
        default: fatalError("💣")
        }
    }
}

var i = 0
while true {
    Color(i).led.blink()
    i += 1
}
