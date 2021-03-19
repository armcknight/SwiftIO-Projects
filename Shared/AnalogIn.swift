//
//  AnalogIn.swift
//  Shared
//
//  Created by Andrew McKnight on 3/19/21.
//

import Foundation
import SwiftIO

public enum AnalogInput: CaseIterable {
    case a0

    /// The underlying `AnalogIn` representation from the SwiftIO API.
    private var analogIn: AnalogIn {
        switch self {
        case .a0: return AnalogIn(Id.A0)
        }
    }

    /// The percentage of the voltage of the `AnalogIn` in the range of 0.0 to 1.0.
    public var value: Float {
        return analogIn.readPercent()
    }
}
